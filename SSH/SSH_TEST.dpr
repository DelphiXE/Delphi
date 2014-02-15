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
   lSSh := TSSHClient.Create('95.78.251.16', '222', 'mate', 'Uafax8Ie');
    { TODO -oUser -cConsole Main : Insert code here }
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
  if lSSh.login then
   begin
     writeln('Подключился!');
     writeln(lSSh.ReceiveData);
     lSSh.SendCommand('df -h');
     writeln(lSSh.ReceiveData);
     lSSh.LogOut;
     writeln('Отключился.');
   end
   else
    writeln('Не могу подключиться.');
   lSSh.Free;
end.
