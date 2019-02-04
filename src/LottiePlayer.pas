unit LottiePlayer;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.WebBrowser;

type
  TLottiePlayer = class(TWebBrowser)
  private
    FPath: string;
    FBackgroundColor: TAlphaColor;

    procedure SetPath(const Value: string);
    procedure SetBackgroundColor(const Value: TAlphaColor);

    procedure DoLoad;
  protected
    procedure SetVisible(const Value: Boolean); override;
  public
    constructor Create(AOwner: TComponent); override;

  published
    procedure Play;
    procedure Clear;

    property Path: string read FPath write SetPath;
    property BackgroundColor: TAlphaColor read FBackgroundColor
      write SetBackgroundColor default TAlphaColorRec.White;

  end;

implementation

uses
  lottie.Static, System.IOUtils;

{$R *.fmx}
{ TLottiePlayer }

function TColorToHex(AColor: TAlphaColor): string;
begin
  Result := IntToHex(AColor).Substring(2);
end;

procedure TLottiePlayer.Clear;
begin
  LoadFromStrings(GetDefault(TColorToHex(FBackgroundColor)), 'localhost');
end;

constructor TLottiePlayer.Create(AOwner: TComponent);
begin
  inherited;
  Opacity := 0;
end;

procedure TLottiePlayer.DoLoad;
begin
  LoadFromStrings(GetPage(TFile.ReadAllText(FPath),
    TColorToHex(FBackgroundColor)), 'localhost');
end;

procedure TLottiePlayer.Play;
begin
  DoLoad;
end;

procedure TLottiePlayer.SetBackgroundColor(const Value: TAlphaColor);
var
  LOldColor: TAlphaColor;
begin
  LOldColor := FBackgroundColor;
  FBackgroundColor := Value;
  if Value <> LOldColor then
  begin
    Clear;
    Opacity := 1;
  end;
end;

procedure TLottiePlayer.SetPath(const Value: string);
begin
  if FPath <> Value then
    FPath := Value;
end;

procedure TLottiePlayer.SetVisible(const Value: Boolean);
begin
  inherited;
  if not Value then
    Clear;
end;

end.
