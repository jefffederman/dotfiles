current_branch = `git rev-parse --abbrev-ref HEAD`.strip
other_branches = `git branch`.gsub("* #{current_branch}\n", '')
                             .split("\n").map(&:strip)
random_branch = other_branches.sample
`git checkout #{random_branch}`
`git br -D #{current_branch}`
`git fetch upstream #{current_branch}:#{current_branch}`
`git checkout #{current_branch}`
`git push -f origin HEAD`
