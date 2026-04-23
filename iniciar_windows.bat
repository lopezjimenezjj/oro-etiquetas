@echo off
title Generador de Etiquetas - ORO Construccion
echo ============================================================
echo   GENERADOR DE ETIQUETAS - ORO Construccion S.A.S
echo ============================================================
echo.

REM === Cerrar cualquier instancia previa colgada ===
echo Verificando que no haya una instancia previa corriendo...
for /f "tokens=5" %%a in ('netstat -ano ^| findstr :5000 ^| findstr LISTENING') do (
    echo Cerrando proceso previo (PID %%a)...
    taskkill /F /PID %%a >nul 2>&1
)

REM === Verificar si Python esta instalado ===
python --version >nul 2>&1
if errorlevel 1 (
    echo.
    echo [ERROR] Python no esta instalado o no esta en el PATH.
    echo.
    echo Descarga Python 3.12 desde https://www.python.org/downloads/
    echo Durante la instalacion, marca la opcion "Add Python to PATH".
    echo.
    pause
    exit /b 1
)

REM === Crear entorno virtual si no existe ===
if not exist "venv" (
    echo Creando entorno virtual por primera vez...
    python -m venv venv
    if errorlevel 1 (
        echo.
        echo [ERROR] No se pudo crear el entorno virtual.
        pause
        exit /b 1
    )
)

REM === Activar entorno virtual ===
call venv\Scripts\activate.bat

REM === Instalar dependencias si no estan instaladas ===
pip show flask >nul 2>&1
if errorlevel 1 (
    echo Instalando dependencias por primera vez...
    echo Esto puede tardar unos minutos...
    python -m pip install --upgrade pip
    pip install -r requirements.txt
    if errorlevel 1 (
        echo.
        echo [ERROR] No se pudieron instalar las dependencias.
        echo Si ves errores sobre pandas, asegurate de tener Python 3.12
        echo (Python 3.13+ a veces da problemas con pandas).
        pause
        exit /b 1
    )
)

echo.
echo ============================================================
echo   Iniciando aplicacion...
echo   La aplicacion se abrira automaticamente en tu navegador.
echo.
echo   NO CIERRES ESTA VENTANA mientras uses la aplicacion.
echo   Para detener: presiona CTRL+C o cierra esta ventana.
echo ============================================================
echo.
python app.py

echo.
echo La aplicacion se ha detenido.
pause
