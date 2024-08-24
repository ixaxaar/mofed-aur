#!/usr/bin/env bash

echo "**************************************"
echo "Fetching source archives"

if [ ! -e sources ]; then

    # Create the sources directory if it doesn't exist
    mkdir -p sources

    # Get the latest package archive names
    curl -s https://linux.mellanox.com/public/repo/mlnx_ofed/latest/SRPMS/ |
    grep -oP 'href="\K[^"]+(?=")' |
    grep -E '\.tar\.gz$|\.tgz$|\.tar\.bz2$' > package_list.txt

    # Read the package list and download each package
    while read package; do
    echo "Downloading $package..."
    curl -s "https://linux.mellanox.com/public/repo/mlnx_ofed/latest/SRPMS/$package" -o "sources/$package"
    done < package_list.txt

    # Clean up the temporary file
    rm package_list.txt

    echo "Sources fetched."
    echo "**************************************"
else
    echo "Sources found, not fetching again"
fi

echo "**************************************"
echo "Extracting source archives"

if [ ! -e src ]; then
    # Create an extraction directory
    mkdir -p src

    # Extract each archive
    for archive in sources/*; do
    echo "Extracting $archive..."
    case "$archive" in
        *.tar.gz|*.tgz)
        tar -xzf "$archive" -C src
        ;;
        *.tar.bz2)
        tar -xjf "$archive" -C src
        ;;
        *)
        echo "Unknown archive type: $archive"
        ;;
    esac
    done

    echo "**************************************"
    echo "Sources extracted"
fi
