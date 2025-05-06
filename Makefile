help:
	@echo 'OPTIONS: menuconfig edit see save-to-git correct clean'

menuconfig:
	@[ -d target ] || mkdir target
	@cd target && kconfig-mconf ../Kconfig

dev:
	@nvim ./Kconfig

edit:
	@nvim scripts/unsetToSetNO.sh

see:
	@cat .config


apply: correct
	@cp -v target/linux-kernel/.config target/prev.config
	@kconfig-merge -m target/prev.config target/.config.cor && mv -v .config target/new.config
	@cp -v target/new.config target/linux-kernel/.config

correct:
	@cat target/.config | ./scripts/unsetToSetNO.sh > target/.config.cor


clean:
	@rm -vfR .config .config.old include/


savetogit:
	@git add .
	@git commit -m 'save all'
	@git push
