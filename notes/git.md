# Git

## Credits

- [Mastering Git - Why Rebase is amazing](https://hackernoon.com/mastering-git-why-rebase-is-amazing-a954485b128a#.fbebliyzj)
- [Oh Shit Git](http://ohshitgit.com/)
- [How to write commit messages](https://chris.beams.io/posts/git-commit/)
- [Git - the simple guide](http://rogerdudler.github.io/git-guide/) -
  _just a simple guide for getting started with git. no deep shit ;)_

## Rebasing

- **Print a clean git history**: `git log --oneline --graph --no-merges master..`

- Count commits since master with `git count $branch`: modify `~/.gitconfig`

```
[alias]
    count = "!f() { compareBranch=${1-master}; echo \"commits since master: $(git rev-list --count HEAD ^$compareBranch)\";   }; f"
```

- `git rebase -i master`

- Be super cautious with you co-workers and `git push origin feature --force-with-lease`


## Useful Tips

```Bash
$ # reset file changes
$ git checkout -- <filename>

$ # built-in gui
$ gitk

$ # interactive add to index
$ git add -i
```

## Logging

```Bash
$ # pretty printing
$ git log --graph --oneline --decorate --all
$ # only show files that changed
$ git log --name-status --oneline
```


## Git commit messages

**Rule of thumb, it should complete**: *When applied, this commit will: {{ YOUR COMMIT MESSAGE }}*

**Guidelines**

```
{{ Type }}({{ target }}): Summarize changes in around 50 characters or less

More detailed explanatory text, if necessary. Wrap it to about 72
characters or so. In some contexts, the first line is treated as the
subject of the commit and the rest of the text as the body. The
blank line separating the summary from the body is critical (unless
you omit the body entirely); various tools like `log`, `shortlog`
and `rebase` can get confused if you run the two together.

Explain the problem that this commit is solving. Focus on why you
are making this change as opposed to how (the code explains that).
Are there side effects or other unintuitive consequences of this
change? Here's the place to explain them.

Further paragraphs come after blank lines.

- Bullet points are okay, too

- Typically a hyphen or asterisk is used for the bullet, preceded
  by a single space, with blank lines in between, but conventions
  vary here

If you use an issue tracker, put references to them at the
bottom,
like this:

Resolves: #123
See also: #456, #789
```

Where `{{ Type }}` is one of:

- `feat`: add new features or work on them
- `chore`: work related to code cleaniness
- `test`
- `doc`
- `fix`

`{{ target }}` is optional but can give a direction on what was working
on in large codebases, especially after rebasing.

## Notes

- `git log -p <[filename>]`, `git log -L 1,4:filename` shows commit logs + file changes
- `git blame <filename>` shows author of each line
- `git show <branch>:<filename>` will print its content without checkout to the branch
- Reset: ```
git reset \
  --hard  # discard commits
  --soft  # put commits to staged
  <some-commit-hash>
- Restore a file in a previous state: `git checkout <branch/commit_hash> <filename>`
- `-w` flag ignores whitespaces with many `git` commands
- Stash some files an re-apply them later: `git stash -p` ( ... ) `git stash pop`
```
