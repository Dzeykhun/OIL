unit InsuranceDetail;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls,
  Vcl.Buttons;

type
  TInsuranceDetailForm = class(TForm)
    DocGB: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    SerialEdit: TEdit;
    NumberEdit: TEdit;
    ReserveCB: TCheckBox;
    DocDP: TDateTimePicker;
    DateDocGB: TGroupBox;
    Label4: TLabel;
    BegDP: TDateTimePicker;
    Label5: TLabel;
    EndDP: TDateTimePicker;
    Panel1: TPanel;
    PrimechGB: TGroupBox;
    CarGB: TGroupBox;
    SaveBitBt: TBitBtn;
    CanelBitBt: TBitBtn;
    PrimechMemo: TMemo;
    CarBitBt: TBitBtn;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    ModelCarEdit: TEdit;
    RegSymCarEdit: TEdit;
    TypeCarEdit: TEdit;
    ColorCarEdit: TEdit;
    YearCarEdit: TEdit;
    procedure CarBitBtClick(Sender: TObject);
    procedure BegDPChange(Sender: TObject);
  private
    FUID_Car: integer;
    procedure SetUID_Car(const Value: integer);
    procedure CorrDP() ;
    procedure SetLimitSetting() ;
    { Private declarations }
  public
    constructor create(value : shortint) ; overload ;
    { Public declarations }
  published
    property UID_Car: integer read FUID_Car write SetUID_Car default 0;
  end;

var
  InsuranceDetailForm: TInsuranceDetailForm;

implementation

{$R *.dfm}

uses Main, AppData, SConst, Globals;

procedure TInsuranceDetailForm.BegDPChange(Sender: TObject);
begin
  CorrDP();
end;

procedure TInsuranceDetailForm.CarBitBtClick(Sender: TObject);
var
    CarF : TCarForm;
begin
  CarF := TCarForm.create(g_corr);
  try
      if Carf.ShowModal = mrOk then
      try
        ModelCarEdit.Text := AppDM.Cars.FieldByName('MODEL').AsString;
        RegSymCarEdit.Text := AppDM.Cars.FieldByName('REG_SYBMOL').AsString;
        TypeCarEdit.Text := AppDM.Cars.FieldByName('TYPE_TC').AsString;
        YearCarEdit.Text := AppDM.Cars.FieldByName('MADEYEAR').AsString;
        ColorCarEdit.Text := AppDM.Cars.FieldByName('COLOR').AsString;
        UID_Car := AppDM.Cars.FieldByName('UID').AsInteger;
      finally
      end;
  finally
    FreeAndNil(CarF);
  end;
end;

procedure TInsuranceDetailForm.CorrDP;
begin
  if BegDP.Date > EndDP.Date then
    EndDP.Date := BegDP.Date;
end;

constructor TInsuranceDetailForm.create(value: shortint);
begin
   inherited create(application);

    case value of
       g_new:  ;
       g_corr: ;
       g_view: SetLimitSetting();
    end;
end;

procedure TInsuranceDetailForm.SetLimitSetting;
begin

                  try
                  DocGB.Enabled := False;
                  DateDocGB.Enabled := False;
                  CarGB.Enabled := False;
                  PrimechGB.Enabled := False;
                  SaveBitBt.Enabled := False;
                  except
                       ShowMessage('Ошибка огрничения действий в модуле');
                  end;
end;

procedure TInsuranceDetailForm.SetUID_Car(const Value: integer);
begin
  FUID_Car := Value;
end;

end.
