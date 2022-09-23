export PATH=$(npm bin):$PATH

if [ -z "$GH_TOKEN" ]; then
export GH_TOKEN="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"
fi
if [ -z "$branch" ]; then 
export branch="dev/v3"
fi
VERSION='minor'
# auto release

# VERSION=`auto version`
## Support for label 'skip-release'
if [ ! -z "$VERSION" ]; then

  echo "VERSION: $VERSION \n"
  
  ## Update Changelog
  echo "AUTO CHANGELOG"
  auto changelog

  ## Publish Package
  echo "npm version $VERSION -m 'Bump version to: %s [skip ci]'"
  npm version $VERSION -m "Bump version to: %s [skip ci]"
  # npm publish

  ## Create GitHub Release
  echo "git push --follow-tags --set-upstream origin $branch"
  git push --follow-tags --set-upstream origin $branch
  echo "auto release"
  auto release
else
  echo "Empty Version"
fi