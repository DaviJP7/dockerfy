#!/bin/bash

# Função para exibir uso
function usage {
    echo "Uso: $0 [on|off] [-c=<valores separados por vírgula>]"
    exit 1
}

# Verifica se pelo menos um argumento foi passado
if [ "$#" -lt 1 ]; then
    usage
fi

# Processa o primeiro argumento (on|off)
case "$1" in
    on)
        # Verifica se a flag -c foi passada
        if [[ "$2" == -c=* ]]; then
            valores="${2#-c=}"
            IFS=',' read -r -a containers <<< "$valores"
        else
            # Se não houver -c, usa valores padrão
            containers=(nginx mysql php-fpm php-worker portainer proxy workspace elasticsearch)
        fi

        # Monta o comando docker-compose
        comando="docker compose up -d"

        # Adiciona cada container ao comando
        for container in "${containers[@]}"; do
            comando+=" $container"
        done

        # Exibe o comando gerado e executa
        echo "Comando gerado:"
        echo "$comando"
        eval "$comando"
        ;;
        
    off)
        docker compose down
        ;;
        
    *)
        usage
        ;;
esac
