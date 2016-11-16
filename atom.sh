set -e

if [ -e ~/.atom/config.cson ]; then
  echo "Merging Atom configuration..."
  npm install -g cson lodash.merge
  echo "\
    var fs = require('fs');\
    var cson = require('cson');\
    var merge = require('lodash.merge');\
    var defaultConfig = cson.parse(fs.readFileSync('./.atom/config.cson'));\
    var userConfig = cson.parse(fs.readFileSync('$HOME/.atom/config.cson'));\
    var mergedConfig = merge({}, defaultConfig, userConfig);\
    process.stdout.write(cson.stringify(mergedConfig));\
  " | NODE_PATH=/usr/local/lib/node_modules node > ~/.atom/config.cson
  npm uninstall -g cson lodash.merge
else
  echo "Copying Atom configuration..."
  cp -r ./.atom/* ~/.atom/
fi
