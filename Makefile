
menuconfig:
	@kconfig-mconf ./Kconfig

edit:
	@vi ./Kconfig

see:
	@vi -R ./.config

save-to-git:
	@git add .
	@git commit -m 'save all'
	@git push
