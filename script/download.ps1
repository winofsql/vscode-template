# $args は自動的にすべてのコマンドライン引数を含む配列です

# ファイルシステムオブジェクトを作成
$fso = New-Object -ComObject Scripting.FileSystemObject

# 現在のパスを初期化
$curPath = ""

# 最初の引数はベースURLとして使用
$baseUrl = $args[0]

# 残りの引数を処理
for ($i = 1; $i -lt $args.Length; $i++) {
    $path = $args[$i]

    if ($path.StartsWith("\")) {
        $folderName = $path.TrimStart("\")
        $folderPath = Join-Path -Path (Get-Location) -ChildPath $folderName
        if (-not (Test-Path $folderPath)) {
            New-Item -Path $folderPath -ItemType Directory
        }
        $curPath = $folderName
    } else {
        $fileUrl = if ($curPath) { "$baseUrl/$curPath/$path" } else { "$baseUrl/$path" }
        $localFilePath = if ($curPath) { Join-Path -Path $curPath -ChildPath $path } else { $path }
        
        try {
            Invoke-WebRequest -Uri $fileUrl -OutFile $localFilePath
        } catch {
            Write-Host "Failed to download $fileUrl. Error: $_"
        }
    }
}
