# ==================================================
# shell functions

function exists {
    which $1 &> /dev/null
}

function mkcd {
    mkdir -p "$1"; cd "$1";
}

function cdls {
    cd "$1"; ll;
}

function cheat {
    curl cheat.sh/"$1"
}
