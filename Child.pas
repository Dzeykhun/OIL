unit Child;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs;

type
  TChildForm = class(TForm)
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);

  private
  protected
  procedure CreateForm(); virtual;
  procedure DestroyForm(); virtual;

    { Private declarations }
  public
  constructor Create(AOwner:TComponent); override;
  destructor Destroy; override;
    { Public declarations }
  end;

var
  ChildForm: TChildForm;

implementation

{$R *.dfm}

uses OIL, SConst, AppData;

{ TForm1 }

constructor TChildForm.Create(AOwner: TComponent);
begin
  inherited;
  CreateForm();
end;

destructor TChildForm.Destroy;
begin
  DestroyForm;
  inherited;
end;

procedure TChildForm.CreateForm;
begin

end;


procedure TChildForm.DestroyForm;
begin

end;

procedure TChildForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TChildForm.FormCreate(Sender: TObject);
begin
  if Assigned(MainForm) and (MainForm.MDIChildCount > 1) then
    WindowState := MainForm.MDIChildren[MainForm.MDIChildCount - 1].WindowState
  else
    WindowState := wsMaximized;
end;

end.
