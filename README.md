# 一人公司内容定位师

> 帮助已有专业能力或业务基础、却不知道该在网上持续讲什么的一人公司，通过深度采访形成一个可验证的内容定位假设、三条内容主线和 7 天验证计划。

An interview-driven Agent Skill for solo business owners who need a clear, testable content positioning. It turns real expertise, audience evidence, and business goals into one positioning hypothesis, three content pillars, and a 7-day validation plan.

> 当前状态：`v0.1.0` 内测版。仓库已通过结构、格式、编码和隐私检查；`evals/` 提供公开行为案例，真实用户内测结果仍在持续积累。

## 它解决什么问题

很多人不是不会写，而是还没有回答：

- 我到底想被谁记住？
- 我有哪些被真实经历证明的能力？
- 我能持续讲什么？
- 这些内容最终连接什么业务？

这款 Skill 不会只根据兴趣标签替你生成一句漂亮定位。它会一次问一个问题，从业务现实、优势证据、优先读者和长期素材中寻找交集。

## 适合谁

- 已有专业能力、服务经验或业务基础；
- 知道内容重要，但账号主题分散；
- 希望通过内容建立信任、吸引目标客户或连接现有业务；
- 愿意花约 10 至 15 分钟接受一轮逐题采访。

不适合只想润色一篇文章、批量生成标题或分析单条数据的场景。

## 你会得到什么

1. 一个可验证的内容定位假设；
2. 一个未来半年优先读者及其核心问题；
3. 三条角色不同的内容主线；
4. 每条主线的边界和选题方向；
5. 一份 7 天验证计划。

## 安装

可安装的 Skill 位于：

```text
skills/hedy-content-positioning
```

在支持 Agent Skills 的 Codex 中，可以把本仓库链接发给 Codex，并说：

```text
请安装这个仓库中 skills/hedy-content-positioning 目录的 Skill。
```

也可以下载仓库后，把该目录导入个人 Skills。

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

Skill 会先采访，再提供 2 至 3 个定位候选。你选择、组合或否决候选后，它才生成完整结果。

## 一个简化示例

使用前：

> 我是独立设计师，想发设计、生活、美学、探店和创业，哪一个都不想放弃。

诊断后：

> 我帮助本地餐饮品牌，把空间设计成顾客愿意拍照和传播的体验。

三条主线分别承担：空间传播方法、真实案例与判断、相关审美观察。这个结果仍需通过真实发布和咨询反馈验证。

## 方法边界

- 输出是当前证据下的定位假设，不是终身结论。
- 没有真实案例时，不包装成专家。
- 三条主线不能是三个近义词，必须有一条连接业务。
- 兴趣很多时需要取舍，不用“做真实的自己”回避优先级。
- 7 天后根据评论原话、私信、主页访问、咨询和表达感受复盘。

## 验证

在仓库根目录运行：

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\validate_repository.ps1
```

维护者还会使用 Codex `skill-creator` 自带的 `quick_validate.py` 检查 Skill 格式。仓库中的 `evals/` 提供五类行为案例和评分标准。

## 反馈与贡献

欢迎提交 Issue，尤其是以下反馈：

- 哪个问题最能帮助你想清楚定位；
- 哪个问题太抽象或难回答；
- 你是否愿意保存或分享定位卡；
- 7 天验证后，哪条主线应该保留、调整或放弃。

公开真实案例前，请获得当事人授权并完成匿名处理。

## License

[MIT](LICENSE) © 2026 Hedy
