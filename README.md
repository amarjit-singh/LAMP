# LAMP

## Usage

1. Clone the repo and cd into the repo directory
2. Create .env file from .env.example
    `cp .env.example .env`
3. Edit .env file according to your requirements.
    APACHE_PORT: The port that is free on your machine which you want to bind Apache's listening Port.
    This Port will determine how you will access your localhost from the browser.

    SSH_PORT:    The port that is free on your machine which you want bind the ssh service of apache container.
    This Port will determine how you will access ssh into apache container. eg: if SSH_PORT var is 2226 then to ssh into
    apache container type `ssh root@127.0.0.1 -p 2226`

    VHOSTS_DIR: Path for the directory where you have your apache's virtual hosts conf files.

    PROJECTS_PATH: Path for the root directory of your all projects.

    MYSQL_DATA_DIR: Path where you want the mysql data to be stored or taken from.
4. Execute command `docker-compose up` to start the docker LAMP stack. To recreate the docker LAMP stack execute command `docker-compose up -d --build --force-recreate`.