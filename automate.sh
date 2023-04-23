#! /bin/bash
branch=$(git symbolic-ref --short HEAD)
docker_hub_repo=ci-test
docker_name=golang-pipeline
if [ $# -eq 2 ]
then
  echo "You are currently at branch of $branch"
  sed -i '' "s/CURRENT_VERSION: *.*.*/CURRENT_VERSION: $1/g" ./.github/workflows/cicd.yml
  sed -i '' "s/DOCKER_HUB_REPO: DEFAULT/DOCKER_HUB_REPO: $docker_hub_repo/g" ./.github/workflows/cicd.yml
  sed -i '' "s/DOCKER_NAME: DEFAULT/DOCKER_NAME: $docker_name/g" ./.github/workflows/cicd.yml
  git add .
  git commit -m "$2"
  git push -u origin "$branch"
else
  echo "WARNING: 2 arguments for bash is required."
fi
