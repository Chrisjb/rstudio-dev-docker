#-----------------------------------
## script to test our API and db
#-----------------------------------

# test DB
library(RPostgreSQL)
library(DBI)
library(dplyr)
con <- dbConnect(
  drv = PostgreSQL(),
  host = 'db',
  dbname = 'dev',
  user = 'postgres',
  password = 'postgres'
)

dbWriteTable(con, "iris", iris)
tbl(con, 'iris')

# test API
library(httr)
req <- GET('http://host.docker.internal:5500/api/test?x=1&y=1')
res <- content(req, simplifyVector = TRUE)

res
