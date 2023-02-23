deps_config := \
	./list/100-minLoadable.Kconfig \
	./list/000-overview.Kconfig \
	./Kconfig

include/config/auto.conf: \
	$(deps_config)


$(deps_config): ;
