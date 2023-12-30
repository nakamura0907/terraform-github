CD = [[ -d environments/$(ENV) ]] && cd environments/$(ENV)
ENV = $1
ARGS = $2

terraform:
	@$(CD) && \
	terraform $(ARGS)