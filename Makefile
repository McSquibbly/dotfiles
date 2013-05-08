#############################
#
#	Makefile for McSquibbly's dotfiles
#
#############################

BASHRC=bashrc
BASHPROFILE=bash_profile
NEWSHELL='which bash'
GITCONFIG=gitconfig
DOTGITCONFIG=~/.gitconfig
BINFILES := $(shell find bin -type f)
HOMEBINFILES := $(shell find ~/bin -type f)

all: $(DOTGITCONFIG) $(HOMEBINFILES)

shell: $(NEWSHELL)
	chsh -s $(SHELL)

$(DOTGITCONFIG): $(GITCONFIG)
	@echo "Moving gitconfig to ~/.gitconfig"
	@cp gitconfig ~/.gitconfig

bprofile: $(BASHPROFILE)
	@echo "Copying .bash_profile to home directory"
	@cp $(BASHPROFILE) ~/.$(BASHPROFILE)	
	
$(HOMEBINFILES): $(BINFILES)
	@echo "Copying bin to ~/bin..."
	@cp -r bin ~/
	@chmod -R 700 ~/bin
	@chown -R connor ~/bin

