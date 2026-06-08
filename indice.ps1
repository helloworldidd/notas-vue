# Genera un índice Markdown de todos los archivos .md
# que comiencen con "m", ordenados alfabéticamente.

Get-ChildItem -File -Filter "m*.md" |
Sort-Object Name |
ForEach-Object {
    "1. [$($_.Name)](./$($_.Name))"
}