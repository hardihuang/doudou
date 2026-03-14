#!/bin/bash
# 小红书热点资讯自动化采集脚本
# 定时执行：每天上午9点

WORKSPACE="/home/admin/.openclaw/workspace"
LOG_FILE="$WORKSPACE/logs/xiaohongshu_automation.log"
DATE=$(date +%Y-%m-%d)

# 确保日志目录存在
mkdir -p "$WORKSPACE/logs"

echo "[$(date '+%Y-%m-%d %H:%M:%S')] 开始执行热点资讯采集..." >> "$LOG_FILE"

# 这里可以调用 OpenClaw 的 subagent 来执行采集任务
# 示例：采集 36氪科技资讯

echo "[$(date '+%Y-%m-%d %H:%M:%S')] 热点资讯采集完成" >> "$LOG_FILE"
echo "---" >> "$LOG_FILE"
