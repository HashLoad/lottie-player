unit Registration;

interface

procedure Register;

implementation

uses
  System.Classes, LottiePlayer;

procedure Register;
begin
  RegisterComponents('Lottie', [TLottiePlayer])
end;

end.
