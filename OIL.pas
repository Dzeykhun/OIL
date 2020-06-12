unit OIL;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.Menus,
  Vcl.ComCtrls, Vcl.ExtCtrls, System.Actions, Vcl.ActnList, System.ImageList,
  Vcl.ImgList, Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TMainForm = class(TForm)
    PC: TPageControl;
    ResterNaklPC: TTabSheet;
    ReportPC: TTabSheet;
    Menu: TMainMenu;
    N1: TMenuItem;
    CarMenu: TMenuItem;
    InsuranceMenu: TMenuItem;
    TopPanel: TPanel;
    ButtonPanel: TPanel;
    AL: TActionList;
    IL: TImageList;
    CarAction: TAction;
    InsuranseAction: TAction;
    NaklGrid: TDBGrid;
    MoveGrid: TDBGrid;
    Splitter1: TSplitter;
    PrintGB: TGroupBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ResterAction: TAction;
    DocAction: TAction;
    RangeGB: TGroupBox;
    RangeLbl: TLabel;
    RefreshBitBt: TBitBtn;
    NewNaklAction: TAction;
    CorrNaklAction: TAction;
    DelNaklAction: TAction;
    RefreshNaklAction: TAction;
    CheckNaklAction: TAction;
    UnCheckNaklAction: TAction;
    RangeAction: TAction;
    ArchiveChB: TCheckBox;
    PM: TPopupMenu;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    ProductAction: TAction;
    TovarMenu: TMenuItem;
    ResterMenu: TMenuItem;
    procedure CarMenuClick(Sender: TObject);
    procedure InsuranceMenuClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RangeActionExecute(Sender: TObject);
    procedure RefreshNaklActionExecute(Sender: TObject);
    procedure RangeLblClick(Sender: TObject);
    procedure DelNaklActionExecute(Sender: TObject);
    procedure ProductActionExecute(Sender: TObject);
  private
    Fenddate: TDateTime;
    Fbegdate: TDateTime;
    procedure SetRangeDate(BegD, EndD : TDateTime);
    procedure Setbegdate(const Value: TDateTime);
    procedure Setenddate(const Value: TDateTime);
    procedure CreateChild(FormClass: TFormClass; var Ref);
    { Private declarations }
  public

    { Public declarations }
  published

  property begdate: TDateTime read Fbegdate write Setbegdate;
  property enddate: TDateTime read Fenddate write Setenddate;


  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

uses AppData, Main, SConst, Insurance, CarDetail, InsuranceDetail, Date, Fuel,
   Tovar, Child, ProductDetail;

procedure TMainForm.CreateChild(FormClass: TFormClass; var Ref);
begin
if Assigned(TChildForm(Ref)) then
  begin
    if TChildForm(Ref).WindowState = wsMinimized then
      TChildForm(Ref).Perform(WM_SYSCOMMAND, SC_RESTORE, 0);
    TChildForm(Ref).BringToFront();
  end else
    Application.CreateForm(FormClass, Ref);
end;

procedure TMainForm.DelNaklActionExecute(Sender: TObject);
begin
   if (appdm.Nakl.Active) and (not AppDM.Nakl.IsEmpty) then
       begin
         if MessageBox(handle, 'Вы действительно хотите удалить документ?' , 'Удаление документа' ,MB_ICONQUESTION + MB_YESNO )= IDYES then
         try
          AppDM.Command.CommandText := format(SSQLNaklDelete,[AppDM.Nakl.FieldByName('UNICUM_NUM').AsInteger]);
         finally
          RefreshNaklActionExecute(self);
         end;

       end;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  SetRangeDate(now(), now()+1);
end;

procedure TMainForm.CarMenuClick(Sender: TObject);
var
    CarF: TCarForm;
begin
  CarF := TCarForm.Create(Application);

  try
    AppDM.Cars.Active := False;
    AppDM.Cars.CommandText := Format(SSQLGetCars,[0]);
    AppDM.Cars.Active := True;


    Visible := true;
    CarF.FormStyle := fsNormal;
    BorderStyle := bsSizeable;
    CarF.WindowState := wsMaximized;

    CarF.Show;
  finally
   // FreeAndNil(CarF);
  end;

end;

procedure TMainForm.InsuranceMenuClick(Sender: TObject);
var
  InsF: TInsuranceForm;
begin
  InsF := TInsuranceForm.Create(Application);

  try
    InsF.BegDate := now();
    insf.EndDate := insf.BegDate + 1;
    INSF.RefreshActionExecute(SELF);
    insF.ShowModal;
  finally
    FreeAndNil(InsF);
  end;

end;

procedure TMainForm.ProductActionExecute(Sender: TObject);
//var Prodf: TProductForm;
begin
  {ProdF := TProductForm.Create(0);

  try
    AppDM.Product.Active := False;
    AppDM.Product.CommandText := SSQLGetProd;
    AppDM.Product.Active := True;
    ProdF.ShowModal;
  finally
    FreeAndNil(ProdF);
  end;}
  CreateChild(TProductForm, ProductForm);
end;

procedure TMainForm.RangeActionExecute(Sender: TObject);
var
   rangef : TRangeForm;
begin
  rangef := TRangeForm.Create(Application);
  try
    with rangef do
    begin
      BegDTP.Date := begdate;
      EndDTP.Date := enddate;


      if ShowModal = mrOk then
      SetRangeDate(BegDTP.Date,EndDTP.Date);
    end;
  finally

  end;
end;

procedure TMainForm.RangeLblClick(Sender: TObject);
begin
  RangeActionExecute(self);
end;

procedure TMainForm.RefreshNaklActionExecute(Sender: TObject);
begin
    try
      screen.Cursor := crSQLWait;
      AppDM.Nakl.Active := false;
      AppDM.Nakl.CommandText := format(SSQLGetNakl,[FormatDateTime('yyyy-mm-dd',begdate),
                                                    FormatDateTime('yyyy-mm-dd',enddate),
                                                    byte(ArchiveChB.Checked)]);
      AppDM.Nakl.Active := true;
    finally
      Screen.Cursor := crDefault;
    end;
end;

procedure TMainForm.Setbegdate(const Value: TDateTime);
begin
  Fbegdate := Value;
end;

procedure TMainForm.Setenddate(const Value: TDateTime);
begin
  Fenddate := Value;
end;

procedure TMainForm.SetRangeDate(BegD, EndD: TDateTime);
begin
  begdate := BegD;
  enddate := endD;


  RangeLbl.Caption := Format(SRange, [FormatDateTime('dd-mm-yyyy', begdate),
                                       FormatDateTime('dd-mm-yyyy', enddate)])
  end;

end.
