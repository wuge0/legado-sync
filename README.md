# Legado 镜像统一同步仓

本仓库用于 **统一自动同步** 你 GitHub 账号（`wuge0`）下 10 个 Legado 替代版本的镜像仓库。所有镜像均为**新建仓库（非 fork）**，保留源仓库的全部分支、标签与完整历史。

## 同步机制

- **工作流**：`.github/workflows/sync-legado.yml`
- **定时**：每天 UTC 02:00（北京时间 10:00）自动运行一次，也可在 Actions 手动触发
- **逻辑**：对比每个源仓库与镜像仓库的 `refs/heads` + `refs/tags` 引用
  - **完全一致 → 无更新，跳过**（不做无意义的 push）
  - **有差异 → 拉取上游并推送**（仅分支 + 标签，不含 PR 隐藏引用）
- **认证**：推送使用 `secrets.LEGADO_PAT`（需具备对目标镜像仓库的写权限）

## 镜像清单（10 个）

| 镜像仓库（wuge0 下） | 上游源 | 说明 |
|---|---|---|
| [legado](https://github.com/wuge0/legado) | Rimchars/legado | 阅读 Archive / Sigma |
| [Legado_Max](https://github.com/wuge0/Legado_Max) | Suml-1/Legado_Max | 阅读 Max（多共存包） |
| [legado-huajideshutiao](https://github.com/wuge0/legado-huajideshutiao) | huajideshutiao/legado | 阅读 薯条 |
| [legado_NG](https://github.com/wuge0/legado_NG) | joestar817/legado_NG | 阅读 NG |
| [legadoC](https://github.com/wuge0/legadoC) | CCSSNE/legadoC | 阅读 Color/C |
| [legado-with-MD3](https://github.com/wuge0/legado-with-MD3) | HapeLee/legado-with-MD3 | 阅读 MD3 |
| [legadoT](https://github.com/wuge0/legadoT) | skybbk1001/legadoT | 阅读 T |
| [mr](https://github.com/wuge0/mr) | DandanLLab/mr | MR 多媒体阅读器（Flutter） |
| [qysg](https://github.com/wuge0/qysg) | autobcb/qysg | 轻悦时光 |
| [legado-jingshiro](https://github.com/wuge0/legado-jingshiro) | Jingshiro/legado | 自用增强版 |

> 背景：官方 `gedoor/Legado` 主仓库仍在（★47k），但官方已约 4 个月未更新（最后推送 2026-05-27）。以上 10 个社区替代版本均兼容 Legado 书源生态。

## 各版本优缺点分析对比

> 优点多来自各项目官方描述；缺点为基于技术常识的合理推断（测试版稳定性、跨平台框架性能、功能堆叠复杂度等），供选型参考。

| 版本 | 活跃度 | 优点 | 缺点 |
|---|---|---|---|
| **阅读 Archive** | ★高 | 功能最全：AI、EPUB、漫画、视频、主题全覆盖；社区续更主力 | 功能多 → 包体较大、设置复杂；对轻度用户偏冗余 |
| **阅读 Sigma** | ★高 | 官方版直接优化，**同包名可覆盖原版**无缝升级；更新最频繁 | 属**测试版**，新功能可能有 bug；需频繁跟更新 |
| **阅读 Max** | ★高 | 基于 lyc 版，功能实用；提供 **3 种共存包**不覆盖原版，可新旧并用 | 多包名选择略纠结；功能堆叠，上手门槛稍高 |
| **阅读 薯条** | ★高 | MD3 风格好看、更新快、跟随官方 | 风格向番茄靠拢，自定义深度可能不如原版 |
| **阅读 NG** | ★中 | 基于 Sigma 独立演进，路线更"下一代" | 独立分支，更新节奏/稳定性待观察 |
| **阅读 Color/C** | ★中 | **听书体验优化**（番茄向），多媒体/AI 净化 | 主打听书，纯文本阅读党不一定需要 |
| **阅读 MD3** | ★高 | Material Design 3 全新界面，颜值高 | 偏重界面重构，功能为原版基础上 |
| **阅读 T** | ★低 | 支持 **cron 定时任务**（自动抓更新等） | 小众改动，更新频率低 |
| **MR 多媒体阅读器** | ★中 | **Flutter 跨平台**（还能 iOS/桌面），完全兼容 Legado 书源 | 跨平台框架 → 性能/稳定性可能不如原生 Kotlin；书源适配偶有差异 |
| **轻悦时光** | ★中 | 多平台（Android/iOS/鸿蒙/Windows） | 基于 webview 跑书源，复杂书源兼容性可能受限 |

### 按需求选型推荐

| 你的情况 | 选哪个 |
|---|---|
| 想**无缝升级、跟着官方最新** | 阅读 **Sigma**（同包名覆盖原版） |
| 要**功能最全、AI/漫画/视频都要** | 阅读 **Archive** |
| 想**新旧共存、不破坏现有配置**试水 | 阅读 **Max**（独立包名） |
| 主要**听书**、想要番茄风界面 | 阅读 **Color/C** |
| 想在 **iOS/多设备** 上看 | **MR** 或轻悦时光 |
| 有**自动化需求**（定时抓更新） | 阅读 **T** |

**一句话结论**：日常主力推荐 **阅读 Archive**（最稳、功能全）或 **阅读 Sigma**（紧跟官方）；书源完全兼容，换过去书单/书源基本都能直接迁移。

## 手动运行

```bash
GH_TOKEN=<你的PAT> bash sync-legado.sh
```

或直接到仓库 Actions → **Sync Legado Mirrors** → **Run workflow**。
