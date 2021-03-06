unit Date;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls,
  Vcl.Buttons;

type
  TRangeForm = class(TForm)
    Bevel1: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    BegDTP: TDateTimePicker;
    EndDTP: TDateTimePicker;
    OkBitBt: TBitBtn;
    CancelBitBt: TBitBtn;
    procedure BegDTPChange(Sender: TObject);
  private
  procedure CorrectDate();
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RangeForm: TRangeForm;

implementation

{$R *.dfm}

{ TRangeForm }

procedure TRangeForm.BegDTPChange(Sender: TObject);
begin
  CorrectDate();
end;

procedure TRangeForm.CorrectDate;
begin
  if BegDTP.Date > EndDTP.Date then
    EndDTP.Date := BegDTP.Date;
end;

end.
