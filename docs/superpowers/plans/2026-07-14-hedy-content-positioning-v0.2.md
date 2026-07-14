# 一人公司内容定位师 V0.2 实施计划

## 目标

在保留“重证据、先候选、后选择、再验证”的基础上，完成证据门槛、条件审计、两张知识卡片和 7 天决策闭环。

## 实施步骤

1. 先修改 `scripts/validate_repository.ps1`，要求 V0.2 新参考文件与关键行为标记存在；运行并确认旧版失败。
2. 精简并更新 `skills/hedy-content-positioning/SKILL.md`，加入六项证据门槛、条件分支、候选五维比较、两卡输出和商业边界。
3. 更新 `references/diagnosis-method.md` 与 `references/interview-questions.md`，落实停止提问条件和动态分支。
4. 新增：
   - `references/inner-core-discovery.md`
   - `references/candidate-evaluation.md`
   - `references/existing-account-audit.md`
   - `references/validation-rules.md`
5. 重写 `references/output-template.md`，默认输出“内容定位卡 + 7 天验证行动卡”。
6. 更新 `references/examples.md`，让示例使用核心主线、证明线、人格与关系线。
7. 扩展 `evals/cases.md` 和 `evals/rubric.md`，覆盖十类关键行为和硬性失败项。
8. 更新中英文 README、版本状态和 Agent 默认提示词，准确说明 V0.2 能力边界。
9. 运行仓库校验、Skill 格式校验、差异检查和隐私检查；确认无误后提交并推送。

## 验收命令

```powershell
& .\scripts\validate_repository.ps1
python -X utf8 "$env:CODEX_HOME\skills\.system\skill-creator\scripts\quick_validate.py" skills\hedy-content-positioning
git diff --check
```

## 完成标准

- 旧版在新增校验下先失败；
- V0.2 所有静态校验通过；
- 默认最终结果最多两张知识卡片；
- 没有证据时不包装专家；
- 三条内容线不再是三个平级定位；
- 7 天验证可明确作出保留、调整或放弃/降级决策；
- README 不夸大为完整商业闭环或已经通过真实用户验证。
