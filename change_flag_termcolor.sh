#!/usr/bin/env zsh

var_name="AUTO_TERMCOLOR_ACTIVE"
# Se invierte el valor dentro de la variable
AUTO_TERMCOLOR_ACTIVE=$[! $AUTO_TERMCOLOR_ACTIVE]

# As we want to activate the flag that executes the terco command in LBCS
# also execute it in here, so if the flag is turn off the terco did not execute
if [[ $AUTO_TERMCOLOR_ACTIVE == 1 ]]; then
    terco
fi
# Pruebas para evaluar la asignación en bloque if
# if [ ${!var_name} == 1 ]; then
#     echo "Hoal"
#    variable=$[! $variable];
#    echo "Variable:$variable"
# else
#     echo "No existe \$${var_name}"
# fi
# if ["$variable" -eq 0]; then
#     variable=$[! $variable]
#     echo "Variable: $variable"
# fi
