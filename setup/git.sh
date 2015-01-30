function git_commit_with_message {
    git commit --message="$@"
}
alias g.commit="git_commit_with_message"

function git_find {
    git commit --message="$@"
}
alias g.find="clear;find . $@ | grep -v '.git' | grep -v '.pyc$' | grep -v '__pycache__' | grep -v '~$' | grep -v '/#' | grep -v '/.#' | less"

alias g.add="git add"
alias g.CherrPick="git cherry-pick"
alias g.reset_hard='git reset --hard'

alias g.diff_='git diff'
alias g.diff_cached='git diff --cached'
alias g.diff_recent='git diff HEAD~1 HEAD'

alias g.status='git status'
alias g.branch='git branch'

alias g.Push='git push'
alias g.fetch='git pull'
alias g.pull='git pull'
alias g.merge='git merge'
alias g.Prune='git remote prune origin'
alias g.bisect='git bisect'

alias pf="clear;find . | grep -v '.git' | grep -v '.pyc$' | grep -v '__pycache__' | grep -v '~$' | grep -v '/#' | grep -v '/.#' | less"
alias ddiff='clear;diff -C3 -rNX .gitignore'
alias log="clear; git log --graph --all --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(bold white)— %an%C(reset)%C(bold yellow)%d%C(reset)' --abbrev-commit --date=relative"

# Files with pending changes, diffed against remote master
#alias pnm='git diff --name-only origin/master HEAD'

# Diff of pending changes against remote master
#alias pndm='git diff origin/master HEAD'

# Files with pending changes, diffed against remote develop
#alias pnd='git diff --name-only origin/develop HEAD'

# Diff of pending changes against remote master
#alias pndd='git diff origin/develop HEAD'
