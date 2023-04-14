#! /bin/bash
branch=$(git symbolic-ref --short HEAD)
docker_hub_repo=myreponame
docker_name=mydockername

echo "You are currently at branch of $branch"
sed -i '' "s/CURRENT_VERSION: *.*.*/CURRENT_VERSION: $1/g" ./.github/workflows/cicd.yml
sed -i '' "s/DOCKER_HUB_REPO: DEFAULT/DOCKER_HUB_REPO: $docker_hub_repo/g" ./.github/workflows/cicd.yml
sed -i '' "s/DOCKER_NAME: DEFAULT/DOCKER_NAME: $docker_name/g" ./.github/workflows/cicd.yml


git add .
git commit -m "$2"
git push -u origin "$branch"
