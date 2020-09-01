UserParameter=gpu.discovery,ZABBIX_CONF_ROOT/discovery_scripts/discover_gpu.sh
UserParameter=gpuinfo[*],nvidia-smi --query-gpu=index,$2 --format=csv | awk 'BEGIN { FS="," } /^'"$1"'/ { print gensub(/^[ \t]*([0-9]+).*$$/,"\\1","g",$$2); }'
UserParameter=gpuusers[*],nvidia-smi --query-gpu=gpu_uuid -i $1 --format=csv | grep -v '^uuid' | nvidia-smi --query-compute-apps=pid --format=csv -i $$(cat -) | grep -v '^pid' | while read line; do ps -ef -q $$line | awk '{ printf("%s (%s)\n",$$1,$$2); }' | grep -v '^UID'; done | tr '\n' ',' | sed 's/,$$//g'
