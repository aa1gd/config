# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

unset rc

# Aliases
#alias matlab="/usr/local/MATLAB/R2022b/bin/matlab"
alias cos='cd ~/Documents/Fall\ 2023/COS217/Assignments'
alias armlab='ssh gd9138@armlab.cs.princeton.edu'
alias :q='exit'

# Better version of cat
alias cat='bat'

# fzf settings
export FZF_DEFAULT_COMMAND="fd --type f --strip-cwd-prefix"
source /usr/share/fzf/shell/key-bindings.bash
# To apply the command to CTRL-T as well
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# GCC ARM8 cross compiler
export PATH=$PATH:~/Documents/Fall\ 2023/COS217/gcc-arm-none-eabi-10.3-2021.10/bin

