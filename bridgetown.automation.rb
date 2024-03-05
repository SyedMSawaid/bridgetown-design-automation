# frozen_string_literal: true

say_status :design, "Installing Sawaid's Bridgetown Design..."

confirm = ask "This configuration will remove all the unnecessary files. Do you want to continue? [Yn]"
return unless confirm.casecmp?("Y")

# Delete folders
run "rm -rf ./src/_posts"

# Delete files
run "rm ./src/about.md"
run "rm ./src/index.md"
run "rm ./src/posts.md"
run "rm ./src/_layouts/post.liquid"

create_file "./src/index.html", <<~HTML
---
layout: default
---

<h1 class="font-bold text-xl">You are live</h1>
HTML

`bin/bridgetown apply https://github.com/bridgetownrb/tailwindcss-automation`

say_status :design, "Bridgetown has been configured for designing."
