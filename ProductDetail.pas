unit ProductDetail;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  Data.DB, Data.Win.ADODB;

type
  TProductDetailForm = class(TForm)
    ParametrGB: TGroupBox;
    Panel1: TPanel;
    SaveProdDetBtn: TBitBtn;
    CancelProdDetBtn: TBitBtn;
    Label1: TLabel;
    ArticEdit: TEdit;
    Label2: TLabel;
    NameEdit: TEdit;
    Label3: TLabel;
    CenaEdit: TEdit;
    Label4: TLabel;
    NDSEdit: TEdit;
    Label5: TLabel;
    EdIzmirEdit: TEdit;
    Label6: TLabel;
    EdIzmirUpakEdit: TEdit;
    Label7: TLabel;
    BalanceEdit: TEdit;
    GroupGB: TGroupBox;
    GGCB: TComboBox;
    GGroup: TLabel;
    GGBitBt: TBitBtn;
    GG1BitBt: TBitBtn;
    GG1CB: TComboBox;
    GGroup1: TLabel;
    GGroup3: TLabel;
    GG3CB: TComboBox;
    GG3BitBt: TBitBtn;
    GGroup4: TLabel;
    GG4CB: TComboBox;
    GG4BitBt: TBitBtn;
    GGroup2: TLabel;
    GG2CB: TComboBox;
    GG2BitBt: TBitBtn;
    GG5CB: TComboBox;
    GG5BitBt: TBitBtn;
    TypeTovaraEdit: TEdit;
    Label15: TLabel;
    VesEdit: TEdit;
    Label13: TLabel;
    GGroup5: TLabel;
    Group1DS: TADODataSet;
    Group2DS: TADODataSet;
    Group3DS: TADODataSet;
    Group4DS: TADODataSet;
    Group5DS: TADODataSet;
    Group6DS: TADODataSet;
    procedure Group1DSBeforeOpen(DataSet: TDataSet);
    procedure Group2DSBeforeOpen(DataSet: TDataSet);
    procedure Group3DSBeforeOpen(DataSet: TDataSet);
    procedure Group4DSBeforeOpen(DataSet: TDataSet);
    procedure Group5DSBeforeOpen(DataSet: TDataSet);
    procedure Group6DSBeforeOpen(DataSet: TDataSet);
    procedure GGBitBtClick(Sender: TObject);
    procedure GG1BitBtClick(Sender: TObject);
    procedure GG2BitBtClick(Sender: TObject);
    procedure GG3BitBtClick(Sender: TObject);
    procedure GG4BitBtClick(Sender: TObject);
    procedure GG5BitBtClick(Sender: TObject);
    procedure CenaEditKeyPress(Sender: TObject; var Key: Char);
    procedure VesEditKeyPress(Sender: TObject; var Key: Char);
    procedure NDSEditKeyPress(Sender: TObject; var Key: Char);
  private
  function CreateNewGroup(Str, StrName: string; Combo: TComboBox) : Boolean;
  procedure updateGroup(Combo : TComboBox; DataSet: TADODataset);
  procedure SetGroup();
    { Private declarations }
  public
  constructor Create(AOwner : TComponent); override;
  procedure CorrProduct (Article : integer) ;
  procedure GetProductDetail(Article : integer);
  procedure InsProduct();
    { Public declarations }
  end;

var
  ProductDetailForm: TProductDetailForm;

implementation

{$R *.dfm}

uses SConst, AppData, Tovar, Globals;

{ TProductDetailForm }


procedure TProductDetailForm.CenaEditKeyPress(Sender: TObject; var Key: Char);
begin
case Key of
    '0'..'9': ;
    ',','.': Begin
               if Key <> FormatSettings.DecimalSeparator then
                Key := FormatSettings.DecimalSeparator;

               if Pos(FormatSettings.DecimalSeparator, CenaEdit.Text) > 0 then
                 Key := #0;
             end;
    #8: ;
    #13: ;
    else
        Key := #0;
  end;
end;

procedure TProductDetailForm.CorrProduct(Article: integer);
begin
  if Article <>0 then
  try
    AppDM.Command.CommandText := Format(SSQLCorrProduct,[Article,
                                                              Trim(NameEdit.Text),
                                                                   CenaEdit.Text,
                                                                   EdIzmirEdit.Text,
                                                                   VesEdit.Text,
                                                                   BalanceEdit.Text,
                                                                   NDSEdit.Text,
                                                                   EdIzmirUpakEdit.Text,
                                                                   GGCB.Text,
                                                                   GG1CB.Text,
                                                                   GG2CB.Text,
                                                                   GG3CB.Text,
                                                                   GG4CB.Text,
                                                                   GG5CB.Text,
                                                                   Trim(TypeTovaraEdit.Text),
                                                                   g_User]);

  AppDM.Command.Execute;

  except
    on Err : exception do
      MessageDlg('Оштбка сохранения нового товара',mtError,[mbOK],0);
  end;
end;

constructor TProductDetailForm.Create(AOwner: TComponent);
begin
  inherited;
  SetGroup();
  {updateGroup(GGCB,Group1DS);
  updateGroup(GG1CB,Group2DS);
  updateGroup(GG2CB,Group3DS);
  updateGroup(GG3CB,Group4DS);
  updateGroup(GG4CB,Group5DS);
  updateGroup(GG5CB,Group6DS);}
end;

function TProductDetailForm.CreateNewGroup( Str, StrName: string;
  Combo: TComboBox): Boolean;
begin
  if InputQuery(StrName, 'Наименование', Str) then
  begin
    Str := Trim(str);
    Result := (Length(str) > 0) and (Combo.Items.IndexOf(str) < 0) ;
    if Result then
    begin
      Combo.Items.Add(str);
      Combo.ItemIndex := Combo.Items.IndexOf(str);
     //mbo.OnCloseUp(nil);
    end;
  end;
end;

procedure TProductDetailForm.GetProductDetail(Article: integer);
begin
  if Article <> 0 then
  begin
    try
      AppDM.ProductDetail.Active := false;
      AppDM.ProductDetail.CommandText := Format(SSQLGetProductDetail ,[Article]);
      AppDM.ProductDetail.Active := True;

      if not AppDM.ProductDetail.IsEmpty then
      begin
        NameEdit.Text := AppDM.ProductDetail.FieldByName('NAME_ARTIC').AsString;
        ArticEdit.Text := AppDM.ProductDetail.FieldByName('COD_ARTIC').AsString;
        CenaEdit.Text := AppDM.ProductDetail.FieldByName('CENA_ARTIC').AsString;
        EdIzmirEdit.Text := AppDM.ProductDetail.FieldByName('EDIN_IZMER').AsString;
        TypeTovaraEdit.Text := AppDM.ProductDetail.FieldByName('TYPE_TOVR').AsString;
        VesEdit.Text := AppDM.ProductDetail.FieldByName('VES_EDINIC').AsString;
        BalanceEdit.Text := AppDM.ProductDetail.FieldByName('KON_KOLCH').AsString;
        NDSEdit.Text := AppDM.ProductDetail.FieldByName('NDS_ARTIC').AsString;
        EdIzmirUpakEdit.Text := AppDM.ProductDetail.FieldByName('EDN_V_UPAC').AsString;

        GGCB.ItemIndex := GGCB.Items.IndexOf(AppDM.ProductDetail.FieldByName('NGROUP_TVR').AsString);
        GG1CB.ItemIndex := GG1CB.Items.IndexOf(AppDM.ProductDetail.FieldByName('NGROUP_TV2').AsString);
        GG2CB.ItemIndex := GG2CB.Items.IndexOf(AppDM.ProductDetail.FieldByName('NGROUP_TV3').AsString);
        GG3CB.ItemIndex := GG3CB.Items.IndexOf(AppDM.ProductDetail.FieldByName('NGROUP_TV4').AsString);
        GG4CB.ItemIndex := GG4CB.Items.IndexOf(AppDM.ProductDetail.FieldByName('NGROUP_TV5').AsString);
        GG5CB.ItemIndex := GG5CB.Items.IndexOf(AppDM.ProductDetail.FieldByName('NGROUP_TV6').AsString);
      end;
    finally

    end;
  end;
end;

procedure TProductDetailForm.GG1BitBtClick(Sender: TObject);
var str: string;
begin
  if CreateNewGroup(str, GGroup1.Caption, GG1CB) then
     GG1CB.SetFocus();
end;

procedure TProductDetailForm.GG2BitBtClick(Sender: TObject);
var str: string;
begin
  if CreateNewGroup(str, GGroup2.Caption, GG2CB) then
     GG2CB.SetFocus();
end;

procedure TProductDetailForm.GG3BitBtClick(Sender: TObject);
var str: string;
begin
  if CreateNewGroup(str, GGroup3.Caption, GG3CB) then
     GG3CB.SetFocus();
end;

procedure TProductDetailForm.GG4BitBtClick(Sender: TObject);
var str: string;
begin
  if CreateNewGroup(str, GGroup4.Caption, GG4CB) then
     GG4CB.SetFocus();
end;

procedure TProductDetailForm.GG5BitBtClick(Sender: TObject);
var str: string;
begin
  if CreateNewGroup(str, GGroup5.Caption, GG5CB) then
     GG5CB.SetFocus();
end;

procedure TProductDetailForm.GGBitBtClick(Sender: TObject);
var str: string;
begin
  if CreateNewGroup(str, GGroup.Caption, GGCB) then
     GGCB.SetFocus();
end;

procedure TProductDetailForm.Group1DSBeforeOpen(DataSet: TDataSet);
begin
  Group1DS.CommandText := SSQLGroup;
end;

procedure TProductDetailForm.Group2DSBeforeOpen(DataSet: TDataSet);
begin
  Group2DS.CommandText := SSQLGroup1;
end;

procedure TProductDetailForm.Group3DSBeforeOpen(DataSet: TDataSet);
begin
   Group3DS.CommandText := SSQLGroup2;
end;

procedure TProductDetailForm.Group4DSBeforeOpen(DataSet: TDataSet);
begin
  Group4DS.CommandText := SSQLGroup3;
end;

procedure TProductDetailForm.Group5DSBeforeOpen(DataSet: TDataSet);
begin
   Group5DS.CommandText := SSQLGroup4;
end;

procedure TProductDetailForm.Group6DSBeforeOpen(DataSet: TDataSet);
begin
   Group6DS.CommandText := SSQLGroup5;
end;

procedure TProductDetailForm.InsProduct;
begin
if length(trim(NameEdit.Text)) > 0 then
  try
    AppDM.Command.CommandText := Format(SSQLInsProduct,[ Trim(NameEdit.Text),
                                                                   CenaEdit.Text,
                                                                   EdIzmirEdit.Text,
                                                                   VesEdit.Text,
                                                                   BalanceEdit.Text,
                                                                   NDSEdit.Text,
                                                                   EdIzmirUpakEdit.Text,
                                                                   GGCB.Text,
                                                                   GG1CB.Text,
                                                                   GG2CB.Text,
                                                                   GG3CB.Text,
                                                                   GG4CB.Text,
                                                                   GG5CB.Text,
                                                                   Trim(TypeTovaraEdit.Text),
                                                                   g_User]);

  AppDM.Command.Execute;

  except
    on Err : exception do
      MessageDlg('Ошибка сохранения нового товара',mtError,[mbOK],0);
  end;
end;

procedure TProductDetailForm.NDSEditKeyPress(Sender: TObject; var Key: Char);
begin
case Key of
    '0'..'9': ;
    ',','.': Begin
               if Key <> FormatSettings.DecimalSeparator then
                Key := FormatSettings.DecimalSeparator;

               if Pos(FormatSettings.DecimalSeparator, CenaEdit.Text) > 0 then
                 Key := #0;
             end;
    #8: ;
    #13: ;
    else
        Key := #0;
  end;
end;

procedure TProductDetailForm.SetGroup;
begin
    try
      updateGroup(GGCB, Group1DS);
      updateGroup(GG1CB, Group2DS);
      updateGroup(GG2CB, Group3DS);
      updateGroup(GG3CB, Group4DS);
      updateGroup(GG4CB, Group5DS);
      updateGroup(GG5CB, Group6DS);
    except
    on Err : Exception do
      MessageDlg('Ошибка получение групп',mtError, [mbOK],0);
    end;
end;

procedure TProductDetailForm.updateGroup(Combo: TComboBox;
  DataSet: TADODataset);
var
  str : string;
begin
  DataSet.Active := false;
  DataSet.Active := true;

  if DataSet.RecordCount > 0 then
  try
    Combo.Items.BeginUpdate;
    Combo.Items.Clear;


    while not DataSet.Eof do
    begin
        Combo.Items.Add(DataSet.FieldByName('NGROUP_TVR').AsString);
        DataSet.Next;
    end;
  finally

  end;
end;

procedure TProductDetailForm.VesEditKeyPress(Sender: TObject; var Key: Char);
begin
case Key of
    '0'..'9': ;
    ',','.': Begin
               if Key <> FormatSettings.DecimalSeparator then
                Key := FormatSettings.DecimalSeparator;

               if Pos(FormatSettings.DecimalSeparator, VesEdit.Text) > 0 then
                 Key := #0;
             end;
    #8: ;
    #13: ;
    else
        Key := #0;
  end;
end;

end.
