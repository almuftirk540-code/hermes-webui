#!/bin/bash
# Hermes WebUI 启动脚本
# 用法: ./start-webui.sh
# 访问: 在浏览器打开 http://127.0.0.1:8787

export HERMES_WEBUI_AGENT_DIR="$HOME/hermes-agent"
export HERMES_WEBUI_PYTHON="$HOME/hermes-agent/venv/bin/python"
export GLM_API_KEY="$(grep GLM_API_KEY ~/.hermes/.env | cut -d= -f2)"

# 关键：不走代理，直连 GLM API 和本地服务
export no_proxy="127.0.0.1,localhost,api.z.ai,open.bigmodel.cn,cdn.jsdelivr.net"
export NO_PROXY="$no_proxy"
unset http_proxy
unset https_proxy
unset HTTP_PROXY
unset HTTPS_PROXY

echo "Starting Hermes WebUI..."
echo "访问地址: http://127.0.0.1:8787"
echo "按 Ctrl+C 停止"
echo ""

exec "$HOME/hermes-agent/venv/bin/python" "$HOME/hermes-webui/server.py" --no-browser
