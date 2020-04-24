# Rstudio with api and postgresql
A contanerised Rstudio instance with a linked api and db.

Rstudio and the plumber API use `nginx` reverse proxy which is accessible on port 5500.

Rstudio is hosted at:
http://localhost:5500/

The API can be accessed at:
http://localhost:5500/api/test?x=1&y=2

The environment comes with PostgreSQL preconfigured with postgis with connection details in `test-script.R`. The postgres username and password each default to 'postgres' and can be changed in `docker-compose.yaml`.

## default RStudio login
username: rstudio
password: dev

These can be changed in the `docker-compose.yaml` file: 

```r
app:
...
...
  environment:
    PASSWORD: 'dev'
```


## Running with docker

1. `cd` to our project folder
2. run `docker-compose up`
3. when finished run `docker-compose down`


If you see the error:

>Error in postgresqlNewConnection(drv, ...) : 
>  RS-DBI driver: (could not connect postgres@db:5432 on dbname "dev": could not connect to server: Connection refused
>	Is the server running on host "db" (172.26.0.2) and accepting
>	TCP/IP connections on port 5432?
>)

The database has likely not finished building yet. This can take some time the first time the container is run. The api will also refuse to connect initially for the same reason.
