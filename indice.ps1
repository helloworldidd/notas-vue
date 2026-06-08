$archivos = Get-ChildItem -File -Filter "*.md" |
Where-Object {
    $_.Name -notmatch '^__' -and
    $_.Name -ne 'README.md'
} |
Sort-Object Name

$grupoAnterior = ""

foreach ($archivo in $archivos) {

    $nombre = $archivo.Name

    if ($nombre -match '^(m\d+)') {
        $grupo = $matches[1]
    }
    elseif ($nombre -match '^([^-]+-[^-]+)') {
        $grupo = $matches[1]
    }
    else {
        $grupo = "otros"
    }

    if ($grupoAnterior -ne "" -and $grupoAnterior -ne $grupo) {

        if ($grupo -like "otros-*") {
            Write-Output ""
            Write-Output "---"
            Write-Output ""
        }
        else {
            Write-Output ""
            Write-Output "<br>"
            Write-Output ""
        }
    }

    Write-Output "1. [$nombre](./$nombre)"

    $grupoAnterior = $grupo
}