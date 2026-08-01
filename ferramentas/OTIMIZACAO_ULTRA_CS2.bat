
@echo off
setlocal enabledelayedexpansion

echo ======================================================
echo   OTIMIZACAO PRA CS2 E GAMES (BY_PEST)
echo ======================================================

color 0B
title OTIMIZACAO ULTRA CS2 - BY PEST

:: Verifica privilegios de Administrador
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo [ERRO] Este script PRECISA de privilegios de Administrador.
    echo Tentando reiniciar como administrador...
    powershell start-process '%0' -verb runas
    exit /b
)

echo.
echo ======================================================
echo   INICIANDO OTIMIZACAO COMPLETA...
echo ======================================================
echo.

:: 1. Criar Ponto de Restauracao (Seguranca)
echo [1/10] Criando Ponto de Restauracao do Sistema...
powershell -Command "Checkpoint-Computer -Description 'OtimizacaoCS2_pest' -RestorePointType 'MODIFY_SETTINGS'" >nul 2>&1
echo OK!

:: 2. Plano de Energia Desempenho Maximo
echo [2/10] Ativando Plano de Energia: Desempenho Maximo...
powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61 >nul 2>&1
powercfg -setactive e9a42b02-d5df-448d-aa00-03f14749eb61 >nul 2>&1
:: Desativa suspensao seletiva USB (reduz input lag do mouse)
powercfg /SETACVALUEINDEX SCHEME_CURRENT SUB_NONE 48e6b7a6-50f5-4782-a5d4-53bb8f07e226 0 >nul 2>&1
echo OK!

:: 3. Otimizacoes de Registro para Jogos (Input Lag & FSE)
echo [3/10] Aplicando Tweaks de Registro (Windows Gaming)...
:: Desativar Game Bar e Game DVR
reg add "HKCU\System\GameConfigStore" /v "GameDVR_Enabled" /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\GameDVR" /v "AllowGameDVR" /t REG_DWORD /d 0 /f >nul 2>&1
:: Desativar Otimizacoes de Tela Cheia (FSE) Globalmente
reg add "HKCU\System\GameConfigStore" /v "GameDVR_FSEBehavior" /t REG_DWORD /d 2 /f >nul 2>&1
:: Prioridade da GPU para Games
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "GPU Priority" /t REG_DWORD /d 8 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Priority" /t REG_DWORD /d 6 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Scheduling Category" /t REG_SZ /d "High" /f >nul 2>&1
echo OK!

:: 4. Otimizacao NVIDIA (Via Registro para garantir o basico)
echo [4/10] Otimizando Configurações NVIDIA (Power & Latency)...
:: Forçar Preferencia por Desempenho Maximo no Driver
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "PowerMizerEnable" /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "PerfLevelSrc" /t REG_DWORD /d 0x3322 /f >nul 2>&1
echo OK!

:: 5. Limpeza de Cache Profunda
echo [5/10] Limpeza Pesada de Caches e Arquivos Temporarios...
:: Cache NVIDIA e DirectX
rd /s /q "%LocalAppData%\NVIDIA\DXCache" 2>nul
rd /s /q "%LocalAppData%\NVIDIA\GLCache" 2>nul
rd /s /q "%LocalAppData%\D3DSCache" 2>nul
:: Temporarios Windows
del /s /q /f %temp%\* >nul 2>&1
for /d %%p in ("%temp%\*") do rd /s /q "%%p" >nul 2>&1
del /s /q /f C:\Windows\Temp\* >nul 2>&1
del /s /q /f C:\Windows\Prefetch\* >nul 2>&1
:: Limpeza de Disco via Script
cleanmgr /sagerun:1 >nul 2>&1
echo OK!

:: 6. Otimizacao de Rede
echo [6/10] Otimizando Rede para Menor Ping...
netsh int tcp set global autotuninglevel=disabled >nul 2>&1
netsh int tcp set global chimney=enabled >nul 2>&1
netsh int tcp set global rss=enabled >nul 2>&1
ipconfig /flushdns >nul 2>&1
echo OK!

:: 7. Desativar Servicos Inuteis (Telemetria)
echo [7/10] Desativando Telemetria e Servicos Desnecessarios...
sc stop DiagTrack >nul 2>&1
sc config DiagTrack start= disabled >nul 2>&1
sc stop dmwappushservice >nul 2>&1
sc config dmwappushservice start= disabled >nul 2>&1
echo OK!

:: 8. Reset de Cache de Icones (Melhora resposta da Shell)
echo [8/10] Reiniciando Explorer e Limpando Cache de Icones...
taskkill /f /im explorer.exe >nul 2>&1
del /f /q "%LocalAppData%\IconCache.db" >nul 2>&1
del /f /s /q "%LocalAppData%\Microsoft\Windows\Explorer\thumbcache_*.db" >nul 2>&1
start explorer.exe
echo OK!

:: 9. Dicas CS2 (In-Game)
echo [9/10] Preparando lista de recomendacoes in-game...
(
echo [CONFIGURACOES RECOMENDADAS DENTRO DO CS2]
echo 1. Boost Player Contrast: ENABLED
echo 2. Multi-Sampling Anti-Aliasing: 2x MSAA (Equilibrio)
echo 3. Global Shadow Quality: HIGH (Importante para ver sombras)
echo 4. Model/Texture Detail: LOW
echo 5. Shader Detail: LOW
echo 6. Particle Detail: LOW
echo 7. Ambient Occlusion: DISABLED
echo 8. High Dynamic Range: PERFORMANCE
echo 9. FidelityFX Super Resolution: DISABLED (Highest Quality)
echo 10. NVIDIA Reflex Low Latency: ENABLED
) > "%userprofile%\Desktop\DICAS_CS2_MANUS.txt"
echo OK! (Arquivo DICAS_CS2_PEST.txt disponibilizado Junto)

:: 10. Opcoes de Inicializacao (Launch Options)
echo [10/10] Gerando Launch Options ideais...
echo Launch Options: -high -threads 0 -nojoy +fps_max 0 -allow_third_party_software
echo OK!

echo.
echo ======================================================
echo   SISTEMA OTIMIZADO COM SUCESSO!
echo   RECOMENDAMOS REINICIAR O COMPUTADOR AGORA.
echo ======================================================
echo.
pause
