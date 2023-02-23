
menuconfig:
	@kconfig-mconf ./Kconfig

edit:
	@vi ./Kconfig

see:
	@less ./.config

save-to-git:
	@git add .
	@git commit -m 'save all'
	@git push
