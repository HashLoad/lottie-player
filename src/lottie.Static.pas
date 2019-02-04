unit lottie.Static;

interface

function GetPage(AData, AColor: string): string;
function GetDefault(AColor: string): string;

implementation

uses
  System.IOUtils, System.SysUtils, lottie.static.JS;

function GetPage(AData, AColor: string): string;
begin
  Result := '<!DOCTYPE html><html xmlns="http://www.w3.org/1999/xhtml"><head> <meta charset="UTF-8"> <style>body,'
    + ' html{margin: 0px; height: 100%; overflow-x: hidden; overflow-y: auto;}#lottie{backgro'
    + 'und-color:#000; width:100%; height:100%; display:block; overflow: hidden; transform: translate3d(0,0,0); /*di'
    + 'splay:none;*/}</style><script>'+ C_LOTTIE_JS + '</script></head><body><div id="lottie" style="background-c'
    + 'olor:#' + AColor + '"></div><script>var anim; var elem=document.getElementById("lottie"); var animData={container: '
    + 'elem, renderer: "canvas", loop: false, autoplay: true, rendererSettings:{progressiveLoad:false}, animationData: '
    + AData + '};'
    + 'setTimeout(function(){anim=lottie.loadAnimation(animData); anim.setSubframe(false); setTimeout(function(){},0)},0)</scrip'
    + 't></body></html>';
end;


function GetDefault(AColor: string): string;
begin
   Result := '<!DOCTYPE html><html xmlns="http://www.w3.org/1999/xhtml"><head> <meta charset="UTF-8"> <style>body,'
    + ' html{margin: 0px; height: 100%; overflow-x: hidden; overflow-y: auto;}#lottie{backgro'
    + 'und-color:#000; width:100%; height:100%; display:block; overflow: hidden; transform: translate3d(0,0,0); /*di'
    + 'splay:none;*/}</style></head><body><div id="lottie" style="background-c'
    + 'olor:#' + AColor + '"></div></body></html>';
end;


end.
