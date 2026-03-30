# L1J-TW 原始碼 (SRC) 結構詳細說明

本文件詳細解析 `src` 目錄下的核心封包與類別功能，協助開發者快速定位邏輯代碼。專案採用分層架構，主要逻辑集中在 `net.l1j.server` 及其子包中。

---

## 📂 核心包結構 (net.l1j.server)

### 1. 核心運行控制 (Server Core)
- **`GameServer.java`**：伺服器的主入口點，負責初始化各個系統並啟動監聽連線。
- **`ClientThread.java`**：處理單個客戶端連線的執行緒，負責接收與解密封包。
- **`PacketHandler.java`**：封包分發中心，根據封包編碼 (Opcode) 呼叫對應的處理程式。
- **`Opcodes.java`**：定義與客戶端通訊的封包編碼。

### 2. 資料快取層 (datatables)
此包負責從資料庫讀取數據並快取於記憶體中，是遊戲運行中頻繁存取的數據來源：
- **`ItemTable.java`**：所有道具數據（武器、防具、藥水等）。
- **`NpcTable.java`**：所有 NPC 與怪物的基本屬性。
- **`SpawnTable.java` / `NpcSpawnTable.java`**：怪物與 NPC 在地圖上的出生位置。
- **`DropTable.java`**：怪物死亡後的掉落物品與機率。
- **`SkillsTable.java`**：全職夜技能的數值與效果定義。
- **`ShopTable.java`**：商店販售的物品清單。

### 3. 遊戲模型層 (model)
這是遊戲邏輯最密集的地方，定義了遊戲世界中所有實體的行為：
- **`L1PcInstance.java`**：代表玩家角色 (Player Character)，包含屬性、血量、狀態處理。
- **`L1NpcInstance.java`**：代表 NPC 或怪物實體。
- **`L1World.java`**：管理伺服器內所有在線物件（玩家、NPC、地上的物品）。
- **`L1Attack.java` / `L1Magic.java`**：處理物理攻擊與魔法攻擊的數值計算、命中計算。
- **`L1Inventory.java`**：背包系統邏輯。
- **`L1Teleport.java`**：處理傳送、地圖切換邏輯。

### 4. 網路通訊層 (Packets)
- **`clientpackets/`**：處理客戶端傳遞過來的請求（如：使用道具、說話、移動）。
- **`serverpackets/`**：建立發送給客戶端的通知（如：顯示訊息、更新血條、播放動畫）。

### 5. 時間任務管理 (taskmanager / Time Controllers)
管理所有具備時間補償或定時觸發的機制：
- **`HpRegeneration.java`**：玩家與怪物的回血邏輯。
- **`WarTimeController.java`**：攻城戰時間管理。
- **`FishingTimeController.java`**：釣魚系統計時。
- **`AuctionTimeController.java`**：盟屋拍賣時間管理。

---

## 🛠️ 常見修改定位

| 修改目標 | 建議查看路徑 |
| :--- | :--- |
| **调整技能效果 / 魔法數值** | `src/net/l1j/server/model/L1Magic.java` 或 `skill/` 目錄 |
| **修改攻擊命中 / 暴擊邏輯** | `src/net/l1j/server/model/L1Attack.java` |
| **新增 GM 指令** | `src/net/l1j/server/command/executor/` |
| **自定義道具特殊效果** | `src/net/l1j/server/clientpackets/C_UseItem.java` |
| **調整 NPC 對話處理** | `src/net/l1j/server/clientpackets/C_NPCAction.java` |

---
*文件產生時間：2026-03-31*
