# Script


<br>

---


<br>
<br>

## Resumen Vue

* Script para PowerShell.
* Lee todos los archivos del proyecto Vue.
* Excluye carpetas como `node_modules`, `dist`, `public` y `.vscode`.
* Excluye archivos binarios e imágenes.
* Genera un archivo `__rev.md`.
* El archivo resultante contiene todo el código fuente del proyecto en formato Markdown, listo para revisión, evaluación o análisis con IA.

```bash
$excluirExtensiones = @(
  ".png",".jpg",".jpeg",".gif",".webp",".svg",".bmp",".ico",
  ".mp4",".avi",".mov",".wmv",".mkv",".webm",
  ".woff",".woff2",".ttf",".eot",
  ".pdf",".zip",".rar"
)

$excluirCarpetas = @(
  "node_modules",
  "dist",
  "public",
  ".vscode"
)

$contenido = ""
$i = 1

Get-ChildItem . -File -Recurse | Where-Object {

  $ruta = $_.FullName

  $carpetaExcluida = $false

  foreach ($carpeta in $excluirCarpetas) {
    if ($ruta -match "\\$([regex]::Escape($carpeta))(\\|$)") {
      $carpetaExcluida = $true
      break
    }
  }

  (-not $carpetaExcluida) -and
  ($excluirExtensiones -notcontains $_.Extension.ToLower())

} | ForEach-Object {

  $ext = $_.Extension.TrimStart(".")

  $contenido += "# Archivo $i`: $($_.Name)`r`n`r`n"
  $contenido += "Ruta: $($_.FullName)`r`n`r`n"
  $contenido += "``````$ext`r`n"

  try {
    $contenido += (Get-Content $_.FullName -Raw -Encoding UTF8)
  }
  catch {
    $contenido += "[No se pudo leer el archivo]"
  }

  $contenido += "`r`n```````r`n`r`n---`r`n`r`n"

  $i++
}

$contenido | Set-Content "__rev.md" -Encoding UTF8

Write-Host "Generado __rev.md con $($i-1) archivos"
```

<br>
<br>

## Resumen Vue

* Script para PowerShell.
* Lee todos los archivos de la carpeta `src` del proyecto Vue.
* Excluye imágenes y otros archivos binarios.
* Genera un archivo `__rev.md`.
* El archivo resultante contiene todo el código fuente de `src` en formato Markdown, listo para revisión, evaluación o análisis.

````bash
$excluir=@(".png",".jpg",".jpeg",".gif",".webp",".svg",".bmp",".ico",".mp4",".avi",".mov",".wmv",".mkv",".webm")
$contenido=""
$i=1

Get-ChildItem .\src -File -Recurse | Where-Object { $excluir -notcontains $_.Extension.ToLower() } | ForEach-Object {
  $ext=$_.Extension.TrimStart(".")
  $contenido += "# Archivo $i`: $($_.Name)`r`n`r`n"
  $contenido += "Ruta: $($_.FullName)`r`n`r`n"
  $contenido += "``````$ext`r`n"
  $contenido += (Get-Content $_.FullName -Raw -Encoding UTF8)
  $contenido += "`r`n```````r`n`r`n---`r`n`r`n"
  $i++
}

$contenido | Set-Content "__rev.md" -Encoding UTF8
Write-Host "Generado __rev.md con $($i-1) archivos"
```