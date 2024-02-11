# 現在のカレントディレクトリを取得
$currentDirectory = Get-Location

# 親ディレクトリに移動
$parentDirectory = [System.IO.Directory]::GetParent($currentDirectory.Path).FullName
Set-Location $parentDirectory

# コマンドライン引数からターゲット名を取得
$target = $args[0]

# 現在の日付を取得
$curDate = Get-Date

# 日付のフォーマットを設定（月と日を2桁にする）
$monthStr = "{0:D2}" -f $curDate.Month
$dayStr = "{0:D2}" -f $curDate.Day

# フォルダ名を生成し、既に存在する場合はカウンタを増やす
$cnt = 1
$dateString = "$target-$monthStr$dayStr-$cnt"

while (Test-Path -Path $dateString) {
    $cnt++
    $dateString = "$target-$monthStr$dayStr-$cnt"
}

# 新しいフォルダを作成
New-Item -Path $dateString -ItemType Directory
