include .env
CONFIG_LOCATION ?= target

help:
	@cat Makefile

dev:
	@nvim Kconfig
edit:
	@nvim list/Kconfig.500-VGUEST

configure: menu apply-to-tiny

menu:
	@mkdir -p $(CONFIG_LOCATION)
	@echo [ CONFIG LOCATION: $(CONFIG_LOCATION) ]
	@KCONFIG_CONFIG="$(CONFIG_LOCATION)/source.config" kconfig-mconf Kconfig


apply-to-tiny: correct
	@KCONFIG_CONFIG="$(CONFIG_LOCATION)/result.config" \
		kconfig-merge -m assets/tinykernel.config "$(CONFIG_LOCATION)/intermediate.config"

correct:
	@cat "$(CONFIG_LOCATION)/source.config" \
		| scripts/unsetToSetNO.sh > "$(CONFIG_LOCATION)/intermediate.config"


clean:
	@rm -vfR include/
	@rm -vfR target/


savetogit:
	@git add .
	@git commit -m 'save all'
	@git push
