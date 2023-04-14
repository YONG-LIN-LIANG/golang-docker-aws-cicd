#! /bin/bash
branch=$(git symbolic-ref --short HEAD)

echo "You are currently at branch of $branch"
sed -i '' "s/CURRENT_VERSION: *.*.*/CURRENT_VERSION: $1/g" ./.github/workflows/cicd.yml
git add .
git commit -m "$2"
git push -u origin "$branch"
