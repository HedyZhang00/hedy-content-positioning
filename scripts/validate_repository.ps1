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
$outputTemplate = Get-Content -LiteralPath (Join-Path $skillRoot 'references/output-template.md') -Encoding UTF8 -Raw
$exampleHtml = Get-Content -LiteralPath (Join-Path $repoRoot 'assets/examples/hedy-content-positioning-cards.html') -Encoding UTF8 -Raw
$card1Html = [regex]::Match($exampleHtml, '(?s)<article class="card" id="card1">.*?</article>').Value
$card2Html = [regex]::Match($exampleHtml, '(?s)<article class="card" id="card2">.*?</article>').Value
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
    @{ Name = 'visual dimensions'; Pass = $joinedText -match '1080 × 1620' },
    @{ Name = 'editorial visual style'; Pass = $joinedText -match 'Editorial Infographic' -and $joinedText -match '编号分区' },
    @{ Name = 'reference card styling'; Pass = $joinedText -match '圆角编号' -and $joinedText -match '白色信息框' -and $joinedText -match '浅色总结区' },
    @{ Name = 'design system palette'; Pass = @('#F6F2E8', '#1A1A1A', '#D7E85C', '#F4B4C6', '#F0A868', '#BEB0E8', '#F0F4D0', '#8A8574') | ForEach-Object { $outputTemplate -match [regex]::Escape($_) } | Where-Object { -not $_ } | Measure-Object | Select-Object -ExpandProperty Count | ForEach-Object { $_ -eq 0 } },
    @{ Name = 'fixed color semantics'; Pass = $outputTemplate -match '柠青.*核心' -and $outputTemplate -match '暖粉.*人.*关系' -and $outputTemplate -match '杏橙.*风险' -and $outputTemplate -match '雾紫.*方法.*系统' },
    @{ Name = 'design system type scale'; Pass = $outputTemplate -match '50px' -and $outputTemplate -match '26px' -and $outputTemplate -match '19px.*1\.75' -and $outputTemplate -match '15px' },
    @{ Name = 'design system spacing'; Pass = $outputTemplate -match '56.?60px' -and $outputTemplate -match '72px.*76px' -and $outputTemplate -match '60px 对齐' },
    @{ Name = 'design system limits'; Pass = $outputTemplate -match '最多 5 个模块' -and $outputTemplate -match '一处黑底反白' -and $outputTemplate -match '正文单段不超过 2 行' },
    @{ Name = 'example card module limit'; Pass = ([regex]::Matches($card1Html, '<section class="section">').Count -le 5) -and ([regex]::Matches($card2Html, '<section class="section">').Count -le 5) },
    @{ Name = 'example card single action bar'; Pass = ([regex]::Matches($card1Html, 'class="day-action"').Count -le 1) -and ([regex]::Matches($card2Html, 'class="day-action"').Count -le 1) },
    @{ Name = 'example card design scale'; Pass = $exampleHtml -match 'padding:\s*72px 76px 0' -and $exampleHtml -match 'h1\s*\{(?s:.*?)font-size:\s*50px' -and $exampleHtml -match '\.section\s*\{\s*margin-bottom:\s*(56|60)px' },
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

