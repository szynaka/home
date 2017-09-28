# ~/.bash_profile: executed by bash(1) for login shells.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

umask 002

if [ ! -S /tmp/ssh-agent-$USER-screen ]; then
    pkill ssh-agent
    if [ -x /usr/bin/ssh-agent ]; then
        eval $(/usr/bin/ssh-agent -s)
        ssh-add
        #echo "Enter mineaxe passphrase or enter to skip"
        #ssh-add ~/.ssh/mineaxe_rsa
        #if [ $? -ne 0 ]; then
        #    echo "Not added.  ssh-add ~/.ssh/mineaxe_rsa to retry"
        #fi
            
    fi
    if [ -S $SSH_AUTH_SOCK ]; then
        ln -sf "$SSH_AUTH_SOCK" "/tmp/ssh-agent-$USER-screen"
    fi
fi

echo pass
if [ ! -z $(which screen) -a "$TERM" != "screen" ]; then
    screen -xRR
else
    # include .bashrc if it exists
    if [ -f ~/.bashrc ]; then
        source ~/.bashrc
    fi
    
    # do the same with MANPATH
    #if [ -d ~/man ]; then
    #    MANPATH=~/man:"${MANPATH}"
    #fi
fi
