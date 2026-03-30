# 原始碼詳細說明：封包處理與通訊 (SRC_PACKETS)

本文件詳細記錄 `net.l1j.server.clientpackets` 與 `net.l1j.server.serverpackets` 包下的所有檔案。這些檔案負責伺服器與遊戲客戶端 (Client) 之間的數據收發與邏輯處理。

---

## 📂 clientpackets (接收玩家請求)
玩家在遊戲中的操作（如移動、點擊、使用道具）會發送封包至伺服器。以下是常見操作對應的處理類別：

### 1. 遊戲基礎操作
| 檔案名稱 | 詳細功能說明 |
| :--- | :--- |
| **`C_Attack.java`** | 處理玩家物理攻擊請求，呼叫 `L1Attack` 進行計算。 |
| **`C_MoveChar.java`** | 處理玩家移動請求，負責更新座標並檢查障礙物。 |
| **`C_ChangeHeading.java`** | 處理玩家原地轉向（不位移）。 |
| **`C_ItemUSe.java`** | **核心邏輯檔案**。處理所有道具的使用，從藥水到卷軸的複雜判斷。 |
| **`C_UseSkill.java`** | 處理玩家主動施放魔法或技能的請求。 |
| **`C_PickUpItem.java`** | 處理玩家撿取地上物品的動作。 |
| **`C_DropItem.java`** | 處理玩家將物品丟棄至地上的動作。 |
| **`C_Disconnect.java`** | 處理玩家正常登出或斷線的流程。 |
| **`C_Restart.java`** | 處理玩家選擇「重啟遊戲」或「回到人物選單」。 |

### 2. 社交與溝通
| 檔案名稱 | 詳細功能說明 |
| :--- | :--- |
| **`C_Chat.java`** | 處理一般說話、大喊、盟聊等大部分聊天訊息。 |
| **`C_ChatWhisper.java`** | 處理私人密語 (Whisper)。 |
| **`C_AddBookmark.java`** | 處理玩家儲存記憶座標 (F5 記憶)。 |
| **`C_AddBuddy.java`** | 處理新增好友請求。 |
| **`C_CreateParty.java`** | 處理發起組隊邀請。 |
| **`C_JoinClan.java`** | 處理申請加入血盟。 |
| **`C_LeaveClan.java`** | 處理退出血盟請求。 |

### 3. NPC 互動與介面
| 檔案名稱 | 詳細功能說明 |
| :--- | :--- |
| **`C_NPCTalk.java`** | 處理點擊 NPC 開啟對話框的動作。 |
| **`C_NPCAction.java`** | **核心互動檔案**。處理所有點擊對話框按鈕（如：傳送、對話導向、任務選擇）的行為。 |
| **`C_Shop.java`** | 處理玩家與商店 NPC 的買賣交易確認。 |
| **`C_Deposit.java`** | 處理與倉庫管理員對話存款/存物。 |
| **`C_Drawal.java`** | 處理領取存款。 |

---

## 📂 serverpackets (發送伺服器通知)
伺服器計算結果後，發送封包通知客戶端更新畫面或數據。

### 1. 狀態與數據更新
| 檔案名稱 | 詳細功能說明 |
| :--- | :--- |
| **`S_OwnCharStatus.java`** | 發送玩家屬性更新 (力量、敏捷、智力等)。 |
| **`S_HPUpdate.java`** | 更新玩家目前的生命值 (HP) 顯示。 |
| **`S_MPUpdate.java`** | 更新玩家目前的魔力值 (MP) 顯示。 |
| **`S_Exp.java`** | 更新玩家目前的經驗值百分比。 |
| **`S_Lawful.java`** | 更新玩家正義值 (Lawful) 數值。 |
| **`S_Ability.java`** | 更新玩家特殊抗性或能力加成狀態。 |

### 2. 視覺與訊息傳遞
| 檔案名稱 | 詳細功能說明 |
| :--- | :--- |
| **`S_ChatPacket.java`** | 發送聊天室內容至玩家畫面。 |
| **`S_SystemMessage.java`** | 發送系統訊息（黃色文字），主要用於提示與警告。 |
| **`S_ServerMessage.java`** | 發送索引式的系統預設訊息（如：$123 類型的帶編碼訊息）。 |
| **`S_SkillSound.java`** | 通知客戶端播放特定技能的動畫與音效。 |
| **`S_DoActionGFX.java`** | 指令客戶端播放特定的動作動畫。 |
| **`S_EffectLocation.java`** | 在指定地點播放範圍特效或魔法效果。 |

### 3. 物品與世界感知
| 檔案名稱 | 詳細功能說明 |
| :--- | :--- |
| **`S_InvList.java`** | 發送玩家整個背包物品的完整清單。 |
| **`S_AddItem.java`** | 通知客戶端背包新增了某個物品。 |
| **`S_DeleteInventoryItem.java`** | 通知客戶端從背包中刪除某個物品。 |
| **`S_NPCPack.java`** | 將周圍新出現的 NPC/怪物的資訊（圖形、座標、顏色）發送給玩家。 |
| **`S_OtherCharPacks.java`** | 將周圍其他玩家的資訊發送給當前玩家。 |
| **`S_RemoveObject.java`** | 通知客戶端某個物件已消失（離開視野、物品被撿起）。 |

---
*註：封包檔案極多（共計約 250 個），此處列出核心功能與類別，若需查詢特定檔案（如 `S_IdentifyDesc.java` 代表鑑定描述），可根據前綴 `C_` (玩家行為) 或 `S_` (伺服器通知) 進行查閱。*

*最後更新時間：2026-03-31*
