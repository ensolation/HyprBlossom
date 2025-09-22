cd
function y {
    $tmp = (New-TemporaryFile).FullName
    yazi $args --cwd-file="$tmp"
    $cwd = Get-Content -Path $tmp -Encoding UTF8
    if (-not [String]::IsNullOrEmpty($cwd) -and $cwd -ne $PWD.Path) {
        Set-Location -LiteralPath (Resolve-Path -LiteralPath $cwd).Path
    }
    Remove-Item -Path $tmp
}
Invoke-Expression (&starship init powershell)
Invoke-Expression (& { (zoxide init powershell | Out-String) })
Import-Module PoshColor
. "C:\Users\boibl\Downloads\Invoke-WslCommand.ps1"
function global:cmatrix {
	Invoke-WslCommand -Command "cmatrix" -Arguments $args
}
function cava { & "C:\Users\boibl\Downloads\cava_win\cava.exe" }
Set-Alias ts .\theme.ps1
Set-Alias ls eza
Set-Alias ff fastfetch
Set-Alias vim hx
Set-Alias nf neofetch
Import-Module "C:\Users\boibl\winwal\winwal.psm1"
Enable-PowerType
Set-PSReadLineOption -PredictionSource HistoryAndPlugin -PredictionViewStyle InlineView
