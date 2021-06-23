set objShell = CreateObject("wscript.shell")
set objFile = CreateObject("Scripting.FileSystemObject")
set objHTML = CreateObject("htmlfile")

strDirectory = objShell.CurrentDirectory
boolStop = 0
boolStart = 0

objFile.createtextfile(strDirectory & "\ionvop-exit.vbs", true).writeline("set objShell = CreateObject(""wscript.shell"")" & vbCrlf & "msgbox(""Kill bot"")" & vbCrlf & "call objShell.run(""taskkill /f /im wscript.exe"",,True)" & vbCrlf & "wscript.echo(""BEWARE: Bot was unsuccessfully killed"")")
objShell.run("""" & strDirectory & "\ionvop-exit.vbs""")
wscript.sleep(1000)
objFile.deletefile(strDirectory & "\ionvop-exit.vbs")

do
    boolStop = 0
    boolStart = 0
    boolStart = msgbox("Start", 1)

    if boolStart = 2 then
        call objShell.run("taskkill /f /im wscript.exe",,True)
        wscript.quit
    end if

    wscript.sleep(3000)

    objShell.sendkeys("^a")
    wscript.sleep(100)

    do
        objShell.sendkeys("/wx ")
        wscript.sleep(500)
        objShell.sendkeys("~")
        wscript.sleep(100)

        for ii = 1 to 12
            objShell.sendkeys("^a")
            wscript.sleep(100)
            objShell.sendkeys("^c")
            wscript.sleep(100)

            if objHTML.ParentWindow.ClipboardData.GetData("text") = "c" then
                objShell.sendkeys("stop")
                wscript.sleep(100)
                boolStop = 1
                ii = 15
            elseif objHTML.ParentWindow.ClipboardData.GetData("text") = " " then
                objShell.sendkeys("{+}:heart:")
                wscript.sleep(500)
                objShell.sendkeys("~")
                wscript.sleep(100)
                objShell.sendkeys("{+}:sparkling_heart:")
                wscript.sleep(500)
                objShell.sendkeys("~")
                wscript.sleep(100)
                boolStop = 1
                ii = 15
            end if
        next

        if boolStop = 1 then
            exit do
        end if
    loop
loop
