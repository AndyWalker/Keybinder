/*
Anleitung:
Erstelle eine "version.txt" mit dem Inhalt der aktuellen Version (z.B. 0.01) die auch das Script hat.
Lade die "version.txt" und die aktuelle .exe (z.B. Medic-Keybinder.exe) von deinem Keybinder auf einen FTP Server (Webspace)
Immer wenn es eine neue Version gibt l�dst du die aktuelle .exe hoch und �nderst den Inhalt der "version.txt" (z.B. von 0.01 auf 0.02)
*/

version := 0.01

UrlDownloadToFile, http://www.autohotkey.net/~andy/keybinder/Fahrschulkeybinder/version.txt, version.txt
FileRead, newver, version.txt
FileDelete, version.txt
if (version < newver)
{
        neueverf�gbar = 1
        MsgBox,0,, Es ist eine neue Version verf�gbar, v%newver%. Es wird geupdated
        UrlDownloadToFile, http://www.autohotkey.net/~andy/keybinder/Fahrschulkeybinder/Fahrschul-Keybinder.exe, %A_ScriptName%.new
        BatchFile=n
        (
                Ping 127.0.0.1
                Del "%A_ScriptName%"
                Rename "%A_ScriptName%.new" "%A_ScriptName%"
                cd "%A_ScriptFullPath%"
                "%A_ScriptName%"
                Del Update.bat
        )
        FileDelete,update.bat
        FileAppend,%BatchFile%,update.bat
        Run,update.bat,,hide
        ExitApp
}
else
{
        neueverf�gbar = 0
}
