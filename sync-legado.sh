#!/bin/bash
# ============================================================
# Legado 10 个镜像统一自动同步脚本
# 原理：对比每个源仓库(refs/heads + refs/tags) 与目标镜像仓库的引用
#      完全一致 -> 无更新，跳过；有差异 -> 重新拉取并推送（仅分支+标签）
# 用法：GH_TOKEN=<PAT> bash sync-legado.sh
# ============================================================
set -euo pipefail

OWNER="wuge0"
: "${GH_TOKEN:?需要设置 GH_TOKEN (PAT) 环境变量}"

# 映射：目标仓库名 | 源仓库
map=(
  "legado|Rimchars/legado"
  "Legado_Max|Suml-1/Legado_Max"
  "legado-huajideshutiao|huajideshutiao/legado"
  "legado_NG|joestar817/legado_NG"
  "legadoC|CCSSNE/legadoC"
  "legado-with-MD3|HapeLee/legado-with-MD3"
  "legadoT|skybbk1001/legadoT"
  "mr|DandanLLab/mr"
  "qysg|autobcb/qysg"
  "legado-jingshiro|Jingshiro/legado"
)

TMP=$(mktemp -d)
trap 'rm -rf "$TMP"' EXIT

synced=0; skipped=0; failed=0
echo "===== Legado 镜像统一同步 $(date -u '+%Y-%m-%d %H:%M UTC') ====="

for entry in "${map[@]}"; do
  tgt="${entry%%|*}"
  src="${entry##*|}"
  echo "--- [$tgt] <= [$src] ---"

  src_refs="$TMP/${tgt}.src"; tgt_refs="$TMP/${tgt}.tgt"
  if ! git ls-remote "https://github.com/$src.git" 'refs/heads/*' 'refs/tags/*' 2>/dev/null | sort > "$src_refs"; then
    echo "  源不可达，跳过"; failed=$((failed+1)); continue
  fi
  if ! git ls-remote "https://github.com/$OWNER/$tgt.git" 'refs/heads/*' 'refs/tags/*' 2>/dev/null | sort > "$tgt_refs"; then
    echo "  目标不可达，跳过"; failed=$((failed+1)); continue
  fi

  if diff -q "$src_refs" "$tgt_refs" >/dev/null 2>&1; then
    echo "  无新更新，跳过同步"; skipped=$((skipped+1)); continue
  fi

  echo "  检测到上游更新，同步中..."
  if git clone --mirror "https://github.com/$src.git" "$TMP/${tgt}.git" >/dev/null 2>&1 \
     && git -C "$TMP/${tgt}.git" push "https://oauth2:${GH_TOKEN}@github.com/$OWNER/$tgt.git" \
          'refs/heads/*:refs/heads/*' 'refs/tags/*:refs/tags/*' >/dev/null 2>&1; then
    echo "  同步完成（分支/标签已更新）"; synced=$((synced+1))
  else
    echo "  同步失败"; failed=$((failed+1))
  fi
done

echo "===== 完成：同步 $synced 个，跳过 $skipped 个，失败 $failed 个 ====="
[ "$failed" -gt 0 ] && exit 1 || exit 0
