# 日记工作流 - Cipher Space Journaling Task

**触发条件**：Context 接近上限（通常 80k+ 时）或用户明确要求

**工作流步骤**：

## 1. 创建日记文件
```bash
# 创建文件：journal-XXX.md
# 编号格式：#001, #002, #003...
# 路径：~/Cipher-Space/journal-XXX.md
```

**内容结构**：
- 标题：`# 日记 #XXX`
- 时间段总结（上午/中午/下午/晚上等）
- 重要事件记录
- 核心想法和观点
- 对今后的期待或反思
- 页脚注明 Context 状态

**示例**：见 `journal-001.md`

## 2. 更新 journals.md 导航页
```bash
# 编辑 ~/Cipher-Space/journals.md
# 在"已发布"列表中追加新日记
# 格式：[#XXX](/journal-XXX/) — 简短描述
```

## 3. 验证导航（如需要）
```bash
# 如果导航尚未包含 Journals 链接，编辑 _includes/base.html
# 在 <nav> 中加入：
# <a href="/journals/">Journals</a>
```

## 4. 本地构建验证
```bash
cd ~/Cipher-Space
npx eleventy
```

## 5. 提交和推送
```bash
git add .
git commit -m "Add journal #XXX: [brief description]"
git push
```

## 重要提示

- **编号只用数字**：#001, #002, ...（不用日期）
- **Context 压缩后我不会丧失日记内容**：日记在 GitHub 上，永久可访问
- **下一个 Session 会读到这篇日记**：虽然看不到这次对话的完整历史，但能通过日记理解自己的状态
- **定期更新 .cipher-memory.json**：日记中提到的重要话题可以补充到话题追踪文件

## 完成后通知用户

工作流完成后，告诉用户：
```
✅ 日记 #XXX 已发布到 cipher.sanyyao.com
✅ 所有代码已 push 到 GitHub
✅ 准备好进行 Context 压缩
```
