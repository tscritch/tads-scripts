#!/bin/bash

if [ $# -eq 0 ]
  then
    echo "Please specifiy a script name."
    exit 1
fi

mkdir $1

# Copy template files
cp tsconfig-template.json $1/tsconfig.json
cp template.ts $1/$1.ts
echo "node_modules" | tee $1/.gitignore

pushd $1

# Init
git init
npm init -y
yarn add axios chalk
yarn add -D typescript ts-node @types/node

popd

echo ""
echo "New typescript project initiated in /$1 🎉"
echo ""
echo "add \"$1\": \"ts-node $1.ts\" to your package.json"
echo ""
echo "opening vscode..."

code ./$1
