# Ansible Playbook for Ubuntu 18.04 on a server

> Disclaimer: This may have no use to you.

## To deploy

1. Install requirements

    ```bash
    ansible-galaxy install -r requirements.yml
    ```
    
1. Install python dependencies
    ```bash
    pipenv install
    ```

1. You may need to change the domain in the hosts file

    ```yaml
    web:
      vars:
        ansible_connection: ssh
        ansible_ssh_user: root
      hosts:
        something.example.com: # your domain here instead
    ```
    
1. Put the vault pass in the project root as vault_pass.txt

    ```bash
    export VAULT_PASS=grgrjuiog4t994h3ngr # your password here
    echo "${VAULT_PASS}" > vault_pass.txt
    ```

1. Deploy your server
    ```bash
    pipenv run deploy
    ```
