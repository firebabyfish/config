function zephyr_build {
    west build
}
function zephyr_flash {
    west flash --recover
}

Set-Alias rm remove-Item
Set-Alias zephyr C:\Users\lhywj\zephyrproject\.venv\Scripts\Activate.ps1
Set-Alias build zephyr_build
Set-Alias flash zephyr_flash

# 设置 <C-b> 为左移
Set-PSReadLineKeyHandler -Chord Ctrl+b -Function BackwardChar
# 设置 <C-f> 为右移
Set-PSReadLineKeyHandler -Chord Ctrl+f -Function ForwardChar
# 设置 <C-p> 为上移
Set-PSReadLineKeyHandler -Chord Ctrl+p -Function PreviousHistory
# 设置 <C-n> 为下移
Set-PSReadLineKeyHandler -Chord Ctrl+n -Function NextHistory
# 设置 <C-a> 为移动到行首
Set-PSReadLineKeyHandler -Chord Ctrl+a -Function BeginningOfLine
# 设置 <C-e> 为移动到行尾
Set-PSReadLineKeyHandler -Chord Ctrl+e -Function EndOfLine
# 设置 <C-u> 为删除到行首
Set-PSReadLineKeyHandler -Chord Ctrl+u -Function BackwardKillLine

function Get-DirectorySize {
    param (
        [string]$path = (Get-Location)
    )
    $items = Get-ChildItem -Recurse -Force $path
    $totalSize = ($items | Measure-Object -Property Length -Sum).Sum
    $totalSize
}

function ll {
    param (
        [string]$path = (Get-Location)
    )
    $items = Get-ChildItem -Force $path
    foreach ($item in $items) {
        if ($item.PSIsContainer) {
            $size = Get-DirectorySize -path $item.FullName
            Write-Output ("{0,10}  {1}" -f ($size/1MB).ToString("F2") + " MB", $item.Name)
        } else {
            Write-Output ("{0,10}  {1}" -f ($item.Length/1MB).ToString("F2") + " MB", $item.Name)
        }
    }
}
