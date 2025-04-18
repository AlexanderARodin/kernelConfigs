# kernelConfigs
meta-configuration for linux-kernel configuration 

# kernel source
it is tested over linux-5.15.85

# remarks 
for full functionality I replace two utils from 'kconfig-frontends' with analogs from kernel-source:
1. `apt install kconfig-frontends`
2. `cd <linux-sources-root>`
3. `cp -v ./scripts/kconfig/mconf /bin/kconfig-mconf`
4. optional: `cp -v ./scripts/kconfig/conf /bin/kconfig-conf`
