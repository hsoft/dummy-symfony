SYM_CLI = ./symfony
SYM_CLI_VERSION = 4.27.5
SYM_CLI_ARCH = amd64
SYM_CLI_URL = https://github.com/symfony/cli/releases/download/v$(SYM_CLI_VERSION)/symfony_linux_$(SYM_CLI_ARCH).gz

.PHONY: all
all: vendor

$(SYM_CLI):
	curl -L $(SYM_CLI_URL) | gzip -d > $@
	chmod +x $@

vendor: composer.lock
	composer install
	touch $@

.PHONY: run
run: $(SYM_CLI)
	$(SYM_CLI) server:start
