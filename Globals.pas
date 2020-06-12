unit Globals;

interface

uses
  windows,  Classes;
var
  g_User : string;
  g_Server : string;

  g_Year : Integer;
  g_Month : Integer;

const
  g_New = 0;
  g_Corr = 1;
  g_View = 2;

type

  TCategoryName = string[30];

const
  PRODUCT_CATEGORIES = 6;
implementation

uses Tovar, OIL;

end.
