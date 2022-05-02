$pivTool = 'C:\Program Files\Yubico\Yubico PIV Tool\bin\yubico-piv-tool.exe'
if (!(Test-Path $pivTool)) {
    Write-Host "PIV Tool Not Detected. Downloading installer" -ForegroundColor Yellow
    cd $PSScriptRoot

    Invoke-WebRequest -Uri "https://developers.yubico.com/yubico-piv-tool/Releases/yubico-piv-tool-2.3.0-win64.msi" -Method Get -OutFile "yubico-piv-tool-2.3.0-win64.msi"
    Write-Host "Installing PIV Tool" -ForegroundColor Yellow
    
    Start-Sleep -Seconds 2

    msiexec.exe /i yubico-piv-tool-2.3.0-win64.msi /passive
}

cd 'C:\Program Files\Yubico\Yubico PIV Tool\bin'

.$pivTool -a verify-pin -P 32165498
.$pivTool -a verify-pin -P 32165498
.$pivTool -a verify-pin -P 32165498
.$pivTool -a change-puk -P 12345679 -N 32165498
.$pivTool -a change-puk -P 12345679 -N 32165498
.$pivTool -a change-puk -P 12345679 -N 32165498
.$pivTool -a reset
.$pivTool -a set-chuid
.$pivTool -a set-ccc
.$pivTool -a set-mgm-key -n 020203040506070801020304050607080102030405060708
.$pivTool -a change-puk -P 12345678 
.$pivTool -a change-pin -P 123456