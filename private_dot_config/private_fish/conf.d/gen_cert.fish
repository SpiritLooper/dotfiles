# Generate self-signed certificate
function gen-cert --description "Generate self-signed certificate"
    set -l cn $argv[1]
    if test -z "$cn"
        echo "Usage: gen-cert <common_name> [--dns alt1] [--dns alt2] [--ip 1.2.3.4]"
        return 1
    end

    set -l san_list "DNS:$cn"  # default SAN = CN
    set -l keyfile "$cn.key"
    set -l certfile "$cn.crt"

    set -l i 2
    while test $i -le (count $argv)
        switch $argv[$i]
            case --dns
                set i (math $i + 1)
                set san_list $san_list "DNS:$argv[$i]"
            case --ip
                set i (math $i + 1)
                set san_list $san_list "IP:$argv[$i]"
        end
        set i (math $i + 1)
    end

    set -l san_string (string join "," $san_list)

    openssl req -x509 -nodes -newkey rsa:4096 \
        -keyout $keyfile \
        -out $certfile \
        -days 365 \
        -subj "/CN=$cn" \
        -addext "subjectAltName=$san_string"

    echo "✅ Created cert for CN=$cn with SANs: $san_string"
    echo "🔑 $keyfile"
    echo "📋 $certfile"
end

complete -c gen-cert -l dns -d 'Add additional DNS SAN'
complete -c gen-cert -l ip -d 'Add additional IP SAN'