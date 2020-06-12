unit CarDetail;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.Samples.Spin, Vcl.ComCtrls;

type
  TCarDetailForm = class(TForm)
    TehPropGB: TGroupBox;
    Panel1: TPanel;
    InsuranceGB: TGroupBox;
    OkBitBt: TBitBtn;
    ChanelBitBt: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    PssprotGB: TGroupBox;
    Label13: TLabel;
    Label14: TLabel;
    SvidetGB: TGroupBox;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    REGSymbolEdit: TEdit;
    VinEdit: TEdit;
    ModelEdit: TEdit;
    TypeEdit: TEdit;
    CategoryCB: TComboBox;
    YearEdit: TSpinEdit;
    ChassisEdit: TEdit;
    CarcassEdit: TEdit;
    ColorEdit: TEdit;
    PowerEdit: TEdit;
    EcologyEdit: TEdit;
    Label12: TLabel;
    Label21: TLabel;
    PasNumEdit: TEdit;
    PasSerialEdit: TEdit;
    MaxMassEdit: TEdit;
    MassLoadOutEdit: TEdit;
    Insuran�eNumEdit: TEdit;
    InsuranceSerialEdit: TEdit;
    DateBegPicker: TDateTimePicker;
    DateEndPicker: TDateTimePicker;
    DocNumEdit1: TEdit;
    DocSerialEdit: TEdit;
    ReserveChB: TCheckBox;
    Label22: TLabel;
    StateCB: TComboBox;
    PrimechGB: TGroupBox;
    PrimechMemo: TMemo;
    InsBitBt: TBitBtn;
    procedure InsBitBtClick(Sender: TObject);
  private
    Fuid_insurance: integer;
    procedure Setuid_insurance(const Value: integer);
    { Private declarations }
  public
    constructor create(Value: Shortint);  overload;
//  constructor create(TypeMove: integer);
    { Public declarations }
    published
    property uid_insurance : integer read Fuid_insurance write Setuid_insurance default 0;
  end;

var
  CarDetailForm: TCarDetailForm;

implementation

{$R *.dfm}

uses AppData, Insurance, SConst, Globals;

{ TCarDetailForm }


constructor TCarDetailForm.create(Value: Shortint);
begin
  inherited create(application);

    case value of
       g_new:  ;
       g_corr: ;
       g_view: begin
                  TehPropGB.Enabled := False;
                  PssprotGB.Enabled := false;
                  InsuranceGB.Enabled := false;
                  SvidetGB.Enabled := false;
                  PrimechGB.Enabled := false;
                  OkBitBt.Enabled := false;
               end;
    end;
end;

procedure TCarDetailForm.InsBitBtClick(Sender: TObject);
var
  insf : TInsuranceForm;
begin
  insF := TInsuranceForm.create(g_corr);

  try
      with insf do
      begin
        if ShowModal = mrok then
        begin
          try
              InsuranceSerialEdit.Text := AppDM.Insurance.FieldByName('SERIAL').AsString;
              Insuran�eNumEdit.Text := AppDM.Insurance.FieldByName('NUMBER').AsString;
              DateBegPicker.Date := AppDM.Insurance.FieldByName('BEGDATE').AsDateTime;
              DateEndPicker.Date := AppDM.Insurance.FieldByName('ENDDATE').AsDateTime;
              uid_insurance := AppDM.Insurance.FieldByName('UID').AsInteger;
          except
            on Err : Exception  do
              MessageDlg('������' + #13 + '� ��������� ���������' + #13 + '���������: '+ err.message, mtError, [mbOK], 0);
          end;
        end;
      end;
  finally
    FreeAndNil(insF);
  end;
end;

procedure TCarDetailForm.Setuid_insurance(const Value: integer);
begin
  Fuid_insurance := Value;
end;

end.
