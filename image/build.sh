# Update version path
VERSION_FILE="version"
current_version=$(grep -E "^VERSION=" "$VERSION_FILE" | cut -d'=' -f2)
IFS='.' read -r major minor patch <<< "$current_version"
patch=$((patch + 1))
new_version="$major.$minor.$patch"
sed -i "s/^VERSION=.*/VERSION=$new_version/" "$VERSION_FILE"
echo "Updated version to $new_version"

source version
docker build -t andrebaceti/autoboostrap-kong:${VERSION} .

git add --all
git commit -m "Building a new version for Kong Loadbalancer Gateway ${VERSION}"
git tag -a gateway_${VERSION} -m "Building a new version for Kong Loadbalancer Gateway ${VERSION}"
git push
git push origin gateway_${VERSION}
docker push andrebaceti/autoboostrap-kong:${VERSION}
