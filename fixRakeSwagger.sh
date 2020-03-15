#!/bin/bash -

set -o nounset                              # Treat unset variables as an error


sed 's/"basePath": "",/"basePath": "\/ipa-swagger",/' public/ipa-swagger/api-docs.json > public/ipa-swagger/api-docs-tmp.json;
mv public/ipa-swagger/api-docs-tmp.json public/ipa-swagger/api-docs.json;

FILES=public/ipa-swagger/api/v2/*/*
for i in $FILES
do
  sed 's/"basePath": "",/"basePath": "\/",/' $i > $i-tmp;
  mv $i-tmp  $i;
done

FILES=public/ipa-swagger/shop360_api/v1/*
for i in $FILES
do
  sed 's/"basePath": "",/"basePath": "\/",/' $i > $i-tmp;
  mv $i-tmp  $i;
done
