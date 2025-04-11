APT = dnf #Fedora
#APT = apt-get #Ubuntu

VENV = venv
VENV_ACT = $(VENV)/bin/activate
PYTHON = $(VENV)/bin/python3
PIP = $(VENV)/bin/pip3
PY_REQ = requirements.txt

.PHONY: setup install clean run

setup:
	sudo $(APT) update
	sudo $(APT) install python3

run: $(VENV_ACT)
	@$(PYTHON) main.py

install: $(VENV_ACT)

$(VENV)/bin/activate: $(PY_REQ)
	python3 -m venv $(VENV)
	$(PIP) install --upgrade pip
	. $(VENV_ACT) && $(PIP) install -r $(PY_REQ)

clean:
	rm -rf __pycache__
	rm -rf $(VENV)
