# Hedy Content Positioning

An interview-driven Agent Skill for solo business owners who need a clear, testable content positioning.

> Status: `v0.1.0` beta. Repository structure, format, encoding, and privacy checks pass. Real-user behavioral validation is still being collected.

## What it does

It helps creators with real expertise or an existing business turn evidence, audience needs, and business goals into:

- one positioning hypothesis;
- one priority audience;
- three distinct content pillars;
- a 7-day validation plan.

## Who it is for

Use it when you have professional experience or a business foundation, but your content feels scattered or disconnected from your work.

## Install across compatible agents

This project follows the open [Agent Skills specification](https://agentskills.io/) and has been verified as discoverable by the universal `skills` installer.

With Node.js installed, run:

```bash
npx skills add HedyZhang00/hedy-content-positioning --skill hedy-content-positioning -g
```

The installer can detect or prompt for compatible agents, including Codex, Claude Code, Cursor, GitHub Copilot, and OpenCode.

To target a specific agent:

```bash
# Codex
npx skills add HedyZhang00/hedy-content-positioning --skill hedy-content-positioning -g -a codex

# Claude Code
npx skills add HedyZhang00/hedy-content-positioning --skill hedy-content-positioning -g -a claude-code

# Cursor
npx skills add HedyZhang00/hedy-content-positioning --skill hedy-content-positioning -g -a cursor
```

To install it for every supported agent detected on the computer:

```bash
npx skills add HedyZhang00/hedy-content-positioning --skill hedy-content-positioning -g --agent '*'
```

Restart the agent or open a new conversation after installation. Products that do not support the Agent Skills standard may require a different extension mechanism.

For manual installation, copy `skills/hedy-content-positioning` into the target agent's Skills directory.

## Invoke

```text
$hedy-content-positioning
```

## Language note

Version 0.1.0 is designed and evaluated primarily for Chinese interviews and Chinese content strategy. The English README explains the project but does not claim equivalent English-language evaluation.

## License

[MIT](LICENSE) © 2026 Hedy
