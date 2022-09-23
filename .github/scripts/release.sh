export PATH=$(npm bin):$PATH

VERSION=`yarn auto version`

## Support for label 'skip-release'
if [ ! -z "$VERSION" ]; then

  echo "VERSION: $VERSION"
  ## Update Changelog
  auto changelog

  ## Publish Package
  npm version $VERSION -m "Bump version to: %s [skip ci]"
  # npm publish

  ## Create GitHub Release
  git push --follow-tags --set-upstream origin $branch
  auto release
fi