# Generador de Etiquetas — ORO Construcción S.A.S

Aplicación local para generar etiquetas en PDF de **80 × 60 mm (landscape)** a partir de un archivo Excel, listas para imprimir en una impresora térmica.

---

## ¿Qué hace?

1. Lees un Excel con 6 columnas: `local`, `fecha`, `referencia`, `cod`, `precio`, `copias`.
2. La app genera un PDF con **una etiqueta por página**, del tamaño exacto de tu impresora térmica.
3. Cada fila del Excel se repite tantas veces como indique la columna `copias`.

---

## Instalación (la primera vez)

### Requisito previo: tener Python instalado

- **Windows / Mac:** descarga Python desde https://www.python.org/downloads/
  - En Windows, durante la instalación marca **"Add Python to PATH"**.
- Para verificar que está instalado, abre una terminal y escribe `python --version` (o `python3 --version` en Mac).

### Descargar la aplicación

Coloca toda la carpeta `oro_etiquetas` en algún lugar fijo de tu computador (por ejemplo, en Documentos).

---

## Cómo usar la aplicación

### En Windows:
- Haz **doble clic** en `iniciar_windows.bat`.
- La primera vez tardará 1-2 minutos instalando dependencias. Las siguientes veces abrirá al instante.
- Se abrirá automáticamente tu navegador en la aplicación.

### En Mac o Linux:
- Abre la Terminal en la carpeta del proyecto.
- La primera vez, dale permisos de ejecución: `chmod +x iniciar_mac_linux.sh`
- Luego ejecútalo con: `./iniciar_mac_linux.sh`
- O haz doble clic si tu sistema lo permite.

### En la interfaz web:
1. Sube tu **archivo Excel** (.xlsx).
2. Sube el **logo** (PNG o JPG) — opcional, pero recomendado.
3. Haz clic en **"Vista previa"** para ver cómo queda una etiqueta.
4. Haz clic en **"Generar PDF"** para descargar el PDF completo con todas las etiquetas.
5. Abre el PDF y envíalo a imprimir en tu impresora térmica.

Para cerrar la aplicación, cierra la ventana de la terminal.

---

## Estructura del Excel

El archivo debe tener estas columnas **exactas** (en cualquier orden, los acentos y mayúsculas son opcionales):

| local | fecha | referencia | cod | precio | copias |
|-------|-------|------------|-----|--------|--------|
| Centro | 22/04/2026 | Cemento Gris 50kg | C001 | 45000 | 3 |
| Norte | 22/04/2026 | Ladrillo común | L205 | 1200 | 10 |

- **local**: nombre o código del local.
- **fecha**: fecha que aparecerá en la etiqueta.
- **referencia**: nombre/descripción del producto (el texto grande central).
- **cod**: código del producto.
- **precio**: número (se formatea automáticamente como `$ 45.000`).
- **copias**: cuántas etiquetas imprimir de esa fila.

---

## Diseño de la etiqueta

```
┌─────────────────────────────────────┐
│  [LOGO]              22/04/2026     │
│                      Local: Centro   │
│                                     │
│        REFERENCIA DEL PRODUCTO      │
│                                     │
│  Cód:  C001                         │
│  ─────────────────────────────────  │
│            $ 45.000                 │
└─────────────────────────────────────┘
            80 × 60 mm
```

---

## Solución de problemas

**"Python no está instalado"**
Instala Python desde https://www.python.org/downloads/ y vuelve a intentarlo.

**"Faltan columnas en el Excel"**
Revisa que tu Excel tenga las 6 columnas: `local`, `fecha`, `referencia`, `cod`, `precio`, `copias`. Los nombres deben coincidir (sin importar mayúsculas/acentos).

**La impresora imprime con márgenes o corta el contenido**
Al imprimir el PDF, asegúrate de configurar en la impresora:
- Tamaño de papel: 80 × 60 mm (o personalizado)
- Escala: 100% (o "Tamaño real", NO "Ajustar a la página")
- Orientación: horizontal (landscape)

**El logo sale borroso**
Usa un logo en PNG con resolución alta (mínimo 500 píxeles de ancho recomendado).

---

## Ajustes avanzados

Si quieres cambiar el diseño de la etiqueta (tipografía, posiciones, tamaños), edita la función `draw_label()` dentro de `app.py`.
