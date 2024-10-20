#!/bin/bash

# SUBCOMMANDが設定されているかチェックし、実行コマンドを構築
if [ -n "$SUBCOMMAND" ]; then
    echo "Running: embulk run $SUBCOMMAND $CONFIG_PATH"
    exec java -jar /usr/local/bin/embulk "$SUBCOMMAND" "$CONFIG_PATH"
else
    if [ -n "$CONFIG_PAT" ]; then
      echo "Running: embulk run $CONFIG_PATH"
      exec java -jar /usr/local/bin/embulk "$CONFIG_PATH"
    else
      echo "Error: CONFIG_PAT is not set." >&2
      exec java -jar /usr/local/bin/embulk --help
      exit 1
    fi
fi
