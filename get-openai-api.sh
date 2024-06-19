#!/usr/bin/env bash

TEMP_PATH=/tmp/openai-nvim
KEY_PATH="personal/code/nvim-openai-key"

if [ ! -e "$TEMP_PATH" ]; then
  # Get from pass and save to a temp file
  pass "$KEY_PATH" > "$TEMP_PATH" 2> /dev/null
  chmod go-rwx $TEMP_PATH
fi

# echo out the key
cat $TEMP_PATH
