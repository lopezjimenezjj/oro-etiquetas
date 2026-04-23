# Cómo subir la aplicación a Render.com (gratis)

Esta guía te lleva paso a paso desde cero hasta tener tu aplicación corriendo en internet, accesible desde cualquier computador con un link.

**Tiempo estimado:** 15 minutos
**Costo:** Gratis
**Resultado:** Una URL pública tipo `https://oro-etiquetas.onrender.com` que puedes abrir desde cualquier navegador.

---

## Lo que vas a necesitar

1. Una cuenta de **GitHub** (gratis) — para subir el código
2. Una cuenta de **Render.com** (gratis) — para correr la aplicación
3. Esta carpeta `oro_etiquetas` descomprimida en tu computador

No necesitas tener Python instalado para esto. Todo el proceso es vía web.

---

## Paso 1 — Crear cuenta en GitHub

1. Ve a https://github.com/signup
2. Regístrate con tu correo (es gratis y rápido).
3. Confirma tu email.

Si ya tienes cuenta, inicia sesión.

---

## Paso 2 — Subir el código a GitHub

### Opción A — Fácil, por la web (recomendada, no requiere instalar nada)

1. En GitHub, haz clic en el botón verde **"New"** (o ve a https://github.com/new)
2. Rellena:
   - **Repository name:** `oro-etiquetas`
   - **Visibility:** marca **Private** (así solo tú lo ves)
   - Deja lo demás en blanco
3. Haz clic en **"Create repository"**
4. En la siguiente pantalla, busca el link que dice **"uploading an existing file"** y haz clic.
5. Arrastra TODOS los archivos de la carpeta `oro_etiquetas` a la ventana del navegador.
   - Importante: arrastra el **contenido** de la carpeta, no la carpeta misma. Debes ver archivos como `app.py`, `requirements.txt`, `render.yaml`, `logo_oro.jpeg`, etc. directamente en la raíz.
6. Abajo, donde dice **"Commit changes"**, haz clic en el botón verde.

Espera unos segundos. Ya tienes tu código en GitHub.

---

## Paso 3 — Crear cuenta en Render

1. Ve a https://render.com/
2. Haz clic en **"Get Started"** y regístrate con tu cuenta de GitHub (lo más fácil).
3. Acepta los permisos que pide.

---

## Paso 4 — Desplegar la aplicación

1. En el panel de Render, haz clic en **"New +"** (arriba a la derecha) → **"Web Service"**.
2. Conecta tu cuenta de GitHub si te lo pide, y dale permiso al repositorio `oro-etiquetas`.
3. Busca `oro-etiquetas` en la lista y haz clic en **"Connect"**.
4. Render va a detectar automáticamente el archivo `render.yaml` que ya viene incluido en el proyecto, así que no tienes que configurar casi nada. Verás que rellena solo:
   - **Name:** `oro-etiquetas`
   - **Runtime:** Python
   - **Build Command:** `pip install -r requirements.txt`
   - **Start Command:** `gunicorn app:app --timeout 120 --workers 1`
   - **Plan:** Free
5. Haz clic en el botón **"Create Web Service"** (o "Deploy Web Service") al final.

---

## Paso 5 — Esperar el despliegue

Render va a:
1. Descargar tu código.
2. Instalar las dependencias (Python, Flask, pandas, reportlab, etc.).
3. Iniciar el servidor.

**La primera vez tarda entre 3 y 7 minutos.** Verás logs en tiempo real. Cuando veas algo como "Your service is live 🎉", ya está listo.

Arriba verás la URL de tu aplicación, algo como:
```
https://oro-etiquetas.onrender.com
```

Ábrela en cualquier navegador, en cualquier computador. Funciona igual que en local.

---

## Uso diario

Cada vez que quieras generar etiquetas:
1. Abre la URL en tu navegador.
2. Sube el Excel.
3. Descarga el PDF.

Nada más. No necesitas reiniciar nada.

**Importante sobre el plan gratuito:** si nadie usa la app por 15 minutos, se "duerme". La primera persona en abrirla después de eso esperará ~30 segundos mientras despierta. Después funciona normal.

---

## Cómo actualizar la aplicación en el futuro

Si quiero hacerte cambios al diseño de la etiqueta o añadir funciones:
1. Te paso los archivos nuevos.
2. Vas a tu repositorio en GitHub, entras al archivo que cambia, haces clic en el lápiz ✏️ (editar) o lo reemplazas.
3. Confirmas el cambio ("Commit changes").
4. Render detecta el cambio automáticamente y redespliega en unos minutos.

---

## Proteger la aplicación con contraseña (opcional)

Si no quieres que cualquiera con el link pueda usarla, avísame y te agrego un login simple con usuario y contraseña. Son ~10 líneas más de código.

---

## Problemas frecuentes

**"Build failed" en Render**
Revisa los logs. Casi siempre es porque falta un archivo. Verifica que subiste a GitHub: `app.py`, `requirements.txt`, `render.yaml`, la carpeta `templates/` con `index.html`, y `logo_oro.jpeg`.

**La aplicación abre pero da error al generar el PDF**
Revisa los logs en Render (pestaña "Logs"). Si dice algo sobre `pandas` u `openpyxl`, probablemente faltó subir bien `requirements.txt`.

**Quiero cambiar el dominio**
En el plan gratuito solo puedes usar `*.onrender.com`. Para dominio propio (ej. `etiquetas.oroconstruccion.com`) necesitas el plan de pago (~$7 USD/mes).

**Se duerme mucho y molesta**
Por $7 USD/mes puedes pasar al plan "Starter" que no se duerme nunca. En Render, ve a tu servicio → "Settings" → cambia el plan.
