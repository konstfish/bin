screen -dmS dl$(LC_ALL=C tr -dc 'A-Za-z0-9' </dev/urandom | head -c 13) bash -c "wget '$*' && exit"
