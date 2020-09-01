INSTALLPATH="INPATH"

all: tmp/gpu.conf

tmp/gpu.conf: tmp
	m4 -DZABBIX_CONF_ROOT=$(INSTALLPATH) gpu.conf.m4 > tmp/gpu.conf

tmp:
	mkdir tmp
clean:
	rm -rf tmp

install:
	mkdir $(INSTALLPATH)/discovery_scripts
	cp discover_gpu.sh $(INSTALLPATH)/discovery_scripts
	cp gpu.conf $(INSTALLPATH)/zabbix_agentd.conf.d
	@echo "***********************************"
	@echo "* Install template via web UI     *"
	@echo "*    - zbx_export_templates.xml   *"
	@echo "***********************************"
