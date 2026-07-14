# 一人公司内容定位师

> 帮助已有专业能力或业务基础、却不知道该在社交媒体上持续分享什么内容的一人公司，通过证据访谈形成一个可验证的内容定位假设 V1.0，并用两张知识卡片看清定位与下一步。

An evidence-driven Agent Skill for solo business owners who need a clear, testable content positioning. It turns real expertise, audience evidence, business goals, and sustainable expression into a positioning card and a 7-day validation card.

> 当前状态：`v0.2.4` 内测版。仓库已通过结构、格式、编码和隐私检查；两张示例卡片已按统一色板、字号、间距、组件和颜色语义规范重新生成，`evals/` 提供公开行为案例，真实用户内测结果仍在持续积累。

## 它解决什么问题

很多人不是不会写，而是还没有回答：

- 我到底想被谁记住？
- 我有哪些被真实经历证明的能力？
- 我能持续讲什么？
- 这些内容最终连接什么业务？如何变现？

这款 Skill 不会只根据兴趣标签替你生成一句漂亮定位。它会一次问一个问题，从业务现实、优势证据、目标客户、历史内容反馈和长期素材中寻找交集；证据不足时会继续追问或降低置信度。

## 适合谁

- 已有专业能力、服务经验或业务基础；
- 知道内容重要，但账号主题分散；
- 希望通过内容建立信任、吸引目标客户或连接现有业务；
- 愿意花约 10 至 15 分钟接受一轮逐题采访。

不适合只想润色一篇文章、批量生成标题或分析单条数据的场景。

## 你会得到什么

默认得到两张精简知识卡片：

1. **内容定位卡**：一句话定位、优先目标人群、唯一核心主线、信任来源、证明线、人格与关系线，以及轻量商业连接假设；
2. **7 天验证行动卡**：七天动作、每条内容要验证的假设、目标用户/商业行动/个人能量信号，以及保留、调整、放弃或降级规则。

结果统一称为“内容定位假设 V1.0”，不是终身结论。

## 真实使用示例

下面是创作者使用 V0.2 完成的第一次真实自测结果。它展示 Skill 最终会交付什么，不代表目标客户中的付费需求已经得到验证。

<p align="center">
  <a href="assets/examples/hedy-content-positioning-card.png"><img src="assets/examples/hedy-content-positioning-card.png" alt="一人公司内容定位卡示例" width="48%"></a>
  <a href="assets/examples/hedy-7-day-validation-card.png"><img src="assets/examples/hedy-7-day-validation-card.png" alt="7天定位验证卡示例" width="48%"></a>
</p>

第一张卡片回答“我服务谁、讲什么、为什么是我、内容连接什么业务”；第二张卡片把定位变成 7 天实验，观察目标用户、商业行动和个人能量信号。

## 安装到主流 Agent

本项目遵循开放的 [Agent Skills 规范](https://agentskills.io/)，并已通过通用 `skills` 安装器的识别测试。

只要电脑已经安装 Node.js，就可以用一条命令安装：

```bash
npx skills add HedyZhang00/hedy-content-positioning --skill hedy-content-positioning -g
```

安装器会识别或询问你正在使用的 Agent。它支持 Codex、Claude Code、Cursor、GitHub Copilot、OpenCode 等兼容 Agent Skills 的工具。

也可以明确指定 Agent：

```bash
# Codex
npx skills add HedyZhang00/hedy-content-positioning --skill hedy-content-positioning -g -a codex

# Claude Code
npx skills add HedyZhang00/hedy-content-positioning --skill hedy-content-positioning -g -a claude-code

# Cursor
npx skills add HedyZhang00/hedy-content-positioning --skill hedy-content-positioning -g -a cursor

# GitHub Copilot
npx skills add HedyZhang00/hedy-content-positioning --skill hedy-content-positioning -g -a github-copilot

# OpenCode
npx skills add HedyZhang00/hedy-content-positioning --skill hedy-content-positioning -g -a opencode
```

如果希望安装到当前电脑上所有受支持的 Agent：

```bash
npx skills add HedyZhang00/hedy-content-positioning --skill hedy-content-positioning -g --agent '*'
```

安装后，请重新打开 Agent 或新建一个对话。对于不支持 Agent Skills 标准的产品，不能保证直接安装。

手动安装时，可下载本仓库并把 `skills/hedy-content-positioning` 目录复制到对应 Agent 的 Skills 目录。

## 使用

显式调用：

```text
$hedy-content-positioning
```

自然语言也可以触发：

```text
帮我找内容定位。
我不知道自己该持续讲什么。
帮我梳理三条内容主线。
我有专业能力，但不知道怎么转化成内容。
我的内容很散，别人不知道我是做什么的。
```

Skill 会先采访并检查六项最小证据门槛，再提供 2 至 3 个定位候选。你选择、组合或否决候选后，它才生成两张知识卡片。

如果你已经有小红书、X、公众号、视频号或 YouTube 账号，它会审阅历史内容与真实反馈。只有在候选难取舍、差异化弱或长期难以持续时，才会补充“IP 内核与长期能量审计”。

## 一个简化示例

使用前：

> 我是个设计师，想发设计、生活、美学、探店和创业，但不知道哪个最适合我，商业模式能跑通。

诊断后：

> 我帮助本地餐饮品牌，把空间设计成顾客愿意拍照和传播的体验。

内容结构只保留一个中心：空间传播方法是核心主线；真实案例与判断是证明线；相关审美观察是人格与关系线。这个结果仍需通过真实发布和咨询反馈验证。

## 方法边界

- 输出是当前证据下的定位假设，不是终身结论。
- 没有真实案例时，不包装成专家。
- 只能有一个核心主线；证明线和人格与关系线都服务于它。
- 兴趣很多时需要取舍，不用“做真实的自己”回避优先级。
- 只输出轻量商业连接假设，不代替完整产品、定价、成交和私域系统。
- 7 天后根据目标用户、商业行动和个人能量信号决定保留、调整或放弃/降级。
- 默认用两张精简知识卡片交付，不输出冗长定位报告；有渲染能力时，可进一步生成独立的 3:4 分享图片。

## 验证

在仓库根目录运行：

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\validate_repository.ps1
```

维护者还会使用 Codex `skill-creator` 自带的 `quick_validate.py` 检查 Skill 格式。仓库中的 `evals/` 提供十类行为案例和评分标准。

## 反馈与贡献

欢迎提交 Issue，尤其是以下反馈：

- 哪个问题最能帮助你想清楚定位；
- 哪个问题太抽象或难回答；
- 两张知识卡片是否让你一眼看懂定位与下一步；
- 7 天验证后，这个定位应当保留、调整还是放弃/降级。

公开真实案例前，请获得当事人授权并完成匿名处理。

## License

[MIT](LICENSE) © 2026 Hedy
