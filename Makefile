help:
	@echo 'OPTIONS: menuconfig edit see save-to-git correct clean'

menu:
	@[ -d target ] || mkdir target
	@cd target && kconfig-mconf ../Kconfig

dev:
	@nvim ./Kconfig

edit:
	@nvim list/Kconfig.400-BlockAndFS

apply.to-tiny: tinyconfig.before.apply apply

apply: correct
	@cp -v target/linux-kernel/.config target/prev.config
	@kconfig-merge -m target/prev.config target/.config.cor && mv -v .config target/new.config
	@cp -v target/new.config target/linux-kernel/.config

tinyconfig.before.apply:
	@cd target/linux-kernel && make tinyconfig

correct:
	@cat target/.config | scripts/unsetToSetNO.sh > target/.config.cor


clean:
	@rm -vfR include/
	@cd target && rm -vfR .config .config.cor new.config prev.config


savetogit:
	@git add .
	@git commit -m 'save all'
	@git push
