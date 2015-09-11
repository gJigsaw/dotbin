dotbin
======

My Dot Files

Install instructions
--------------------

Acquire latest version::

 git clone

Add the following line to ~/.bash_profile or ~/.bashrc::

 source ~/.bin/profile.sh

Setup symbolic links::

 for LINK in $(ls -a ~/.bin/symlinks | awk 'NR > 2'); do ln -s ~/.bin/symlinks/$LINK ~/$LINK ; done
