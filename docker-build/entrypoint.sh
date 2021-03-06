#!/bin/bash
set -e
source ${GRLC_RUNTIME_DIR}/functions

[[ $DEBUG == true ]] && set -x

case ${1} in
  app:start)
    setup_nginx
    # initialize_system
    # configure_gitlab
    # configure_gitlab_shell
    # configure_nginx

    case ${1} in
      app:start)
        cd ${GRLC_INSTALL_DIR}
        python grlc.py
        # migrate_database
        # rm -rf /var/run/supervisor.sock
        # exec /usr/bin/supervisord -nc /etc/supervisor/supervisord.conf
        ;;
      # app:init)
      #   migrate_database
      #   ;;
      # app:sanitize)
      #   sanitize_datadir
      #   ;;
      # app:rake)
      #   shift 1
      #   execute_raketask $@
      #   ;;
    esac
    ;;
  app:help)
    echo "Available options:"
    echo " app:start        - Starts the grlc server (default)"
    # echo " app:init         - Initialize the gitlab server (e.g. create databases, compile assets), but don't start it."
    # echo " app:sanitize     - Fix repository/builds directory permissions."
    # echo " app:rake <task>  - Execute a rake task."
    echo " app:help         - Displays the help"
    echo " [command]        - Execute the specified command, eg. bash."
    ;;
  *)
    exec "$@"
    ;;
esac
