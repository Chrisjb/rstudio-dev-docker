# serve.R
library(plumber)
library(DBI)
library(pool)
library(RPostgreSQL)

# initialise postgres connection for use in our API
   pool <- dbPool(
      drv = PostgreSQL(),
      host = 'db',
      dbname = 'dev',
      user = 'postgres',
      password = 'postgres',
      minSize = 10,
      maxSize = Inf,
      idleTimeout = 600000
   )

# pr <- plumb("plumber.R")
pr <- plumb("/app/plumber-dev.R")

pr$registerHooks(
  list(
    "exit" = function() {
      poolClose(pool)
    }
  )
)

pr$run(port=8000, host="0.0.0.0")
