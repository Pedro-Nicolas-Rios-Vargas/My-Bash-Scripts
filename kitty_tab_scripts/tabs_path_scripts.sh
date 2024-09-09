#!/bin/bash

kttyRecoverTabsLastPath() {
    echo "Recovering last saved path for '$KITTY_TAB_TITLE' tab..."
    lastPath=$(psql -qt -d kitty -c "SELECT lastPath FROM tab WHERE name='$KITTY_TAB_TITLE'" | xargs)
    cd $lastPath
    echo "Last path recovered. Actual path: '$lastPath'"
}

kttySavePath() {
    actualPath=$(pwd)
    echo "Saving '$actualPath' for '$KITTY_TAB_TITLE' tab as last path..."
    psql -d kitty -c "UPDATE tab SET lastPath='$actualPath' WHERE name='$KITTY_TAB_TITLE'"
    # Or...
    # psql -d kitty -c "UPDATE tab SET lastpath='$(pwd)' WHERE name='$KITTY_TAB_TITLE'"
    echo "Path Saved."
}

alias rcvr-lp=kttyRecoverTabsLastPath
alias spath=kttySavePath
