# Angular DevContainer Sample

這是 Angular 在 VSCode 使用 DevContainer 的範例。

## 使用 container 建立Angular專案

1. 建立專案資料夾
2. 將 `.devcontainer` 複製到專案資料夾
3. 使用 VSCode 開啟專案資料夾 並 設定 .devcontainer/devcontainer.json 內的 ng-cli版本
4. 啟動 `Remote-Containers: Open Workspace in Container...` 建立開發環境
5. container 建立完成後，會進入到container內的 /workspaces 目錄，在目錄下開啟 終端機建立專案

```shell
# 設定 "--directory ." 才能使 project 產生於 /workspace 內
ng new [Your ProjectName] --directory .
```

## 將現有Angular專案加入 devContainer

1. 將 `.devcontainer` 複製到專案資料夾
2. 使用 VSCode 開啟專案資料夾 並 設定 .devcontainer/devcontainer.json 內的 ng-cli 版本與現有專案相同
3. 啟動 `Remote-Containers: Open Workspace in Container...` 建立開發環境
4. container 建立完成後，會自動執行 `npm install`
