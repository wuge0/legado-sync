# Legado 替代版本 · 优缺点对比与选型推荐

> 背景：官方 `gedoor/Legado` 主仓库仍在（★47k），但官方已约 4 个月未更新（最后推送 2026-05-27）。以下是 10 个社区替代版本，均兼容 Legado 书源生态。优点多来自各项目官方描述，缺点为基于技术常识的合理推断，供选型参考。

## 优缺点对比

**阅读 Archive**（[Rimchars/legado](https://github.com/Rimchars/legado)）
- 优点：功能最全，AI、EPUB、漫画、视频、主题全覆盖；社区续更主力。
- 缺点：功能多导致包体较大、设置复杂；对轻度用户偏冗余。

**阅读 Sigma**（[Rimchars/legado](https://github.com/Rimchars/legado)）
- 优点：官方版直接优化，同包名可覆盖原版无缝升级；更新最频繁。
- 缺点：属测试版，新功能可能有 bug；需频繁跟更新。

**阅读 Max**（[Suml-1/Legado_Max](https://github.com/Suml-1/Legado_Max)）
- 优点：基于 lyc 版功能实用；提供 3 种共存包不覆盖原版，可新旧并用。
- 缺点：多包名选择略纠结；功能堆叠，上手门槛稍高。

**阅读 薯条**（[huajideshutiao/legado](https://github.com/huajideshutiao/legado)）
- 优点：MD3 风格好看、更新快、跟随官方。
- 缺点：风格向番茄靠拢，自定义深度可能不如原版。

**阅读 NG**（[joestar817/legado_NG](https://github.com/joestar817/legado_NG)）
- 优点：基于 Sigma 独立演进，路线更"下一代"。
- 缺点：独立分支，更新节奏与稳定性待观察。

**阅读 Color/C**（[CCSSNE/legadoC](https://github.com/CCSSNE/legadoC)）
- 优点：听书体验优化（番茄向），多媒体、AI 净化。
- 缺点：主打听书，纯文本阅读党不一定需要。

**阅读 MD3**（[HapeLee/legado-with-MD3](https://github.com/HapeLee/legado-with-MD3)）
- 优点：Material Design 3 全新界面，颜值高。
- 缺点：偏重界面重构，功能为原版基础上。

**阅读 T**（[skybbk1001/legadoT](https://github.com/skybbk1001/legadoT)）
- 优点：支持 cron 定时任务（自动抓更新等）。
- 缺点：小众改动，更新频率低。

**MR 多媒体阅读器**（[DandanLLab/mr](https://github.com/DandanLLab/mr)）
- 优点：Flutter 跨平台（还能 iOS/桌面），完全兼容 Legado 书源。
- 缺点：跨平台框架导致性能/稳定性可能不如原生 Kotlin；书源适配偶有差异。

**轻悦时光**（[autobcb/qysg](https://github.com/autobcb/qysg)）
- 优点：多平台（Android/iOS/鸿蒙/Windows）。
- 缺点：基于 webview 跑书源，复杂书源兼容性可能受限。

## 选型推荐

**想无缝升级、跟着官方最新** → 阅读 Sigma（同包名覆盖原版）。

**要功能最全、AI/漫画/视频都要** → 阅读 Archive。

**想新旧共存、不破坏现有配置试水** → 阅读 Max（独立包名）。

**主要听书、想要番茄风界面** → 阅读 Color/C。

**想在 iOS/多设备上看** → MR 或轻悦时光。

**有自动化需求（定时抓更新）** → 阅读 T。

**一句话结论**：日常主力推荐阅读 Archive（最稳、功能全）或阅读 Sigma（紧跟官方）；书源完全兼容，换过去书单与书源基本都能直接迁移。
