#!/bin/bash

# 本ファイルは Docker 公式ドキュメントからもリンクされている以下のページを参考にしています。
# https://github.com/docker/awesome-compose/tree/18f59bdb09ecf520dd5758fbf90dec314baec545/official-documentation-samples/rails

set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f /myapp/tmp/pids/server.pid

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"
