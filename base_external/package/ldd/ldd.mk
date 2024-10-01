
##############################################################
#
# LDD Kernel Modules
#
##############################################################

#Fill up the contents below in order to reference your assignment 7 git contents
LDD_VERSION = 'f90cbda174f823516869cc4b36f9f16d16f2abf6'
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
LDD_SITE = 'git@github.com:cu-ecen-aeld/assignment-7-abhijithota.git'
LDD_SITE_METHOD = git
LDD_GIT_SUBMODULES = YES

$(eval $(kernel-module))

LDD_MODULE_SUBDIRS = misc-modules scull
LDD_MODULE_MAKE_OPTS = KVERSION=$(LINUX_VERSION_PROBED)

# TODO add misc-modules and scull
define LDD_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/misc-modules/module_load $(TARGET_DIR)/usr/bin/
	$(INSTALL) -m 0755 $(@D)/misc-modules/module_unload $(TARGET_DIR)/usr/bin/
	$(INSTALL) -m 0755 $(@D)/scull/scull_load $(TARGET_DIR)/usr/bin/
	$(INSTALL) -m 0755 $(@D)/scull/scull_unload  $(TARGET_DIR)/usr/bin/
endef

$(eval $(generic-package))
