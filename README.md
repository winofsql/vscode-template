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
    "terminal.integrated.automationShell.windows": "C:\\WINDOWS\\system32\\cmd.exe"
}
```
| Keyword | | Description 
| :--- | --- | :---  
| editor.mouseWheelZoom | true | Ctrl キーを押しながらマウス ホイールを使用してエディターのフォントをズームします。
| editor.detectIndentation | false | ファイルがファイルの内容に基づいて開かれる場合、#editor.tabSize# と #editor.insertSpaces# を自動的に検出するかどうかを制御します。 
| editor.renderWhitespace | boundary | 単語間の単一スペース以外の空白文字を表示します。 
  
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
    }
]
```
**※ shift+alt+k で 【キーボードショートカットを開く】事になります**

　  

## Extension Pack for Java
![image](https://user-images.githubusercontent.com/1501327/132113151-df054e16-63a5-42db-8502-65a12c6afbbc.png)
## Code Runner
![image](https://user-images.githubusercontent.com/1501327/132113173-cabc662f-8f06-49d0-959e-e2247619d121.png)
**▼ keybindings.json**
```javascript
    {
        "key": "f5",
        "command": "code-runner.run",
        "when": "editorLangId != 'java'"
    }
```
## MySQL
![image](https://user-images.githubusercontent.com/1501327/132113188-f6e02a8e-4d19-49ba-96f9-8f01905e50b5.png)
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
![image](https://user-images.githubusercontent.com/1501327/132939808-726ac268-17c2-47f5-a7cd-2339f662ceba.png)
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
    "code-runner.runInTerminal": true
```
## PHP ( @builtin の PHP Language Features を無効にする )
![image](https://user-images.githubusercontent.com/1501327/132984562-c7f8fd42-5e98-40bc-a78e-00d130387de3.png)
```javascript
javascript:s=location.href;s=s.replace("/en/","/ja/");location.href=s;void(0);
```
