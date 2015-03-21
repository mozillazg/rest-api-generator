help:
	@echo "server           run dev server"
	@echo "shell            open a python shell"
	@echo "clean            clean"
	@echo "test             run test"
	@echo "lint             run flake8 check"
	@echo "db_migrate       "
	@echo "db_upgrade       "

server:
	@python manager.py runserver -h 0.0.0.0 -r

shell:
	@python manager.py shell

clean: clean-build clean-pyc
	@rm -fr cover/

clean-build:
	@rm -fr build/
	@rm -fr dist/
	@rm -fr *.egg-info

clean-pyc:
	@find . -type f -name '*.pyc' -delete
	@find . -type f -name '*.pyo' -delete
	@find . -type f -name '*~' -delete

lint:
	@flake8 restapi
	@flake8 tests

tests:
	@py.test

db_migrate:
	@python manager.py db migrate --message "${MSG}"

db_upgrade:
	@python manager.py db upgrade

.PHONY: server shell clean clean-build clean-pyc lint tests db_migrate db_upgrade
