#!/usr/bin/env bash

powerline --help > /dev/null

if test $? -eq 0 ; then
  # Setup Powerline Prompt
  powerline-daemon -q
  POWERLINE_BASH_CONTINUATION=1
  POWERLINE_BASH_SELECT=1
  . /usr/local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh
fi
