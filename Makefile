# https://makefiletutorial.com/
.PHONY: help \
		terraform-init \
		terraform-workspace terraform-fmt terraform-bootstrap terraform-destroy

.DEFAULT: help



SHELL=/bin/bash

ENV_VARS := ARM_SUBSCRIPTION_ID ARM_TENANT_ID ARM_CLIENT_ID TZ TF_DIR

# Set Subscription ID
ifeq ($(TF_DIR), connectivity)
    ARM_SUBSCRIPTION_ID:=dd97beda-0b33-4b6f-892c-faa0ba1152e3
endif
ifeq ($(TF_DIR), devops) # VHS
	ARM_SUBSCRIPTION_ID:=c50abfab-96bd-4073-99dc-d4c19c34624a
endif
ifeq ($(TF_DIR), staging)
	ARM_SUBSCRIPTION_ID:=ebdbdcdd-e2ba-41be-a34d-096de22c67d4
endif


# default target
#COLORS
GREEN  := $(shell [[ -t 0 ]] && tput -Txterm setaf 2)
WHITE  := $(shell [[ -t 0 ]] && tput -Txterm setaf 7)
YELLOW := $(shell [[ -t 0 ]] && tput -Txterm setaf 3)
RESET  := $(shell [[ -t 0 ]] && tput -Txterm sgr0)

# Add the following 'help' target to your Makefile
# And add help text after each target name starting with '\#\#'
# A category can be added with @category

HELP_FUN = \
    %help; \
    while(<>) { push @{$$help{$$2 // 'main'}}, [$$1, $$3] if /^([a-zA-Z0-9\-\_\%]+)\s*:.*\#\#(?:@([a-zA-Z0-9\-\_\%]+))?\s(.*)$$/ }; \
    print "usage: make [target]\n\n"; \
    for (sort keys %help) { \
    print "${WHITE}$$_:${RESET}\n"; \
    for (@{$$help{$$_}}) { \
    $$sep = " " x (60 - length $$_->[0]); \
    print "  ${YELLOW}$$_->[0]${RESET}$$sep${GREEN}$$_->[1]${RESET}\n"; \
    }; \
    print "\n"; }

help:  ##@other Show this help.
	@perl -e '$(HELP_FUN)' $(MAKEFILE_LIST)


#
## terraform targets
#

terraform-init: check-vars
	@terraform -chdir=${TF_DIR} init
terraform-init-upgrade: check-vars
	@terraform -chdir=${TF_DIR} init -upgrade
terraform-workspace: check-vars
	@echo hello

terraform-plan:  ##@terraform generate terraform plan
	@echo Working on ${TF_DIR} subscription ${ARM_SUBSCRIPTION_ID}
	@terraform -chdir=${TF_DIR} plan -input=false -lock=false --out terraform.tfplan
terraform-apply:  ##@terraform generate terraform plan
	@terraform -chdir=${TF_DIR} apply -auto-approve terraform.tfplan
terraform-state-push:  ##@terraform generate terraform plan
	@terraform -chdir=${TF_DIR} state push errored.tfstate
terraform-fmt:  ##@terraform format terraform configuration
	@terraform state push errored.tfstate

terraform-state-pull:  ##@terraform generate terraform plan
	@echo Working on ${TF_DIR} subscription ${ARM_SUBSCRIPTION_ID}
	@terraform -chdir=${TF_DIR} state pull > ${TF_DIR}/terraform.tfstate

terraform-bootstrap: terraform-init terraform-workspace set-bootstrap-vars  ##@terraform bootstrap terraform backend
	@terraform -chdir=${TF_DIR} apply -input=false -auto-approve 

terraform-destroy: terraform-workspace set-bootstrap-vars  ##@terraform destroy terraform backend
	@terraform -chdir=${TF_DIR} destroy -input=false -auto-approve -lock=false

#
## helpers
#

check-vars:
	@[ "${ARM_SUBSCRIPTION_ID}" ] || ( echo "[ERROR]: ARM_SUBSCRIPTION_ID variable is not set"; exit 1 )
	@[ "${ARM_TENANT_ID}" ] || ( echo "[ERROR]: ARM_TENANT_ID variable is not set"; exit 1 )
	@[ "${ARM_CLIENT_ID}" ] || ( echo "[ERROR]: ARM_CLIENT_ID variable is not set"; exit 1 )
	@[ "${ARM_CLIENT_SECRET}" ] || ( echo "[ERROR]: ARM_CLIENT_SECRET variable is not set"; exit 1 )

set-tf-backend-vars:
	@echo hello

set-bootstrap-vars: set-tf-backend-vars
	@echo hello

print-vars:
	@echo "Environment variables"
	@echo "----------------------------------"
	@IFS=' ' read -r -a env_vars <<< "${ENV_VARS}"; \
	for var in "$${env_vars[@]}"; do \
		echo "$${var}=$${!var}"; \
	done
