source version
git add --all
git commit -m "Building a new version for Kong Loadbalancer Gateway ${VERSION}"
git tag -a gateway_${VERSION} -m "Building a new version for Kong Loadbalancer Gateway ${VERSION}"
git push
git push origin gateway_${VERSION}

docker push andrebaceti/boostrap-kong:${VERSION}
