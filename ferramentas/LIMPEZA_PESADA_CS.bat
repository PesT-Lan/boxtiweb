@echo off
title Limpeza de Cache Universal
color 0A

:: Verifica se o script esta rodando como Administrador
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo [AVISO] Este script precisa de privilegios de Administrador.
    echo Reiniciando como administrador...
    powershell start-process '%0' -verb runas
    exit /b
)

echo ======================================================
echo   INICIANDO LIMPEZA DE CACHE (BY_PEST)
echo ======================================================

echo.
echo 1. Removendo pastas de cache da NVIDIA e D3D...
:: %LOCALAPPDATA% aponta para C:\Users\[Usuario]\AppData\Local
if exist "%LOCALAPPDATA%\NVIDIA" (
    rd /s /q "%LOCALAPPDATA%\NVIDIA"
    echo [OK] Cache NVIDIA removido.
)
if exist "%LOCALAPPDATA%\D3DSCache" (
    rd /s /q "%LOCALAPPDATA%\D3DSCache"
    echo [OK] Cache D3DSCache removido.
)

echo.
echo 2. Limpando arquivos temporarios do usuario...
:: %temp% ja e uma variavel nativa do sistema
del /s /q /f %temp%\* >nul 2>&1
for /d %%p in ("%temp%\*") do rd /s /q "%%p" >nul 2>&1
echo [OK] Pasta Temporaria limpa.

echo Limpando Cache de Sombreador DirectX...
:: Remove a pasta de cache e a recria em seguida para garantir a limpeza
if exist "%LocalAppData%\D3DSCache" (
    rd /s /q "%LocalAppData%\D3DSCache"
    mkdir "%LocalAppData%\D3DSCache"
    echo [OK] Cache de Sombreador limpo via CMD.
)

echo.
echo ======================================================
echo   PROCEDIMENTO FINALIZADO!CONFIA NO HOMI NTC!
echo ======================================================
pause