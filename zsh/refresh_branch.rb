current_branch = `git rev-parse --abbrev-ref HEAD`.strip
temp_branch = "temp-#{current_branch}"
`git checkout -b #{temp_branch}`
`git br -D #{current_branch}`
`git fetch upstream #{current_branch}:#{current_branch}`
`git checkout #{current_branch}`
`git branch -D #{temp_branch}`
`git push -f origin HEAD`
