#!/bin/bash

if [ $# -eq 0 ]
  then
    echo "Please specifiy a script name."
    exit 1
fi

DIR=collections/$1
mkdir $DIR

# Copy template files
cp templates/tsconfig.json $DIR/tsconfig.json
cp templates/utils.ts $DIR/_utils.ts
cp templates/index.ts $DIR/$1.ts
cp templates/config.ts $DIR/.config.ts
cp templates/secrets.ts $DIR/.secrets.ts
echo $'node_modules\n.secrets.ts' | tee $DIR/.gitignore

pushd $DIR

# Init
git init
npm init -y
yarn add axios chalk
yarn add -D typescript ts-node @types/node

popd

echo ""
echo "New typescript project initiated in /$DIR 🎉"
echo ""
echo "add \"$1\": \"ts-node $1.ts\" to your package.json"
echo ""
echo "opening vscode..."

code ./$DIR
