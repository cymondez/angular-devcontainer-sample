# Angular DevContainer Sample

這是 Angular 在 VSCode 使用 DevContainer 的範例。

## 使用 container 建立Angular專案

1. 建立專案資料夾

2. 將 `.devcontainer`

    ```shell
    # 僅使用 docker
    git clone https://github.com/cymondez/angular-devcontainer-sample.git
    cd angular-devcontainer-sample/docker-only
    cp .devcontainer /<your project path>/

    # 使用 docker-compose
    git clone https://github.com/cymondez/angular-devcontainer-sample.git/
    cd angular-devcontainer-sample/docker-compose
    cp .devcontainer /<your project path>/
    ```

3. 使用 VSCode 開啟專案資料夾，設定ng-cli的版本
   1. 使用 docker-only: 設定  .devcontainer/devcontainer.json 內的 ANGULAR_CLI_VER

    ``` json
    {
        "name": "angular13-devconatiner-sample",
        "build": {
            "dockerfile": "Dockerfile",
            "args": {
                "ANGULAR_CLI_VER": "13.0.1", // 在這裡指定 ng-cli的版本
                "ENABLE_NETTOOL": "true",
                "ENABLE_DOCKER": "true",
                "ENABLE_ZSH": "true"
            },
        },
        // 下略 ......
    }    
    ```

   2. 使用 docker-compose:  設定  .devcontainer/docker-compose.yml 內的 ANGULAR_CLI_VER

    ```yaml

    # 前略 ......
    services:
        app:
            build:
            context: .
            dockerfile: Dockerfile
            args:
                ANGULAR_CLI_VER: 13.1.0  #在這裡指定 ng-cli的版本
    ```

4. 啟動 `Remote-Containers: Open Workspace in Container...` 建立開發環境
5. container 建立完成後，會進入到container內的 /workspaces 目錄，在目錄下開啟 終端機建立專案

```shell
# 設定 "--directory ." 才能使 project 產生於 /workspace 內
ng new [Your ProjectName] --directory .
```

## 將現有Angular專案加入 devContainer

1. 將 `.devcontainer` 複製到專案資料夾

    ```shell
    # 僅使用 docker
    git clone https://github.com/cymondez/angular-devcontainer-sample.git
    cd angular-devcontainer-sample/docker-only
    cp .devcontainer /<your project path>/

    # 使用 docker-compose
    git clone https://github.com/cymondez/angular-devcontainer-sample.git/
    cd angular-devcontainer-sample/docker-compose
    cp .devcontainer /<your project path>/
    ```

2. 使用 VSCode 開啟專案資料夾 並 設定 .devcontainer/devcontainer.json 內的 ng-cli 版本與現有專案相同
3. 啟動 `Remote-Containers: Open Workspace in Container...` 建立開發環境
4. container 建立完成後，會自動執行 `npm install`
