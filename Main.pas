unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.ImageList, Vcl.ImgList,
  System.Actions, Vcl.ActnList, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.Menus, Vcl.ComCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, Data.Win.ADODB, System.StrUtils;

type
  TCarForm = class(TForm)
    HeadPanel: TPanel;
    AL: TActionList;
    IL: TImageList;
    AddAction: TAction;
    CorrAction: TAction;
    DeleteAction: TAction;
    TransferAction: TAction;
    RefreshAction: TAction;
    FiendAction: TAction;
    StatusBar1: TStatusBar;
    GridsGB: TGroupBox;
    CarGrid: TDBGrid;
    DetailGB: TGroupBox;
    Splitter1: TSplitter;
    PassportGB: TGroupBox;
    Label1: TLabel;
    PassNumLbl: TLabel;
    Label2: TLabel;
    PassSerialLbl: TLabel;
    Label3: TLabel;
    MaxMassLbl: TLabel;
    Label4: TLabel;
    NoLoadLbl: TLabel;
    InsuranceGB: TGroupBox;
    label10: TLabel;
    InsSerialLbl: TLabel;
    InsNumLbl: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    BeginDateLbl: TLabel;
    Label8: TLabel;
    EndDateLbl: TLabel;
    GroupBox1: TGroupBox;
    Label7: TLabel;
    Label9: TLabel;
    DocSerialLbl: TLabel;
    DocNumLbl: TLabel;
    Label15: TLabel;
    Label14: TLabel;
    ChassisLbl: TLabel;
    StateLbl: TLabel;
    PrimechGB: TGroupBox;
    PrimechMemo: TMemo;
    BtnsPanel: TPanel;
    AddBitBt: TBitBtn;
    CorBitBt: TBitBtn;
    DeleteBitBt: TBitBtn;
    TransferBitBt: TBitBtn;
    RefreshBitBt: TBitBtn;
    SearchGB: TGroupBox;
    SearchEdit: TEdit;
    SearchBtn: TBitBtn;
    ReserveChB: TCheckBox;
    SetInsDetailBitBt: TBitBtn;
    FindCB: TComboBox;
    StoryBtn: TBitBtn;
    PM: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    StoryAction: TAction;
    procedure CarGridTitleClick(Column: TColumn);
    procedure AddActionExecute(Sender: TObject);
    procedure RefreshActionExecute(Sender: TObject);
    procedure CarGridDblClick(Sender: TObject);
    procedure CarGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure CorrActionExecute(Sender: TObject);
    procedure DeleteActionExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);


  private
    { Private declarations }
    procedure SetLimitSetting();
  public
    { Public declarations }
    procedure SetCarDetail();
    constructor Create(value: ShortInt); overload;
  end;

var
  CarForm: TCarForm;

implementation

{$R *.dfm}

uses AppData, CarDetail, SConst;

procedure TCarForm.AddActionExecute(Sender: TObject);
var
    CarDetail : TCarDetailForm ;
begin
  CarDetail := TCarDetailForm.Create(Application);
  try
     if CarDetail.ShowModal = mrOk then
     with CarDetail do
        begin
          AppDM.Command.CommandText :=Format(SSQLInsCar,[Trim(REGSymbolEdit.Text),
                                                         Trim(VinEdit.Text),
                                                         Trim(ModelEdit.Text),
                                                         Trim(TypeEdit.Text),
                                                         CategoryCB.Text,
                                                         YearEdit.Value,
                                                         Trim(CarcassEdit.Text),
                                                         Trim(ColorEdit.Text),
                                                         PowerEdit.Text,
                                                         Trim(EcologyEdit.Text),
                                                         Byte(CarDetail.ReserveChB.Checked),
                                                         'ADE',


                                                         StrToInt(IfThen(PasSerialEdit.Text = EmptyStr,'0', PasSerialEdit.Text)),
                                                         StrToInt(IfThen(PasNumEdit.Text = EmptyStr,'0', PasNumEdit.Text)),
                                                         MaxMassEdit.Text,
                                                         MassLoadOutEdit.Text,
                                                         uid_insurance,
                                                         ChassisEdit.Text,
                                                         StateCB.Text,
                                                         StrToInt(IfThen(DocSerialEdit.Text = EmptyStr, '0', DocSerialEdit.Text)),
                                                         StrToInt(IfThen(DocNumEdit1.Text = EmptyStr, '0', DocNumEdit1.Text)),
                                                         CarDetail.PrimechMemo.Text
                                                                        ] );
          AppDM.Command.Execute;
        end;
  finally
    FreeAndNil(CarDetail);
    RefreshActionExecute(Self);
  end;
end;

procedure TCarForm.CarGridDblClick(Sender: TObject);
begin
  SetCarDetail();
end;

procedure TCarForm.CarGridDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
if AppDM.Cars.FieldByName('Reserve').AsBoolean = True then
    begin
      with CarGrid.Canvas do
      Begin
        Brush.Color := clRed;
      end;
      CarGrid.DefaultDrawColumnCell(Rect, DataCol, Column, State);
    end;

end;

procedure TCarForm.CarGridTitleClick(Column: TColumn);
var
  Str: string;
begin
  if Assigned(Column) and Assigned(Column.Field) and
    (Column.Field.FieldKind = fkData) then
    with TADODataset(Column.Grid.DataSource.Dataset) do
    begin
      Str := Column.FieldName;
      if Pos(Str, IndexFieldNames) = 0 then
        IndexFieldNames := Str
      else
      if Pos('DESC', IndexFieldNames) > 0 then
        IndexFieldNames := Str
      else
        IndexFieldNames := Str + ' DESC';
    end;
end;

procedure TCarForm.CorrActionExecute(Sender: TObject);
var
    CarD : TCarDetailForm;
begin
  CarD := TCarDetailForm.Create(Application);
  AppDM.CarsDetail.Active := false;
  AppDM.CarsDetail.CommandText := Format(SSQLGetCarDetail,[AppDM.Cars.FieldByName('UID').AsInteger]);
  AppDM.CarsDetail.Active := True;

  if (AppDM.Cars.Active) and (not AppDM.Cars.IsEmpty) then
    try
      with CarD do
      begin
        REGSymbolEdit.Text := AppDM.Cars.FieldByName('REG_SYBMOL').AsString;
        VinEdit.Text := AppDM.Cars.FieldByName('VIN').AsString;
        ModelEdit.Text := AppDM.Cars.FieldByName('MODEL').AsString;
        TypeEdit.Text := AppDM.Cars.FieldByName('TYPE_TC').AsString;
        CategoryCB.ItemIndex := CategoryCB.Items.IndexOf(AppDM.Cars.FieldByName('CATEGORY').AsString);
        YearEdit.Value := AppDM.Cars.FieldByName('MADEYEAR').AsInteger;
        CarcassEdit.Text := AppDM.Cars.FieldByName('CARCASS').AsString;
        ColorEdit.Text := AppDM.Cars.FieldByName('COLOR').AsString;
        PowerEdit.Text := AppDM.Cars.FieldByName('MOTOR_POWER').AsString;
        EcologyEdit.Text := AppDM.Cars.FieldByName('ECOLOGY').AsString;
        CarD.ReserveChB.Checked := AppDM.Cars.FieldByName('Reserve').AsBoolean;
        StateCB.ItemIndex := StateCB.Items.IndexOf(AppDM.CarsDetail.FieldByName('WORKSTATE').AsString);
        PasSerialEdit.Text := AppDM.CarsDetail.FieldByName('PASSPORT_SERIAL').AsString;
        PasNumEdit.Text := AppDM.CarsDetail.FieldByName('PASSPORT_NUM').AsString;
        MaxMassEdit.Text := AppDM.CarsDetail.FieldByName('MASS_MAX').AsString;
        MassLoadOutEdit.Text := AppDM.CarsDetail.FieldByName('MASS_LOADOUT').AsString;
        InsuranceSerialEdit.Text := AppDM.CarsDetail.FieldByName('INS_SERIAL').AsString;
        Insuran�eNumEdit.Text := AppDM.CarsDetail.FieldByName('INS_NUM').AsString;
        DateBegPicker.Date := AppDM.CarsDetail.FieldByName('BEGDATE').AsDateTime;
        DateEndPicker.Date := AppDM.CarsDetail.FieldByName('ENDDATE').AsDateTime;
        DocNumEdit1.Text := AppDM.CarsDetail.FieldByName('DOC_NUM').AsString;
        DocSerialEdit.Text := AppDM.CarsDetail.FieldByName('DOC_SERIAL').AsString;
        ChassisEdit.Text := AppDM.CarsDetail.FieldByName('CHASSIS').AsString;
        PrimechMemo.Text := AppDM.CarsDetail.FieldByName('PRIMECH').AsString;
if ShowModal = mrOk then
            try
              AppDM.Command.CommandText := Format(SSQLCorrCar, [AppDM.Cars.FieldByName('UID').AsInteger,
                                                                  Trim(IfThen(RegSymbolEdit.Text = EmptyStr, '0', RegSymbolEdit.Text)),
                                                                  Trim(VinEdit.Text),
                                                                  Trim(ModelEdit.Text),
                                                                  Trim(TypeEdit.Text),
                                                                  CategoryCB.Text,
                                                                  YearEdit.Value,
                                                                  Trim(CarcassEdit.Text),
                                                                  Trim(ColorEdit.Text),
                                                                  PowerEdit.Text,
                                                                  Trim(EcologyEdit.Text),
                                                                  Byte(CarD.ReserveChB.Checked),
                                                                  'ADE',

                                                                  StrToInt(IfThen(PasSerialEdit.Text = EmptyStr, '0', PasSerialEdit.Text)),
                                                                  StrToInt(IfThen(PasNumEdit.Text = EmptyStr, '0', PasNumEdit.Text)),
                                                                  MaxMassEdit.Text,
                                                                  MassLoadOutEdit.Text,
                                                                  UID_Insurance,
                                                                  Trim(ChassisEdit.Text),
                                                                  StateCB.Text,
                                                                  StrToInt(IfThen(DocSerialEdit.Text = EmptyStr, '0', DocSerialEdit.Text)),
                                                                  StrToInt(IfThen(DocNumEdit1.Text = EmptyStr, '0', DocNumEdit1.Text)),
                                                                  Trim(CarD.PrimechMemo.Text)]);
              AppDM.Command.Execute;
            except
              on Err: Exception do
                ShowMessage('������ ������������� ����������!' + #13 + '���������: ' + Err.Message);
            end;
      end;

    finally
      FreeAndNil(CarD);
      RefreshActionExecute(Self);
    end;

end;

constructor TCarForm.create(value: ShortInt);
begin
  Inherited create(Application);

  case value of
   0: ;    //
   1:SetLimitSetting();    //�����
  end;
end;


procedure TCarForm.DeleteActionExecute(Sender: TObject);
begin

       if (AppDM.Cars.Active) and (not AppDM.Cars.IsEmpty) then
       try
         if MessageBox(Handle, '�� ������������� ������ ������� ��������?',  '������� ��������', MB_ICONSTOP + MB_YESNO) = ID_YES then
         try
          AppDM.Command.CommandText := format(SSQLDeleteInsuranse, [AppDM.Insurance.FieldByName('UID').AsInteger]);
          appdm.Command.Execute;
         except
            on Err : exception do
            MessageDlg('������ ����������� ��������� ���������� ���������' + #13 + '���������' + Err.Message, mtError ,[mbOK],0 );
         end;
       finally
         RefreshActionExecute(self);
       end;
end;

procedure TCarForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TCarForm.RefreshActionExecute(Sender: TObject);
begin
  AppDM.Cars.Active := false;
  AppDM.Cars.CommandText := Format(SSQLGetCars,[byte(ReserveChB.Checked)]);
  AppDM.Cars.Active := True;
end;

procedure TCarForm.SetCarDetail;
begin
  AppDM.CarsDetail.Active := False;
  AppDM.CarsDetail.CommandText := Format(SSQLGetCarDetail,[AppDM.Cars.FieldByName('UID').AsInteger]);
  AppDM.CarsDetail.Active := True;

  if not AppDM.CarsDetail.IsEmpty then
  try
    PassSerialLbl.Caption := AppDM.CarsDetail.FieldByName('PASSPORT_SERIAL').AsString;
    PassNumLbl.Caption := AppDM.CarsDetail.FieldByName('PASSPORT_NUM').AsString;
    MaxMassLbl.Caption := AppDM.CarsDetail.FieldByName('MASS_MAX').AsString;
    NoLoadLbl.Caption := AppDM.CarsDetail.FieldByName('MASS_LOADOUT').AsString;
    InsSerialLbl.Caption := AppDM.CarsDetail.FieldByName('INS_SERIAL').AsString;
    InsNumLbl.Caption := AppDM.CarsDetail.FieldByName('INS_NUM').AsString;
    BeginDateLbl.Caption := AppDM.CarsDetail.FieldByName('BEGDATE').AsString;
    EndDateLbl.Caption := AppDM.CarsDetail.FieldByName('ENDDATE').AsString;
    DocNumLbl.Caption := AppDM.CarsDetail.FieldByName('DOC_NUM').AsString;
    DocSerialLbl.Caption := AppDM.CarsDetail.FieldByName('DOC_SERIAL').AsString;
    ChassisLbl.Caption := AppDM.CarsDetail.FieldByName('CHASSIS').AsString;
    StateLbl.Caption := AppDM.CarsDetail.FieldByName('WORKSTATE').AsString;
    PrimechMemo.Text := AppDM.CarsDetail.FieldByName('PRIMECH').AsString;
  except
    on Err : Exception do
      ShowMessage('������ ��������� ���������� ������.' + #13 + ' ��������� ' + err.Message);
  end;
end;

procedure TCarForm.SetLimitSetting;
begin
    AppDM.Cars.Active := False;
    AppDM.Cars.CommandText := Format(SSQLGetCars,[0]);
    AppDM.Cars.Active := True;


  try
    AddAction.Enabled := False;
    CorrAction.Enabled := False;
    DeleteAction.Enabled := False;
    TransferAction.Enabled := False;
    ReserveChB.Enabled := false;
    PrimechGB.Visible := false;

    with CarGrid do
        Begin
          Columns[9].Visible := False;
          Columns[10].Visible := False;
          Columns[11].Visible := False;
          Columns[12].Visible := False;
          Columns[13].Visible := False;
          Columns[14].Visible := False;
          Columns[15].Visible := False;
        end;



    with SetInsDetailBitBt do
    begin
        Parent := BtnsPanel;
        Left := TransferBitBt.Left;
        top := TransferBitBt.top;
        Visible := true;
        ModalResult := mrOk;
    end;
    self.Height := 750;
    self.Width := 1162;
  finally

  end;
end;


end.
