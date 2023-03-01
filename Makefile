
menuconfig:
	@kconfig-mconf ./Kconfig

edit:
	@vi ./Kconfig

edit-current:
	@vi ./list/100-minLoadable.Kconfig

see:
	@cat ./.config

save-to-git:
	@git add .
	@git commit -m 'save all'
	@git push


correct:
	@cat ./.config | ./scripts/unsetToSetNO.sh > .config.clean


clean:
	@rm -vf ./.config ./.config.old


