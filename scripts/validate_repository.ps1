$ErrorActionPreference = 'Stop'

$repoRoot = Split-Path -Parent $PSScriptRoot
$skillRoot = Join-Path $repoRoot 'skills/hedy-content-positioning'

$requiredRepoFiles = @(
    'README.md',
    'README_EN.md',
    'LICENSE',
    '.gitignore',
    'evals/cases.md',
    'evals/rubric.md',
    'evals/beta-feedback-template.md',
    'assets/examples/hedy-content-positioning-cards.html',
    'assets/examples/hedy-content-positioning-card.png',
    'assets/examples/hedy-7-day-validation-card.png'
)

$requiredSkillFiles = @(
    'SKILL.md',
    'agents/openai.yaml',
    'references/diagnosis-method.md',
    'references/interview-questions.md',
    'references/inner-core-discovery.md',
    'references/candidate-evaluation.md',
    'references/existing-account-audit.md',
    'references/validation-rules.md',
    'references/output-template.md',
    'references/examples.md'
)

$missing = @()
foreach ($relativePath in $requiredRepoFiles) {
    if (-not (Test-Path -LiteralPath (Join-Path $repoRoot $relativePath))) {
        $missing += $relativePath
    }
}
foreach ($relativePath in $requiredSkillFiles) {
    if (-not (Test-Path -LiteralPath (Join-Path $skillRoot $relativePath))) {
        $missing += "skills/hedy-content-positioning/$relativePath"
    }
}
if ($missing.Count -gt 0) {
    throw "Missing required files: $($missing -join ', ')"
}

$forbiddenSkillEntries = @('README.md', 'README_EN.md', 'LICENSE', 'evals', 'scripts')
$unexpected = @()
foreach ($entry in $forbiddenSkillEntries) {
    if (Test-Path -LiteralPath (Join-Path $skillRoot $entry)) {
        $unexpected += $entry
    }
}
if ($unexpected.Count -gt 0) {
    throw "Repository-only entries found inside skill folder: $($unexpected -join ', ')"
}

$skill = Get-Content -LiteralPath (Join-Path $skillRoot 'SKILL.md') -Encoding UTF8 -Raw
$yaml = Get-Content -LiteralPath (Join-Path $skillRoot 'agents/openai.yaml') -Encoding UTF8 -Raw
$publicTextFiles = Get-ChildItem -LiteralPath $repoRoot -Recurse -File |
    Where-Object {
        $_.FullName -notmatch '\\.git(\\|$)' -and
        $_.FullName -ne $PSCommandPath -and
        $_.Extension -in '.md', '.yaml', '.yml', '.txt', '.ps1'
    }
$joinedText = ($publicTextFiles | ForEach-Object {
    Get-Content -LiteralPath $_.FullName -Encoding UTF8 -Raw
}) -join "`n"

$checks = @(
    @{ Name = 'skill name'; Pass = $skill -match '(?m)^name:\s*hedy-content-positioning\s*$' },
    @{ Name = 'skill description'; Pass = $skill -match '(?m)^description:\s*Use when.+' },
    @{ Name = 'single-question rule'; Pass = $joinedText -match '一次只问一个问题' },
    @{ Name = 'candidate positioning'; Pass = $joinedText -match '2 至 3 个定位候选' },
    @{ Name = 'minimum evidence gate'; Pass = $joinedText -match '六项最小证据门槛' },
    @{ Name = 'existing account audit'; Pass = $joinedText -match '已有账号审计' },
    @{ Name = 'inner core audit'; Pass = $joinedText -match 'IP 内核与长期能量审计' },
    @{ Name = 'candidate dimensions'; Pass = $joinedText -match '证据强度' -and $joinedText -match '验证成本' },
    @{ Name = 'one core content line'; Pass = $joinedText -match '核心主线' -and $joinedText -match '证明线' -and $joinedText -match '人格与关系线' },
    @{ Name = 'commercial connection hypothesis'; Pass = $joinedText -match '商业连接假设' },
    @{ Name = 'two-card output'; Pass = $joinedText -match '内容定位卡' -and $joinedText -match '7 天验证行动卡' },
    @{ Name = 'three-by-four visual'; Pass = $joinedText -match '竖版 3:4' },
    @{ Name = 'visual dimensions'; Pass = $joinedText -match '1200 × 1600' },
    @{ Name = 'editorial visual style'; Pass = $joinedText -match 'Editorial Infographic' -and $joinedText -match '编号分区' },
    @{ Name = 'summary block'; Pass = $joinedText -match '总结 / SUMMARY' },
    @{ Name = 'readme card images'; Pass = $joinedText -match 'assets/examples/hedy-content-positioning-card.png' -and $joinedText -match 'assets/examples/hedy-7-day-validation-card.png' },
    @{ Name = 'seven-day validation'; Pass = $joinedText -match '7 天验证' },
    @{ Name = 'validation signals'; Pass = $joinedText -match '目标用户信号' -and $joinedText -match '商业行动信号' -and $joinedText -match '个人能量信号' },
    @{ Name = 'validation decisions'; Pass = $joinedText -match '保留' -and $joinedText -match '调整' -and $joinedText -match '放弃或降级' },
    @{ Name = 'confidence levels'; Pass = $joinedText -match '高、中、待验证' },
    @{ Name = 'v0.2 status'; Pass = $joinedText -match 'v0\.2\.\d+' },
    @{ Name = 'display name'; Pass = $yaml -match 'display_name:\s*"一人公司内容定位师"' },
    @{ Name = 'explicit invocation'; Pass = $joinedText -match '\$hedy-content-positioning' },
    @{ Name = 'no placeholders'; Pass = $joinedText -notmatch '(?im)\b(TBD|TODO)\b|待补充|稍后填写' },
    @{ Name = 'no private project'; Pass = $joinedText -notmatch 'Hedy-advisor|AI 人生教练|D:\\GoogleMirror|C:\\Users\\Laptop' },
    @{ Name = 'no private finance'; Pass = $joinedText -notmatch '15万|78万|家庭财务' }
)

$failed = $checks | Where-Object { -not $_.Pass }
if ($failed.Count -gt 0) {
    throw "Failed checks: $((($failed | ForEach-Object Name) -join ', '))"
}

Write-Output 'REPOSITORY_VALIDATION_OK'

