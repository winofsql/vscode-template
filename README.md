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
    "java.home": "c:\\java16",
    "code-runner.showRunIconInEditorTitleMenu": false,
    "code-runner.executorMap": {
        "csv": "explorer",
        "javascript": "cscript //Nologo",
        "php": "\\xampp\\php\\php.exe",
        "python": "python -u",
        "powershell": "powershell -NoProfile -ExecutionPolicy Unrestricted -File",
        "csharp": "dotnet run",
        "vbscript": "cscript //Nologo"
    },
    "code-runner.executorMapByFileExtension": {
        ".wsf": "cscript //Nologo",
        ".hta": "\\Windows\\SysWOW64\\mshta.exe",
        ".htm": "\\Windows\\SysWOW64\\mshta.exe"
    },
    "files.associations": {
        "*.ujis": "perl",
        "*.932": "csv",
        "*.jsp": "java",
        "*.htm": "html",
        "*.hta": "html",
        "*.xlsx": "excel"
    },
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
    "[php]": {
        "editor.defaultFormatter": "bmewburn.vscode-intelephense-client"
    },
    "[javascript]": {
        "editor.defaultFormatter": "vscode.typescript-language-features"
    },
    "[html]": {
        "editor.defaultFormatter": "vscode.html-language-features"
    },
    "sql-formatter.uppercase": true,
    "[sql]": {
        "editor.defaultFormatter": "adpyke.vscode-sql-formatter"
    },
    "[csharp]": {
        "editor.defaultFormatter": "SimonSiefke.prettier-vscode"
    },
    "[java]": {
        "editor.defaultFormatter": "redhat.java"
    },
    "[jsonc]": {
        "editor.defaultFormatter": "vscode.json-language-features"
    },
    "[perl]": {
        "files.encoding": "eucjp"
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
| SHIFT + ALT + F | フォーマット( ソース全体のフォーマット )
| Shift + ALT + 0 | エディタ・垂直/水平 切り替え )
| SHIFT + ALT + ドラッグ | 矩形選択
| Alt + Up : Alt + Down | 選択単位で上下移動( 1行の時は、カーソルを置いた行が対象 )
| Alt + SHIFT + Up | 選択単位で下にコピー( 1行の時は、カーソルを置いた行が対象 )
| Alt + SHIFT + Down | 選択単位で上にコピー( 1行の時は、カーソルを置いた行が対象 )
| CTRL + L | 現在行の選択
| CTRL + D | 同じ文字列を一括編集する為に一つづつ選択
| Ctrl + F2 | 同じ文字列を全て一括編集
| CTRL + SHIFT + L | 同じ文字列を全て一括編集
| CTRL + ENTER | 下に行追加
| CTRL + SHIFT + ENTER | 上に行追加
| CTRL + SHIFT + v | マークダウンのプレビュー


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
        "key": "shift+alt+pausebreak",
        "command": "editor.action.formatSelection",
        "when": "editorHasDocumentSelectionFormattingProvider && editorTextFocus && !editorReadonly"
    },
    {
        "key": "ctrl+shift+numpad_divide",
        "command": "workbench.action.splitEditorInGroup",
        "when": "activeEditorCanSplitInGroup"
    },
    {
        "key": "ctrl+shift+numpad_divide",
        "command": "workbench.action.joinEditorInGroup",
        "when": "sideBySideEditorActive"
    },
    {
        "key": "ctrl+shift+e",
        "command": "revealFileInOS"
    },
    {
        "key": "ctrl+f2",
        "command": "workbench.action.closeAllEditors"
    },
    {
        "key": "ctrl+shift+numpad_subtract",
        "command": "workbench.action.positionPanelRight"
    },
    {
        "key": "ctrl+shift+numpad_add",
        "command": "workbench.action.positionPanelBottom"
    },
    {
        "key": "ctrl+f10",
        "command": "workbench.action.terminal.kill"
    },
    {
        "key": "shift+alt+j",
        "command": "java.clean.workspace"
    }
]
```
**※ shift+alt+k で 【キーボードショートカットを開く】事になります**

## キーボードショートカット( ユーザ )
| 操作 | Description 
| :--- | :---  
| SHIFT + ALT + K | キーボードショートカットの変更を開く
| SHIFT + ALT + PAUSE | フォーマット( 選択部分のフォーマット )
| CTRL + SHIFT + DEL | 選択単位で行末スペース削除
| Ctrl + SHIFT + E | エクスプローラで表示
| CTRL + F7 | 大文字に変換
| CTRL + F6 | 小文字に変換
  
\
\
![image](https://user-images.githubusercontent.com/1501327/134832146-8ea73bef-56e1-44e5-be67-7015f36a860b.png)


## Extension Pack for Java ( vscjava.vscode-java-pack )
![image](https://user-images.githubusercontent.com/1501327/132113151-df054e16-63a5-42db-8502-65a12c6afbbc.png)\
**▼ ブロジェクト リビルド**
```
Java: Clean Java Language Server Workspace
```
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


## Code Runner ( formulahendry.code-runner )
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
## Run Terminal Command ( adrianwilczynski.terminal-commands )
![image](https://user-images.githubusercontent.com/1501327/134173105-2c7ba14c-bc3a-49a4-a3ea-e882226d8dc1.png)\
![image](https://user-images.githubusercontent.com/1501327/134357892-2d8733c7-bf63-4266-9187-5343c9383e00.png)
```javascript
    "runTerminalCommand.commands": [
        {
            "command": "type nul >> control.php && type nul >> model.php && type nul >> view.php",
            "name": "Php Base",
            "auto": true
        },
        {
            "command": "cscript C:\\Users\\%USERNAME%\\AppData\\Roaming\\Code\\User\\script\\sworc-settings-download.vbs",
            "name": "download-settings",
            "auto": true
        },
        {
            "command": "cscript C:\\Users\\%USERNAME%\\AppData\\Roaming\\Code\\User\\script\\workspace-build-download.vbs",
            "name": "workspace-build-download",
            "auto": true
        }
    ]
```

## MySQL ( cweijan.vscode-mysql-client2 )
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
```javascript
    "code-runner.executorMap": {
        "sql": "\\xampp\\mysql\\bin\\my.bat"
    }
```

## Python ( ms-python.python )
![image](https://user-images.githubusercontent.com/1501327/132113215-7c6ca944-66cb-4a01-9016-b13561e34d10.png)
## 全角表示 ( mosapride.zenkaku )
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
**[非公式Pythonダウンロードリンク](https://pythonlinks.python.jp/ja/index.html)**

## dotnet C# ( ms-dotnettools.csharp )
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
dotnet add package System.Text.Encoding.CodePages
```

## Auto-Using for C# ( fudge.auto-using )
![image](https://user-images.githubusercontent.com/1501327/133971198-17dd8a9a-4101-44a5-a66f-1a70f5678030.png)\
**※ C# では using 候補が動かない、この拡張も完全ではない**


## PHP ( bmewburn.vscode-intelephense-client / @builtin の PHP Language Features を無効にする )
![image](https://user-images.githubusercontent.com/1501327/132984562-c7f8fd42-5e98-40bc-a78e-00d130387de3.png)
```javascript
javascript:s=location.href;s=s.replace("/en/","/ja/");location.href=s;void(0);
```

## Excel ( GrapeCity.gc-excelviewer )
![image](https://user-images.githubusercontent.com/1501327/134126427-09e85fda-c4c0-4ea4-a5b7-c397931fb129.png)\
**※ csv を言語として認識させる => csv を常に shift_jis で開く : Excel は .xlsx で表示可能**
```javascript
    "[csv]": {
        "files.encoding": "shiftjis"
    }
    "code-runner.executorMap": {
        "csv": "\"C:\\Program Files (x86)\\Microsoft Office\\Office15\\EXCEL.EXE\""
    }
```

## Edit csv ( janisdd.vscode-edit-csv )
![image](https://user-images.githubusercontent.com/1501327/134127183-7d62855d-ea54-4b31-a67f-1a63786ba297.png)\
**※ csv を表形式で更新**

## 言語整形 ( adpyke.vscode-sql-formatter )
![image](https://user-images.githubusercontent.com/1501327/133910806-a1440c0e-12d7-4c98-9aef-affe1702a601.png)\
**MySQL のフォーマッタは日本語でバグがあります**
```javascript
    "sql-formatter.uppercase": true,
    "[sql]": {
        "editor.defaultFormatter": "adpyke.vscode-sql-formatter"
    }
```

**▼ ( SimonSiefke.prettier-vscode )**\
![image](https://user-images.githubusercontent.com/1501327/134126076-fd99b6fe-9feb-495e-b4e0-0b2367268ecf.png)\
**※ C# 用 : Microsoft のはうまく動かない**
```javascript
    "[csharp]": {
        "editor.defaultFormatter": "SimonSiefke.prettier-vscode"
    }
```

## zip 内参照( arcanis.vscode-zipfs )
![image](https://user-images.githubusercontent.com/1501327/134774975-8d21386e-a972-48d5-828e-d9a3869ae266.png)

## アイコン( pkief.material-icon-theme )
![image](https://user-images.githubusercontent.com/1501327/135634230-8d46a15a-9c4a-44db-8f8c-601024b5eeac.png)
```
    "workbench.iconTheme": "material-icon-theme",
    "material-icon-theme.folders.color": "#bfc553",
    "material-icon-theme.opacity": 0.8,
    "material-icon-theme.showWelcomeMessage": false
```
![image](https://user-images.githubusercontent.com/1501327/135634844-5848f069-7708-4a98-862a-c95523c46a63.png)



## VBScript( serpen.vbsvscode )
![image](https://user-images.githubusercontent.com/1501327/134128422-db5fb3ec-5d2b-4909-b55e-cca924bd7e05.png)
```javascript
    "[vbs]": {
        "files.encoding": "shiftjis"
    }
```

## WEB 上でスニペット作成
[VSCodeスニペット用コード作成ツール](https://migi.me/vsc_snippet/)\
[VSCode ドキュメント(スニペット)](https://code.visualstudio.com/docs/editor/userdefinedsnippets)


## WEB
[参考:コリス:コードを書くのが楽になる！知っておくと便利なVS Codeの機能・設定のまとめ](https://coliss.com/articles/build-websites/operation/work/vs-code-dont-need-extensions.html)\
[参考:コリス:2021年、VS Codeのおすすめ機能拡張のまとめ、HTMLやCSSやJavaScriptなどのコードを書く時に便利](https://coliss.com/articles/build-websites/operation/work/favorite-vscode-extensions-by-katherine.html)\
[参考:ショートカット一覧](https://qiita.com/TakahiRoyte/items/cdab6fca64da386a690b)\
[ターミナルカラー](https://glitchbone.github.io/vscode-base16-term/#/)

## VScode
[Known language identifiers](https://code.visualstudio.com/docs/languages/identifiers#_known-language-identifiers)
```
Change Language Mode
```
※ 右下の言語をクリック\
![image](https://user-images.githubusercontent.com/1501327/134125761-070db934-955c-416a-9ca7-07a43ec0a050.png)

## メモ
VSCode 内 ブラウザ : Browser Preview\
![image](https://user-images.githubusercontent.com/1501327/134128673-5a9539b9-c517-45d3-846a-9bcada21a673.png)

C/C++ のフォーマッタは Microsoft の C/C++ 拡張 ( ms-vscode.cpptools )
![image](https://user-images.githubusercontent.com/1501327/134128726-8b31dcf6-9983-4f67-b7eb-b48d524378a2.png)

バイナリダンプ ( qiaojie.binary-viewer )\
![image](https://user-images.githubusercontent.com/1501327/135572507-123b2452-8950-4d11-927d-03fa3699fc68.png)
 
 ## Google Chrome 翻訳連携
![image](https://user-images.githubusercontent.com/1501327/135040897-418ed8e7-4a92-41ed-94a8-1e6492063c4d.png)
![image](https://user-images.githubusercontent.com/1501327/135041100-83017183-beb3-43ba-95d3-0fd1f1f96df4.png)

## [対話型プレイグラウンドの翻訳](https://github.com/winofsql/vscode-playground)

## VS Code ドキュメント( Chrome の翻訳ツールを使う )
[ZEN モード](https://code.visualstudio.com/docs/getstarted/tips-and-tricks#_zen-mode)\
[Markdownプレビューを開く](https://code.visualstudio.com/docs/getstarted/tips-and-tricks#_open-markdown-preview)\
[シンボルの名前を変更](https://code.visualstudio.com/docs/editor/refactoring#_rename-symbol)\
[差分の表示](https://code.visualstudio.com/docs/editor/versioncontrol#_viewing-diffs)

## Emmet関連ドキュメント
[Emmet Syntax](https://docs.emmet.io/abbreviations/syntax/)\
[Emmet チートシート](https://docs.emmet.io/cheat-sheet/)\
[主な記述方法](https://blog.proglus.jp/4428/#i-2)

[32ビット .accdb ドライバ](https://www.microsoft.com/ja-jp/download/details.aspx?id=13255)

