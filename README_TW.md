# L1J-TW 天堂私人伺服器專案說明文件

歡迎使用 L1J-TW 天堂私人伺服器專案。本文件旨在協助開發者快速了解本專案的架構、配置與啟動流程。

---

## 📂 專案目錄結構

| 目錄 / 檔案 | 說明 |
| :--- | :--- |
| **`src/`** | **Java 原始碼**：包含所有遊戲邏輯、網路處理、NPC 行為及玩家管理的核心程式。 |
| **`config/`** | **伺服器設定檔**：存放所有 `.properties` 檔案，用於調整遊戲倍率、資料庫連線、各類系統開關。 |
| **`db/`** | **資料庫腳本**：包含建立 MySQL 表格 (`make_tables.sql`) 及初始數據的 SQL 檔案。 |
| **`data/`** | **遊戲數據**：非資料庫形式的數據，如 XML 格式的技能、NPC 對話、地圖資訊等。 |
| **`lib/`** | **函式庫**：存放伺服器執行所需的 Java JAR 依賴包。 |
| **`map/`** | **地圖檔**：伺服器載入地圖地形、座標資訊的核心數據。 |
| **`L1jWeb/`** | **網頁組件**：提供簡單的網頁介面或伺服器導航頁。 |
| **`tool/`** | **維護工具**：開發者使用的輔助工具。 |
| **`build.xml`** | **Ant 編譯腳本**：用於將原始碼編譯為可執行檔。 |
| **`ServerStart.bat`** | **啟動腳本**：Windows 下啟動遊戲伺服器的快捷程式。 |

---

## 🚀 快速上手步驟

### 1. 資料庫配置
在啟動伺服器前，請務必修改資料庫連線資訊：
- 開啟檔案：`config/database.properties`
- 修改以下欄位以符合您的 MySQL 設定：
  ```properties
  driver=com.mysql.jdbc.Driver
  url=jdbc:mysql://localhost:3306/l1jdb?useUnicode=true&characterEncoding=utf8
  user=您的用戶名
  password=您的密碼
  ```

### 2. 匯入資料庫
請使用 MySQL 管理工具（如 Navicat 或 HeidiSQL）執行 `db/` 目錄下的 SQL 腳本以初始化資料庫。

### 3. 編譯與執行
- **編譯**：若有修改源碼，請使用 Apache Ant 執行 `build.xml`。
- **啟動**：雙擊 `ServerStart.bat` 即可啟動伺服器。

---

## 🛠️ 重點檔案說明 (Config)

- **`rates.properties`**：調整經驗值、金幣、掉落倍率。
- **`server.properties`**：伺服器 Port 號、最大人數、自動備份等設定。
- **`altsettings.properties`**：各種遊戲內行為（如負重限制、寵物系統、藥水延遲）的進階設定。

---

## 📝 注意事項
- 本專案純屬學術研究與技術測試用途，請勿用於商業目的。
- 建議在進行重大修改前，先備份資料庫與原始碼。

---
*文件產生時間：2026-03-31*
