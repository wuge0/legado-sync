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

## 手动运行

```bash
GH_TOKEN=<你的PAT> bash sync-legado.sh
```

或直接到仓库 Actions → **Sync Legado Mirrors** → **Run workflow**。
