$host.UI.RawUI.WindowTitle = ""
Invoke-Expression (&starship init powershell)
. "C:\Users\boibl\Downloads\Invoke-WslCommand.ps1"
function global:cmatrix {
	Invoke-WslCommand -Command "cmatrix" -Arguments $args
}
function cava { & "C:\Users\boibl\Downloads\cava_win\cava.exe" }
Set-Alias gt ghosttime
Set-Alias ff fastfetch
Set-Alias vim .\vim.exe
Import-Module "C:\Users\boibl\winwal\winwal.psm1"
Enable-PowerType
Set-PSReadLineOption -PredictionSource HistoryAndPlugin -PredictionViewStyle ListView


# Import the Chocolatey Profile that contains the necessary code to enable
# tab-completions to function for `choco`.
# Be aware that if you are missing these lines from your profile, tab completion
# for `choco` will not function.
# See https://ch0.co/tab-completion for details.
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}
