#!/bin/bash
set -e

cd "$(dirname "$(readlink -f "$BASH_SOURCE")")"

versions=( "$@" )
if [ ${#versions[@]} -eq 0 ]; then
	versions=( */ )
fi
versions=( "${versions[@]%/}" )


for version in "${versions[@]}"; do	
  if [ $version == "4" ]; then
  	fullPackage="nodejs"
    fullVersion="$(curl -fsSL "https://deb.nodesource.com/node_4.x/dists/trusty/main/binary-amd64/Packages.gz" | gunzip | awk -F ': ' '$1 == "Package" { pkg = $2 } pkg ~ /^nodejs$/ && $1 == "Version" { print $2 }' | sort -rV | head -n1 )"
  else
  	fullPackage="nodejs"
    fullVersion="$(curl -fsSL "https://deb.nodesource.com/node_5.x/dists/trusty/main/binary-amd64/Packages.gz" | gunzip | awk -F ': ' '$1 == "Package" { pkg = $2 } pkg ~ /^nodejs$/ && $1 == "Version" { print $2 }' | sort -rV | head -n1 )"
	fi
	(
		set -x
		sed '
			s/%%NODEJS_MAJOR%%/'"$version"'/g;
			s/%%NODEJS_VERSION%%/'"$fullVersion"'/g;
		' Dockerfile.template > "$version/Dockerfile"
	)
done

