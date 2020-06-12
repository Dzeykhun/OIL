unit AppData;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB;

type
  TAppDM = class(TDataModule)
    Connection: TADOConnection;
    Cars: TADODataSet;
    DS_Cars: TDataSource;
    Command: TADOCommand;
    DS_CarsDetail: TDataSource;
    CarsDetail: TADODataSet;
    CarsUID: TIntegerField;
    CarsCATEGORY: TStringField;
    CarsMADEYEAR: TIntegerField;
    CarsCARCASS: TStringField;
    CarsCOLOR: TStringField;
    CarsMOTOR_POWER: TFloatField;
    CarsECOLOGY: TStringField;
    CarsRESERVE: TBooleanField;
    CarsDetailROWID: TIntegerField;
    CarsDetailUID_CARS: TIntegerField;
    CarsDetailPASSPORT_NUM: TIntegerField;
    CarsDetailPASSPORT_SERIAL: TIntegerField;
    CarsDetailMASS_MAX: TFloatField;
    CarsDetailMASS_LOADOUT: TFloatField;
    CarsDetailINS_NUM: TIntegerField;
    CarsDetailINS_SERIAL: TIntegerField;
    CarsDetailCHASSIS: TStringField;
    CarsDetailWORKSTATE: TStringField;
    CarsDetailPRIMECH: TStringField;
    CarsCREATE_DATE: TDateTimeField;
    CarsFAMILY: TStringField;
    CarsWHO_CORR: TStringField;
    CarsDetailPASSPORT: TStringField;
    CarsCORR_DATE: TDateTimeField;
    CarsDetailDOC_NUM: TIntegerField;
    CarsDetailDOC_SERIAL: TIntegerField;
    CarsDetailINS_Uid: TIntegerField;
    Insurance: TADODataSet;
    InsuranceDetail: TADODataSet;
    DS_Insurance: TDataSource;
    InsuranceUID: TIntegerField;
    InsuranceSERIAL: TIntegerField;
    InsuranceNUMBER: TIntegerField;
    InsuranceBEGDATE: TDateTimeField;
    InsuranceENDDATE: TDateTimeField;
    InsuranceFAMILY: TStringField;
    InsuranceRESERVE: TBooleanField;
    InsuranceINSCONCAT: TStringField;
    InsurancePrimech: TStringField;
    InsuranceDOC_DATE: TDateTimeField;
    InsuranceCREATE_DATE: TDateTimeField;
    InsuranceCORR_DATE: TDateTimeField;
    InsuranceWHO_CORR: TStringField;
    InsuranceDetailUID: TIntegerField;
    InsuranceDetailNUMBER: TIntegerField;
    InsuranceDetailBEGDATE: TDateTimeField;
    InsuranceDetailDOC_DATE: TDateTimeField;
    InsuranceDetailFAMILY: TStringField;
    InsuranceDetailCREATE_DATE: TDateTimeField;
    InsuranceDetailWHO_CORR: TStringField;
    InsuranceDetailCORR_DATE: TDateTimeField;
    InsuranceDetailprimech: TStringField;
    InsuranceDetailRESERVE: TBooleanField;
    InsuranceDetailMODEL: TStringField;
    InsuranceDetailREG_SYBMOL: TStringField;
    InsuranceDetailTYPE_TC: TStringField;
    InsuranceDetailCOLOR: TStringField;
    InsuranceDetailMADEYEAR: TIntegerField;
    InsuranceDetailSERIAL: TIntegerField;
    InsuranceDetailENDDATE: TDateTimeField;
    InsuranceDetailUID_CAR: TIntegerField;
    CarsDetailBEGDATE: TDateTimeField;
    CarsDetailENDDATE: TDateTimeField;
    CarsREG_SYBMOL: TStringField;
    CarsVIN: TStringField;
    CarsMODEL: TStringField;
    CarsTYPE_TC: TStringField;
    InsuranceVALIDDAY: TIntegerField;
    InsuranceArchive: TStringField;
    Nakl: TADODataSet;
    Move: TADODataSet;
    DS_Nakl: TDataSource;
    DS_Move: TDataSource;
    NaklUNICUM_NUM: TIntegerField;
    NaklNUM_DOC: TIntegerField;
    NaklDATE_DOC: TDateTimeField;
    NaklSUM_DOC: TFloatField;
    NaklDRIVER: TStringField;
    NaklCAR_UID: TIntegerField;
    NaklTYPE_DOC: TStringField;
    NaklFAMILY: TStringField;
    NaklCREATE_DATE: TDateTimeField;
    NaklWHO_CORR: TStringField;
    NaklCORR_DATE: TStringField;
    NaklREG_SYBMOL: TStringField;
    NaklVIN: TStringField;
    NaklMODEL: TStringField;
    NaklCOLOR: TStringField;
    MoveROWID: TIntegerField;
    MoveUNICUM_NUM: TIntegerField;
    MoveNUM_DOC: TIntegerField;
    MoveNUM_PREDM: TIntegerField;
    MoveNAME_PREDM: TStringField;
    MoveKOLC_PREDM: TFloatField;
    MoveSUM_PREDM: TFloatField;
    MoveFAMILY: TStringField;
    MoveTYPE_DOC: TStringField;
    MoveCREATE_DATE: TDateTimeField;
    MoveWHO_CORR: TStringField;
    MoveCORR_DATE: TDateTimeField;
    MovePRIMECH: TStringField;
    GroupsProduct: TADODataSet;
    GroupsProductNGROUP_TVR: TStringField;
    GroupsProductNGROUP_TV2: TStringField;
    GroupsProductNGROUP_TV3: TStringField;
    GroupsProductNGROUP_TV4: TStringField;
    GroupsProductNGROUP_TV5: TStringField;
    GroupsProductNGROUP_TV6: TStringField;
    Product: TADODataSet;
    DS_Product: TDataSource;
    ProductCOD_ARTIC: TIntegerField;
    ProductNAME_ARTIC: TStringField;
    ProductCENA_ARTIC: TFloatField;
    ProductNDS_ARTIC: TFloatField;
    ProductEDIN_IZMER: TStringField;
    ProductKON_KOLCH: TFloatField;
    ProductVES_EDINIC: TFloatField;
    ProductEDN_V_UPAC: TFloatField;
    ProductNGROUP_TVR: TStringField;
    ProductNGROUP_TV2: TStringField;
    ProductNGROUP_TV3: TStringField;
    ProductNGROUP_TV4: TStringField;
    ProductNGROUP_TV5: TStringField;
    ProductNGROUP_TV6: TStringField;
    ProductTYPE_TOVR: TStringField;
    ProductFAMILY: TStringField;
    ProductCREATE_DATE: TDateTimeField;
    ProductWHO_CORR: TStringField;
    ProductCORR_DATE: TDateTimeField;
    CarsStore: TADODataSet;
    DS_CarsStore: TDataSource;
    ProductDetail: TADODataSet;
    ProductDetailCOD_ARTIC: TIntegerField;
    ProductDetailNAME_ARTIC: TStringField;
    ProductDetailCENA_ARTIC: TFloatField;
    ProductDetailNDS_ARTIC: TFloatField;
    ProductDetailEDIN_IZMER: TStringField;
    ProductDetailKON_KOLCH: TFloatField;
    ProductDetailVES_EDINIC: TFloatField;
    ProductDetailEDN_V_UPAC: TFloatField;
    ProductDetailNGROUP_TVR: TStringField;
    ProductDetailNGROUP_TV2: TStringField;
    ProductDetailNGROUP_TV3: TStringField;
    ProductDetailNGROUP_TV4: TStringField;
    ProductDetailNGROUP_TV5: TStringField;
    ProductDetailNGROUP_TV6: TStringField;
    ProductDetailTYPE_TOVR: TStringField;
    ProductDetailFAMILY: TStringField;
    ProductDetailCREATE_DATE: TDateTimeField;
    ProductDetailWHO_CORR: TStringField;
    ProductDetailCORR_DATE: TDateTimeField;
    TypeTovr: TADODataSet;
    TypeTovrTYPE_TOVR: TStringField;
    procedure TypeTovrBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AppDM: TAppDM;


implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses SConst;

{$R *.dfm}

procedure TAppDM.TypeTovrBeforeOpen(DataSet: TDataSet);
begin
  TypeTovr.CommandText := SSQLGetTypeTovr;
end;

end.
