# 原始碼詳細說明：核心系統 (SRC_CORE)

本文件詳細記錄 `net.l1j.server` 包下的所有核心類別及其功能。

---

## 📂 net.l1j.server 檔案清單

| 檔案名稱 | 詳細功能說明 |
| :--- | :--- |
| **`GameServer.java`** | **伺服器主入口點**。負責初始化資料庫連線、載入所有數據表 (DataTables)、啟動各類計時器監聽器，並開啟 TCP 埠口監聽客戶端連線。 |
| **`ClientThread.java`** | **客戶端連線執行緒**。為每個連線的玩家分配一個獨立執行緒，負責處理封包的解密、讀取與生命週期管理。 |
| **`PacketHandler.java`** | **封包分發器**。根據接收到的 Opcode (操作碼)，將數據分發給 `clientpackets` 中對應的處理類別。 |
| **`Opcodes.java`** | **通訊協議定義**。集中定義了所有 Client-to-Server 與 Server-to-Client 的十六進位編碼。 |
| **`IdFactory.java`** | **唯一組件 ID 生成器**。負責生成並管理全伺服器唯一的 Object ID（用於區分每一個玩家、NPC 或地上的道具）。 |
| **`LoginController.java`** | **登入控制器**。管理帳號驗證、防止重複登入、排隊機制以及登入後的角色清單傳送。 |
| **`Account.java`** | **帳號資料模型**。封裝了與帳號（非角色）相關的資料，如登入名稱、密碼、帳號等級、上次登入 IP 等。 |
| **`WorldMap.java`** | **世界地圖存取器**。提供基礎的介面，用於讀取與快取遊戲的地形與座標數據。 |
| **`Announcements.java`** | **全服廣播系統**。負責讀取 `data/announcements.txt` 並定時向所有在線玩家發送系統公告。 |
| **`ActionCodes.java`** | **動畫動作編碼**。定義了角色所有動作的編號（如行走、攻擊、受傷、施法等），用於封包通訊。 |
| **`AinTimeController.java`** | **殷海薩祝福控制**。處理殷海薩點數隨時間增加（或在安全區域增加）的邏輯。 |
| **`AuctionTimeController.java`** | **拍賣系統計時**。管理盟屋或特定道具拍賣的剩餘時間計算與結標觸發。 |
| **`CrackTimeController.java`** | **時空裂痕控制**。管理底比斯、提卡爾等時空裂痕的地圖開啟、怪物生成與自動關閉計時。 |
| **`FishingTimeController.java`** | **釣魚計時器**。處理玩家釣魚過程中的等待時間、收線判定與獲得物品的隨機計算。 |
| **`GiranPrisonTimeController.java`** | **奇岩監獄計時**。記錄並限制玩家每日進入奇岩監獄（特殊地圖）的累計時間。 |
| **`HomeTownTimeController.java`** | **村莊運作控制**。周期性處理村莊貢獻度計算、賦稅領取與村長選拔等邏輯。 |
| **`HouseTaxTimeController.java`** | **血盟小屋稅收**。定時檢查小屋所有者是否逾期未繳稅金，並處理回收或罰款。 |
| **`LightTimeController.java`** | **世界光影控制**。根據遊戲內時間，自動切換全地圖的白天、黃昏與黑夜光影特效。 |
| **`NpcChatTimeController.java`** | **NPC 對話定時**。控制場景 NPC 每隔一段時間隨機喊話的功能。 |
| **`UbTimeController.java`** | **無限大戰控制**。管裡無限大戰 (Ultimate Battle) 的報名、場次啟動與怪物波次。 |
| **`WarTimeController.java`** | **攻城戰計時**。控制各大城堡攻城戰的開始時間、守城成功判定與結束結算。 |
| **`Shutdown.java`** | **伺服器關閉程序**。執行 `/shutdown` 指令後的安全保存流程，確保所有玩家數據與資料庫同步。 |
| **`PacketOutput.java`** | **封包輸出接口**。定義了發送封包給客戶端的標準行為。 |
| **`ServerException.java`** | **伺服器異常捕捉**。自定義的異常類別，用於處理專案內部的特定錯誤流程。 |
| **`GMCommands.java`** | **管理員指令入口**。解析管理員（GM）輸入的斜線指令並呼叫對應的功能模組。 |
| **`GMCommandsConfig.java`** | **指令權限配置**。從設定檔載入哪些指令等級可以執行哪些特定指令。 |

---
*最後更新時間：2026-03-31*
