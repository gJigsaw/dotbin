# Doug Hellmann's VirtualEnvWrapperenv
# http://www.doughellmann.com/projects/virtualenvwrapper/
# http://pypi.python.org/pypi/virtualenvwrapper
# https://bitbucket.org/dhellmann/virtualenvwrapper/

export WORKON_HOME=$HOME/Coding/VirtualEnvironments
VENV_SCRIPT="$WORKON_HOME/virtualenvwrapper.sh"

if [ -e "$VENV_SCRIPT" ] && [ -e $WORKON_HOME ]
then
  export PIP_REQUIRE_VIRTUALENV=true
  export PIP_RESPECT_VIRTUALENV=true
  export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache
  source $VENV_SCRIPT
  syspip(){
    PIP_REQUIRE_VIRTUALENV="" pip "$@"
  }
  alias v='workon'
  alias v.deactivate='deactivate'
  alias v.mk='mkvirtualenv'
  alias v.mk_withsitepackages='mkvirtualenv'
  alias v.rm='rmvirtualenv'
  alias v.switch='workon'
  alias v.add2virtualenv='add2virtualenv'
  alias v.cdsitepackages='cdsitepackages'
  alias v.cd='cdvirtualenv'
  alias v.lssitepackages='lssitepackages'
  alias v.ls='virtualenvwrapper_show_workon_options'
else
  echo "VirtualEnv commands unavailable."
fi
