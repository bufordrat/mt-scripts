INSTALLDIR = /home/teichman/bin

SCRIPTS = figure_out_editor_variable

all: $(SCRIPTS)

install: all
	install -m 555 $(SCRIPTS) $(INSTALLDIR)
