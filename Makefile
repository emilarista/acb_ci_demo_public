.DEFAULT_GOAL := local-build

local-build: ## Do a local AVD-build to upload to the git repository
	ansible-playbook playbooks/PLAY_local_build.yml --skip-tags documentation -i inventory-development.yml

dev-build:
	ansible-playbook playbooks/PLAY_dc_deploy.yml --skip-tags documentation -i inventory-development.yml
	ansible-playbook playbooks/PLAY_wan_deploy.yml --skip-tags documentation -i inventory-development.yml

dev-dc:
	ansible-playbook playbooks/PLAY_dc_deploy.yml --skip-tags documentation -i inventory-development.yml

dev-wan:
	ansible-playbook playbooks/PLAY_wan_deploy.yml --skip-tags documentation -i inventory-development.yml

dev-checkwan:
	ansible-playbook playbooks/PLAY_wan_deploy_eapi.yml --tags deploy --check --diff -i inventory-development.yml

prod-dc:
	ansible-playbook playbooks/PLAY_dc_deploy.yml --skip-tags documentation -i inventory-production.yml

prod-dc-fast:
	ansible-playbook playbooks/PLAY_dc_deploy_fast.yml --skip-tags documentation -i inventory-production.yml

prod-wan:
	ansible-playbook playbooks/PLAY_wan_deploy.yml --skip-tags documentation -i inventory-production.yml

actgen:
	ansible-playbook playbooks/PLAY_act_topology_generator.yml -i inventory-development.yml

dev-apipush:
	ansible-playbook playbooks/PLAY_eapi_deploy.yml --tags deploy -i inventory-development.yml

prod-apipush:
	ansible-playbook playbooks/PLAY_eapi_deploy.yml --tags deploy -i inventory-production.yml

prod-validate:
	ansible-playbook playbooks/PLAY_dc_validate_state.yml -i inventory-production.yml
	ansible-playbook playbooks/PLAY_wan_validate_state.yml -i inventory-production.yml

arfa:
	ansible-playbook playbooks/PLAY_enable_arfa.yml -i inventory-development.yml
	ansible-playbook playbooks/PLAY_enable_arfa.yml -i inventory-production.yml