# 天堂 L1J-TW 原始碼開發者索引 (README_DEV_SRC)

本索引引導開發者查閱 `src` 目錄下所有 Java 檔案的詳細功能說明。為了提高閱讀效率，說明文件依據功能包 (Package) 進行分類。

---

## 📑 說明文件目錄

### 1. 核心系統與運行控制
- [**SRC_CORE.md**](file:///D:/新增資料夾/遊戲/天堂V2/L1j-TW-main/SRC_CORE.md)
  - 涵蓋 `net.l1j.server` 根目錄下的核心類別。
  - 包含伺服器啟動、連線管理、全伺服器計時器等。

### 2. 資料庫數據快取 (Data Tables)
- [**SRC_DATATABLES.md**](file:///D:/新增資料夾/遊戲/天堂V2/L1j-TW-main/SRC_DATATABLES.md)
  - 涵蓋所有 `datatables` 包下的類別。
  - 負責從資料庫讀取並快取道具、NPC、掉落等靜態數據。

### 3. 遊戲物件模型 (Game Models)
- [**SRC_MODEL.md**](file:///D:/新增資料夾/遊戲/天堂V2/L1j-TW-main/SRC_MODEL.md)
  - 涵蓋 `model` 包及其子包的所有類別。
  - 包含玩家 (`L1PcInstance`)、怪物 (`L1NpcInstance`)、攻擊公式、魔法邏輯地圖處理等。

### 4. 封包收發處理 (Packets)
- [**SRC_PACKETS.md**](file:///D:/新增資料夾/遊戲/天堂V2/L1j-TW-main/SRC_PACKETS.md)
  - 涵蓋 `clientpackets` (接收) 與 `serverpackets` (發送) 的所有檔案。

### 5. 其他輔助系統
- [**SRC_OTHERS.md**](file:///D:/新增資料夾/遊戲/天堂V2/L1j-TW-main/SRC_OTHERS.md)
  - 涵蓋 `command` (指令)、`storage` (存儲)、`taskmanager` (計時任務) 與 `templates` (模板)。

---

## 💡 使用建議
若您想要修改特定功能，請先根據功能類別點擊上方對應的文件。例如：
- 修改 **道具屬性** -> 前往 `SRC_DATATABLES.md` 查詢 `ItemTable.java`。
- 修改 **技能擊退/傷害** -> 前往 `SRC_MODEL.md` 查詢 `L1Magic.java`。
- 修改 **登入流程** -> 前往 `SRC_CORE.md` 查詢 `LoginController.java`。

---
*最後更新時間：2026-03-31*
