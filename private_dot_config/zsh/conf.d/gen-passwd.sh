# Génération de mot de passe
gen-passwd() {
    if [[ "$1" =~ ^[0-9]+$ ]] && (( $1 > 0 )); then
        LC_ALL=C tr -dc 'A-Za-z0-9!#$%&-_' < /dev/urandom | head -c "$1"
        echo
    else
        echo "Usage : gen-passwd <LONGUEUR>"
        echo "Example : gen-passwd 8"
    fi
}
