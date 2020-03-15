#!/bin/bash
set -e

[[ $DEBUG == true ]] && set -x

RAILS_APP_PATH="$( cd "$(dirname "$0")" ; cd .. ; pwd -P )"
cd $RAILS_APP_PATH

#-- Docker Secrets ------------------------------------------------------------

: ${ENV_SECRETS_DIR:=/run/secrets}

env_secret_debug()
{
    if [ ! -z "$ENV_SECRETS_DEBUG" ]; then
        echo -e "\033[1m$@\033[0m"
    fi
}

set_env_secrets() {
    secret_name=$SECRET_NAME
    secret_file_path="${ENV_SECRETS_DIR}/${secret_name}"
    env_secret_debug "Secret file: $secret_name"
    if [ -f "$secret_file_path" ]; then
        while IFS='' read -r line || [[ -n "$line" ]]; do
            export $line
        done < "$secret_file_path"
    else
        env_secret_debug "Secret file does not exist! $secret"
    fi

    if [ ! -z "$ENV_SECRETS_DEBUG" ]; then
        echo -e "\n\033[1mExpanded environment variables\033[0m"
        printenv
    fi
}

set_env_secrets

#-- Dependencies -----------------------------------------------------

#-- Requirements ----------------------------------------------------------

#-- Tasks -----------------------------------------------------------------

echo "Running > ${1}..."

case ${1} in
  app:server|app:migrate|app:worker|app:assets)
    case ${1} in
      app:server)
        bundle exec puma -C config/puma.rb
        ;;
      app:migrate)
        bundle exec rake db:migrate
        ;;
      app:seed)
        bundle exec rake db:seed
        ;;
      app:worker)
        mkdir -p tmp/pids
        bundle exec sidekiq -C config/sidekiq.yml
        ;;
      app:assets)
        bundle exec rake RAILS_ENV=production assets:precompile:primary
        ;;
    esac
    ;;
  app:help)
    echo "Available options:"
    echo " app:server       - Starts the server (default)"
    echo " app:migrate      - Migrate DB if needed"
    echo " app:worker       - Run background worker"
    echo " app:assets       - Pre-compile assets"
    echo " [command]        - Execute the specified command, eg. bash."
    ;;
  *)
    exec "$@"
    ;;
esac
