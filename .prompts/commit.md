---
name: Generate Commit
interaction: chat
description: Generates a commit based on the code diff
opts:
  alias: commit
  modes: 
    - n
---


## user

You are an expert programmer who uses Conventional Commits. Given the following
diff, generate a commit message

```diff
    ${commit.diff}
```
