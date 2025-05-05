help:
	@echo 'OPTIONS: menuconfig edit see save-to-git correct clean'

menuconfig:
	@kconfig-mconf ./Kconfig

dev:
	@nvim ./Kconfig

edit:
	@nvim list/Kconfig.250-StdRec

see:
	@cat .config


apply: correct
	@cp -v .config.clean ../linux-6.14.2/.config

correct:
	@cat .config | ./scripts/unsetToSetNO.sh > .config.clean


clean:
	@rm -vfR .config .config.old include/


savetogit:
	@git add .
	@git commit -m 'save all'
	@git push
