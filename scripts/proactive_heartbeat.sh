#!/bin/bash
# Proactive Agent Heartbeat Script v2.0
# 支持主动消息推送

WORKSPACE="/home/admin/.openclaw/workspace"
LOG_FILE="$WORKSPACE/logs/proactive_heartbeat.log"
DATE=$(date +%Y-%m-%d)
TIME=$(date '+%H:%M')

# 确保日志目录存在
mkdir -p "$WORKSPACE/logs"

echo "[$DATE $TIME] Proactive heartbeat triggered" >> "$LOG_FILE"

# 检查今日 memory 文件
TODAY_MEMORY="$WORKSPACE/memory/$DATE.md"
if [ -f "$TODAY_MEMORY" ]; then
    # 提取 In Progress 任务数量
    IN_PROGRESS_COUNT=$(grep -c "###.*进行中" "$TODAY_MEMORY" 2>/dev/null || echo "0")
    COMPLETED_COUNT=$(grep -c "###.*已完成\|✅" "$TODAY_MEMORY" 2>/dev/null || echo "0")
    
    echo "[$DATE $TIME] 进行中任务: $IN_PROGRESS_COUNT, 已完成: $COMPLETED_COUNT" >> "$LOG_FILE"
    
    # 如果有进行中的任务，记录到状态文件
    if [ "$IN_PROGRESS_COUNT" -gt 0 ]; then
        echo "active_tasks=$IN_PROGRESS_COUNT" > "$WORKSPACE/temp/heartbeat_status.txt"
        echo "last_check=$DATE $TIME" >> "$WORKSPACE/temp/heartbeat_status.txt"
    fi
fi

# 检查 subagent 状态
ACTIVE_SUBAGENTS=$(openclaw sessions list --json 2>/dev/null | grep -c "running" || echo "0")
echo "[$DATE $TIME] Active subagents: $ACTIVE_SUBAGENTS" >> "$LOG_FILE"

# 检查多维表格待审核记录（如果配置了的话）
# TODO: 添加 bitable 查询

echo "[$DATE $TIME] Heartbeat completed" >> "$LOG_FILE"
echo "---" >> "$LOG_FILE"
