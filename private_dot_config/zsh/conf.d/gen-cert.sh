# Génération de certificat autosigné
gen-cert() {
    local cn="$1"

    if [[ -z "$cn" ]]; then
        echo "Usage: gen-cert <common_name> [--dns alt1] [--dns alt2] [--ip 1.2.3.4]"
        return 1
    fi

    local san_list=("DNS:$cn")  # SAN par défaut = CN
    local keyfile="${cn}.key"
    local certfile="${cn}.crt"

    shift

    while [[ $# -gt 0 ]]; do
        case "$1" in
            --dns)
                san_list+=("DNS:$2")
                shift 2
                ;;
            --ip)
                san_list+=("IP:$2")
                shift 2
                ;;
            *)
                echo "Unknown option: $1"
                return 1
                ;;
        esac
    done

    local san_string
    san_string=$(IFS=,; echo "${san_list[*]}")

    openssl req -x509 -nodes -newkey rsa:4096 \
        -keyout "$keyfile" \
        -out "$certfile" \
        -days 365 \
        -subj "/CN=$cn" \
        -addext "subjectAltName=$san_string"

    echo "✅ Created cert for CN=$cn with SANs: $san_string"
    echo "🔑 $keyfile"
    echo "📋 $certfile"
}

_gen_cert() {
    _arguments -s \
        '1:common name:' \
        '*: :->args'

    case $state in
        args)
            _values 'options' \
                '--dns[Ajouter un SAN DNS]' \
                '--ip[Ajouter un SAN IP]'
            ;;
    esac
}

compdef _gen_cert gen-cert
