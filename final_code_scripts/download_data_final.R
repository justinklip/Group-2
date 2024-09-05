#### Read in the data ####
raw_elections_data <-
  read_csv(
    file = 
      "table_tableau11.csv",
    show_col_types = FALSE,
  )

#Save the data
write_csv(
  x = raw_elections_data,
  file = "canadian_voting.csv"
)
head(raw_elections_data)
tail(raw_elections_data)
