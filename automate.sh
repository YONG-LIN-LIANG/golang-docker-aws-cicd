#! /bin/bash
branch=$(git symbolic-ref --short HEAD)
docker_hub_repo=ci-test
docker_name=golang-pipeline
if [ $# -eq 2 ]
then
  echo "You are currently at branch of $branch"
  sed -i '' "10s/: *.*.*/: $1/" ./.github/workflows/cicd.yml
  sed -i '' "11s/DEFAULT/$docker_hub_repo/g" ./.github/workflows/cicd.yml
  sed -i '' "12s/DEFAULT/$docker_name/g" ./.github/workflows/cicd.yml
  git add .
  git commit -m "$2"
  git push -u origin "$branch"
else
  echo "WARNING: 2 arguments for bash is required."
fi
