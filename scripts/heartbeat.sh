#!/bin/bash
# Proactive Agent Heartbeat Script
# 定期触发 proactive agent 的心跳检查

WORKSPACE="/home/admin/.openclaw/workspace"
LOG_FILE="$WORKSPACE/logs/heartbeat.log"

# 确保日志目录存在
mkdir -p "$WORKSPACE/logs"

# 记录心跳时间
echo "[$(date '+%Y-%m-%d %H:%M:%S')] Heartbeat triggered" >> "$LOG_FILE"

# 这里可以添加自定义的心跳检查逻辑
# 例如：检查任务状态、发送提醒等

# 读取 HEARTBEAT.md 中的检查项并执行
cd "$WORKSPACE"

# 1. 检查活跃任务
if [ -f "memory/$(date +%Y-%m-%d).md" ]; then
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] Checking active tasks..." >> "$LOG_FILE"
    # 提取 In Progress 部分的内容
    grep -A 20 "## In Progress" "memory/$(date +%Y-%m-%d).md" >> "$LOG_FILE" 2>/dev/null || true
fi

# 2. 运行安全审计（每天一次，在特定时间）
HOUR=$(date +%H)
if [ "$HOUR" = "09" ]; then
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] Running daily security audit..." >> "$LOG_FILE"
    if [ -f "skills/proactive-agent/scripts/security-audit.sh" ]; then
        bash skills/proactive-agent/scripts/security-audit.sh >> "$LOG_FILE" 2>&1
    fi
fi

echo "[$(date '+%Y-%m-%d %H:%M:%S')] Heartbeat completed" >> "$LOG_FILE"
echo "---" >> "$LOG_FILE"
