#!/usr/bin/env zsh

if [[ $AUTO_TERMCOLOR_ACTIVE == 1 ]]; then
    LBCS_PATH=$HOME/dev/python/avg_camera_lumen

    source $LBCS_PATH/EnvPython/bin/activate && python3 $LBCS_PATH/LBCS.py && deactivate
else
    echo "Terco is deactivated. Use \"shfterco\" for activation."
fi
