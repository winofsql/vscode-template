# vscode-template
Visual Studio Code 用テンプレート
## settings.json( "C:\Users\\%username%\AppData\Roaming\Code\User" )
```javascript
{
    "editor.mouseWheelZoom": true,
    "editor.detectIndentation": false,
    "editor.renderWhitespace": "boundary",
    "editor.fontSize": 16,
    "files.autoSave": "afterDelay",
    "java.home": "c:\\java11",
    "workbench.colorTheme": "Default Light+",
    "code-runner.showRunIconInEditorTitleMenu": false,
    "terminal.integrated.fontSize": 16,
    "terminal.integrated.profiles.windows": {
        "PowerShell": {
            "source": "PowerShell",
            "icon": "terminal-powershell"
        },
        "Command Prompt": {
            "path": [
                "C:\\WINDOWS\\system32\\cmd.exe"
            ],
            "args": [],
            "icon": "terminal-cmd"
        },
        "Git Bash": {
            "source": "Git Bash"
        }
    },
    "terminal.integrated.defaultProfile.windows": "Command Prompt",
    "terminal.integrated.automationShell.windows": "C:\\WINDOWS\\system32\\cmd.exe",
    "[php]": {
        "editor.defaultFormatter": "bmewburn.vscode-intelephense-client"
    },
    "[javascript]": {
        "editor.defaultFormatter": "vscode.typescript-language-features"
    },
    "[html]": {
        "editor.defaultFormatter": "vscode.html-language-features"
    }
    "[sql]": {
        "editor.defaultFormatter": "adpyke.vscode-sql-formatter"
    },
    "[csharp]": {
        "editor.defaultFormatter": "SimonSiefke.prettier-vscode"
    },
    "[java]": {
        "editor.defaultFormatter": "redhat.java"
    },
    "[csv]": {
        "files.encoding": "shiftjis"
    },
    "[vbs]": {
        "files.encoding": "shiftjis"
    },
    "[bat]": {
        "files.encoding": "shiftjis"
    },
    "[powershell]": {
        "files.encoding": "shiftjis"
    },
    "window.zoomLevel": 1
}
```
| Keyword | | Description 
| :--- | --- | :---  
| editor.mouseWheelZoom | true | Ctrl キーを押しながらマウス ホイールを使用してエディターのフォントをズームします。
| editor.detectIndentation | false | ファイルがファイルの内容に基づいて開かれる場合、#editor.tabSize# と #editor.insertSpaces# を自動的に検出するかどうかを制御します。 
| editor.renderWhitespace | boundary | 単語間の単一スペース以外の空白文字を表示します。 
| window.zoomLevel | 1 | 全体を少し拡大して見やすくします。 ( Chrome の 拡大・縮小と操作は同じ )

## キーボードショートカット( 既定 )
| 操作 | Description 
| :--- | :---  
| CTRL + SPACE | IntelliSense
| SHIFT + ALT + F | フォーマット( keybindings.json で選択部分を対象に変更 )
| SHIFT + ALT + ドラッグ | 矩形選択
| Alt + Up : Alt + Down | 選択単位で上下移動( 1行の時は、カーソルを置いた行が対象 )
| CTRL + L | 現在行の選択
| CTRL + D | 同じ文字列を一括編集する為に一つづつ選択
| CTRL + SHIFT + L | 同じ文字列を全て一括編集
| CTRL + ENTER | 下に行追加
| CTRL + SHIFT + ENTER | 上に行追加


## keybindings.json : C:\Users\\%username%\AppData\Roaming\Code\User
▼ 以下をコピーして、コマンドパレットに貼り付け => 【キーボードショートカットを開く】を選択して実行
```
keyboard json
```
```javascript
// 既定値を上書きするには、このファイル内にキー バインドを挿入しますauto[]
[
    {
        "key": "ctrl+pausebreak",
        "command": "extension.enableZenkaku"
    },
    {
        "key": "shift+pausebreak",
        "command": "extension.disableZenkaku"
    },
    {
        "key": "ctrl+f1",
        "command": "workbench.action.closeFolder",
        "when": "emptyWorkspaceSupport && workbenchState != 'empty'"
    },
    {
        "key": "f5",
        "command": "code-runner.run",
        "when": "editorLangId != 'java'"
    },
    {
        "key": "f5",
        "command": "mysql.runSQL",
        "when": "editorLangId == 'sql'"
    },
    {
        "key": "shift+alt+k",
        "command": "workbench.action.openGlobalKeybindingsFile"
    },
    {
        "key": "ctrl+shift+delete",
        "command": "editor.action.trimTrailingWhitespace",
        "when": "editorTextFocus && !editorReadonly"
    },
    {
        "key": "ctrl+f7",
        "command": "editor.action.transformToUppercase"
    },
    {
        "key": "ctrl+f6",
        "command": "editor.action.transformToLowercase"
    },
    {
        "key": "shift+alt+f",
        "command": "editor.action.formatSelection",
        "when": "editorTextFocus"
    },
    {
        "key": "shift+alt+pausebreak",
        "command": "editor.action.format",
        "when": "editorTextFocus"
    }
]
```
**※ shift+alt+k で 【キーボードショートカットを開く】事になります**

## キーボードショートカット( ユーザ )
| 操作 | Description 
| :--- | :---  
| SHIFT + ALT + K | キーボードショートカットの変更を開く
| CTRL + SHIFT + DEL | 選択単位で行末スペース削除
| CTRL + F7 | 大文字に変換
| CTRL + F6 | 小文字に変換
  

## Extension Pack for Java
![image](https://user-images.githubusercontent.com/1501327/132113151-df054e16-63a5-42db-8502-65a12c6afbbc.png)\
**▼ 一つのフォルダに複数のフォルダ内でクラス作成する為のフォルダ追加設定**
```
java.project.sourcePaths
```
![image](https://user-images.githubusercontent.com/1501327/133005637-f392d0ac-760e-4a50-956f-cf5cddebf2dd.png)\
**▼ ワークスペースの実フォルダをカレントにする** ( "cwd": "${fileDirname}" )
```javascript
{
    "version": "0.2.0",
    "configurations": [
        {
            "type": "java",
            "name": "Launch Current File",
            "request": "launch",
            "mainClass": "${file}",
            "cwd": "${fileDirname}"
        }
    ]
}
```


## Code Runner
![image](https://user-images.githubusercontent.com/1501327/132113173-cabc662f-8f06-49d0-959e-e2247619d121.png)\
**▼ keybindings.json**
```javascript
    {
        "key": "f5",
        "command": "code-runner.run",
        "when": "editorLangId != 'java'"
    }
```
```javascript
    "code-runner.executorMap": {
        "javascript": "cscript //Nologo",
        "php": "C:\\xampp\\php\\php.exe",
        "python": "python -u",
        "powershell": "powershell -NoProfile -ExecutionPolicy Unrestricted -File",
        "bat": "cmd /c",
        "csharp": "dotnet run",
        "vbscript": "cscript //Nologo"
    }
```
## MySQL
![image](https://user-images.githubusercontent.com/1501327/132113188-f6e02a8e-4d19-49ba-96f9-8f01905e50b5.png)\
[MySQL 文字列関数](https://dev.mysql.com/doc/refman/5.6/ja/string-functions.html)\
**▼ keybindings.json**
```javascript
    {
        "key": "f5",
        "command": "mysql.runSQL",
        "when": "editorLangId == 'sql'"
    }
```
## Python
![image](https://user-images.githubusercontent.com/1501327/132113215-7c6ca944-66cb-4a01-9016-b13561e34d10.png)
## 全角表示
![image](https://user-images.githubusercontent.com/1501327/132939808-726ac268-17c2-47f5-a7cd-2339f662ceba.png)\
**▼ keybindings.json**
```javascript
    {
        "key": "ctrl+pausebreak",
        "command": "extension.enableZenkaku"
    },
    {
        "key": "shift+pausebreak",
        "command": "extension.disableZenkaku"
    }
```
## dotnet C# ( Dotnet Core )
![image](https://user-images.githubusercontent.com/1501327/132970933-bedc9e7f-23b9-44ba-b5c5-aed6c418d794.png)
1. dotnet new console
```cs
using System;

namespace cs_core_0912
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Hello World!");
        }
    }
}
```
3. code-runner
```javascript
    "code-runner.executorMap": {
        "csharp": "dotnet run"
    }
```
3. code-runner( .vscode )
```javascript
{
    "code-runner.showRunIconInEditorTitleMenu": true,
    "code-runner.runInTerminal": true,
    "code-runner.fileDirectoryAsCwd": true,
    "code-runner.executorMap": {
        "csharp": "dotnet run"
    },
    "terminal.integrated.fontSize": 16
}
```
4. nuget 対応
```javascript
dotnet add package System.Data.Odbc
```

## PHP ( @builtin の PHP Language Features を無効にする )
![image](https://user-images.githubusercontent.com/1501327/132984562-c7f8fd42-5e98-40bc-a78e-00d130387de3.png)
```javascript
javascript:s=location.href;s=s.replace("/en/","/ja/");location.href=s;void(0);
```

## 言語整形
![image](https://user-images.githubusercontent.com/1501327/133910806-a1440c0e-12d7-4c98-9aef-affe1702a601.png)\
**MySQL のフォーマッタは日本語でバグがあります**
```javascript
"sql-formatter.uppercase": true
```

## WEB 上でスニペット作成
[VSCodeスニペット用コード作成ツール](https://migi.me/vsc_snippet/)


## WEB
[参考:コリス:コードを書くのが楽になる！知っておくと便利なVS Codeの機能・設定のまとめ](https://coliss.com/articles/build-websites/operation/work/vs-code-dont-need-extensions.html)\
[参考:コリス:2021年、VS Codeのおすすめ機能拡張のまとめ、HTMLやCSSやJavaScriptなどのコードを書く時に便利](https://coliss.com/articles/build-websites/operation/work/favorite-vscode-extensions-by-katherine.html)\
[参考:ショートカット一覧](https://qiita.com/TakahiRoyte/items/cdab6fca64da386a690bq)\
[ターミナルカラー](https://glitchbone.github.io/vscode-base16-term/#/)

## VScode
[Known language identifiers](https://code.visualstudio.com/docs/languages/identifiers#_known-language-identifiers)


## メモ
VSCode 内 ブラウザ : Browser Preview\
C/C++ のフォーマッタは Microsoft の C/C++ 拡張 ( ms-vscode.cpptools )
 

