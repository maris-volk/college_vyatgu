#!/bin/bash

current_branch=$(git branch --show-current)

git fetch --all

for branch in $(git branch -r | grep -v '\->'); do
    branch_name=$(echo $branch | sed 's/origin\///')

    mkdir -p "../$branch_name"

    git checkout $branch_name

    rm -rf "../$branch_name/*"

    find . -type d -name ".git" -prune -o -type f ! -name "clone_branches.sh" -exec cp --parents {} "../$branch_name/" \;
done

git checkout "$current_branch"
