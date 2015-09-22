program SSH_TEST;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  SSHclient;

var
   lSSh : TSSHClient;
   str : string;

begin
  try
   lSSh := TSSHClient.Create('95.78.251.16', '222', 'mate', '');
    { TODO -oUser -cConsole Main : Insert code here }
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
  if lSSh.login then
   begin
     writeln('Ïîäêëþ÷èëñÿ!');
     writeln(lSSh.ReceiveData);
     lSSh.SendCommand('df -h');
     writeln(lSSh.ReceiveData);
     lSSh.LogOut;
     writeln('Îòêëþ÷èëñÿ.');
   end
   else
    writeln('Íå ìîãó ïîäêëþ÷èòüñÿ.');
   lSSh.Free;
end.
