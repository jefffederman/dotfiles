current_branch = `git rev-parse --abbrev-ref HEAD`.strip
temp_branch = "temp-#{current_branch}"
`git checkout -b #{temp_branch}`
`git br -D #{current_branch}`
remote = if !`git ls-remote upstream | ag #{current_branch}`.empty?
           "upstream"
         else
           "origin"
         end
`git fetch #{remote} #{current_branch}:#{current_branch}`
`git checkout #{current_branch}`
`git branch -D #{temp_branch}`
`git push -f origin HEAD` if remote == "upstream"
