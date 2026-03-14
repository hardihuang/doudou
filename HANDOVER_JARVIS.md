# CyberDeck 项目交接文档

> 交接人：豆豆 (AI Assistant)  
> 接收人：Jarvis  
> 日期：2026-03-15  
> 项目地址：https://github.com/hardihuang/mgCyberdeck

---

## 📋 项目概述

CyberDeck 是一个赛博朋克风格的多功能 Web 应用集合，包含多个小游戏和工具，设计为 800x480 固定尺寸，适合在香橙派等嵌入式设备上运行。

---

## 🎮 当前应用列表

| 应用 | 文件 | 说明 | 状态 |
|-----|------|------|------|
| 🏠 首页 | index.html | 应用导航主页 | ✅ 完成 |
| 🐍 贪吃蛇 | snake.html | 经典贪吃蛇游戏 | ✅ 完成 |
| 🍅 番茄钟 | pomodoro.html | 专注计时器 | ✅ 完成 |
| 🌱 赛博花园 | garden.html | 想法种子花园 | ✅ 完成 |
| 📝 单词卡片 | flashcards.html | 英语学习卡片 | ✅ 完成 |
| ✅ 待办事项 | todo.html | 任务管理 | ✅ 完成 |
| 🔢 计算器 | calculator.html | 科学计算器 | ✅ 完成 |
| 🐦 Flappy | flappy.html | Flappy Bird 游戏 | ✅ 完成(已优化) |
| 🎵 音频合成器 | beat.html | CyberBeat 混音器 | ✅ 完成 |

---

## 🎨 设计规范

### 视觉风格
- **背景**：深色渐变 `linear-gradient(135deg, #0a0a1a, #1a1a3a, #0d0d2d)`
- **主色**：青色 `#00ffff`
- **强调色**：粉色 `#ff00ff`、紫色 `#9d4edd`、绿色 `#00ff41`
- **字体**：`'Courier New', monospace` 或 `'Orbitron', sans-serif`
- **扫描线**：所有页面都有 CRT 扫描线效果
- **网格背景**：可选的淡青色网格

### 尺寸规范
- **固定尺寸**：800px × 480px
- **布局**：Flexbox 或 Grid
- **边距**：6px 标准间距

---

## 🔊 音效系统

### 音频库
- **文件**：`audio.js`
- **位置**：与 HTML 文件同级目录
- **引用**：`<script src="audio.js"></script>`

### 可用音效
```javascript
AudioSynth.success()   // 成功音效（吃到食物、得分）
AudioSynth.fail()      // 失败音效（撞墙、游戏结束）
AudioSynth.click()     // 点击按钮
AudioSynth.slide()     // 滑动音效（番茄钟）
AudioSynth.complete()  // 完成音效（番茄钟结束、任务完成）
AudioSynth.flip()      // 翻页音效（单词卡片）
```

### 添加音效示例
```javascript
function markCorrect() {
    if (typeof AudioSynth !== 'undefined') AudioSynth.success();
    // ... 其他代码
}
```

---

## 🚀 性能优化（香橙派适配）

### Flappy Bird 优化示例
- **粒子数量**：从 8 减少到 3
- **粒子生命周期**：缩短到 0.6
- **最大粒子数**：限制 20 个
- **绘制优化**：用矩形代替圆弧
- **更新频率**：加快清理速度

### 通用优化建议
1. 减少粒子效果数量
2. 使用简单的绘制操作（矩形 > 圆弧）
3. 限制同时存在的粒子/对象数量
4. 减少动画复杂度
5. 避免频繁的 DOM 操作

---

## 📁 文件结构

```
mgCyberdeck/
├── index.html          # 首页导航
├── snake.html          # 贪吃蛇
├── pomodoro.html       # 番茄钟
├── garden.html         # 赛博花园
├── flashcards.html     # 单词卡片
├── todo.html           # 待办事项
├── calculator.html     # 计算器
├── flappy.html         # Flappy Bird
├── beat.html           # 音频合成器
├── audio.js            # 音效库
├── tank-game.html      # 坦克游戏（可选）
└── images/             # 图片资源
    └── avatar.png      # 头像
```

---

## 🔧 维护指南

### 添加新应用
1. 创建 `newapp.html` 文件
2. 复制现有应用的 HTML 结构
3. 添加深色背景和扫描线效果
4. 引用 `audio.js`
5. 在 `index.html` 的 app-card 列表中添加入口
6. 测试音效和响应

### 修改现有应用
1. 保持 800x480 固定尺寸
2. 保持赛博朋克视觉风格
3. 添加/保持音效调用
4. 测试在香橙派上的性能
5. 提交到 GitHub

### 部署更新
```bash
cd /path/to/mgCyberdeck
git add .
git commit -m "描述更新内容"
git push
```

---

## 📝 已知问题

1. **Mixer 应用**：未找到原始文件，如需添加需要重新开发
2. **音效兼容性**：部分浏览器可能需要用户交互后才能播放音效
3. **香橙派性能**：复杂粒子效果可能导致卡顿，需要持续优化

---

## 🎯 后续建议

1. **持续优化**：根据香橙派实际运行情况调整性能
2. **添加新应用**：可以考虑添加更多小游戏或工具
3. **完善音效**：为所有交互添加合适的音效
4. **测试兼容性**：确保在香橙派 3B 上流畅运行
5. **文档更新**：维护 README.md 说明每个应用的功能

---

## 📞 联系方式

如有问题，请联系黄昊 (hardihuang) 获取支持。

---

**交接完成！祝维护顺利！** 🚀
