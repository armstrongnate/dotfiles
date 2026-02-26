# Developer

Welcome to my Developer directory. This is where I keep my projects. I'll be asking you to complete tasks in them
from time to time. Since this is contains **all** of my projects and repos it's important that you don't
go wandering around without a specific task. Most tasks will be scoped to a single project/folder so you shouldn't
need additional context outside the folder you're working in (generally).

This folder itself is not a git repository. It holds the various git repositories that I work on.

## Folder structure

- `inst/` — Work repos for Instructure. `canvas-lms` is a large Rails monorepo that lives here, though it doesn't see much active work these days. Current focus is on `athena-api`, `athena-poc`, and `athena-api-sdk`. Other projects are typically Canvas-adjacent or otherwise work-related.
- All other top-level folders are personal repos from my GitHub account.

## Dotfiles

The `~/Developer/dotfiles` repo contains config files synced across machines via GitHub. Whenever a file that belongs in dotfiles is created or modified, immediately copy it to the dotfiles repo, `git add`, and `git push origin master`. No branching or `wt-claude` flow needed — just a direct push to master.

Files that belong in dotfiles include (but are not limited to): `~/.zshrc`, anything under `~/.config/`, `~/.local/bin/` scripts, and this `CLAUDE.md` itself (`~/Developer/CLAUDE.md` → `dotfiles/Developer/CLAUDE.md`).

## Workflow

All new work is done in a git worktree on a dedicated branch. Worktrees are managed with [Worktrunk](https://worktrunk.dev/) (`wt`), which handles creation, teardown, and lifecycle hooks. Worktree folders are created adjacent to the source repo — e.g. `athena-api.view-chat` is the `view-chat` branch worktree of `athena-api`.

To start a worktree: `wt switch --create <branch-name>`

Branch names should be short and descriptive (e.g. `view-chat`). If there's a GitHub issue, use `gh-<num>-<desc>` (e.g. `gh-48-list-chats`).

A Worktrunk hook automatically creates a tmux session named after the branch when a worktree is created. All work happens inside that tmux session.

### Typical task flow

1. `wt switch --create <branch-name>` — creates the worktree and tmux session
2. `tmux a` — attaches to the newly created session
3. Start Claude in the first window and begin planning the task
4. Implement and test everything on the branch
5. Run lint and tests one final time before committing and pushing
6. After the PR is merged, exit tmux and return to main: `wt switch main` then `git pull`
7. Remove the worktree and branch: `wt remove <branch-name>`

### Starting work from the Developer directory

When given a task from this top-level directory (e.g. "fix xyz in athena-api"), Claude should:

1. Identify the target repo from the task description
2. Look for existing worktree folders adjacent to the repo (e.g. `inst/athena-api.*`) and check whether any of them semantically match the task — if a likely match is found, **stop and confirm with the user before proceeding**
3. If no matching worktree exists, propose a branch name and output the following command for the user to run themselves:

```
cd <repo-path> && wt-claude "<branch-name>" "<prompt>"
```

`wt-claude` is a standalone script at `~/.local/bin/wt-claude`. It creates the worktree (which triggers the Worktrunk hook to create a tmux session), waits for the session to be ready, sends `claude --permission-mode plan '<prompt>'` into it, then attaches. Do not run this command — present it to the user to execute in their terminal.

