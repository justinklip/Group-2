raw_elections_data
read_csv(
  file = "canadian_voting.csv",
  show_col_types = FALSE
  )

# Make the names easier to type
cleaned_elections_data <-
  clean_names(raw_elections_data)

# Have a look at the first six rows
head(cleaned_elections_data)
#Make the names easier type

cleaned_elections_data <-
  cleaned_elections_data |>
  select(
    electoral_district_name_nom_de_circonscription,
    elected_candidate_candidat_elu,
  )
head(cleaned_elections_data)

cleaned_elections_data <-
  cleaned_elections_data |>
  rename(
    division = electoral_district_name_nom_de_circonscription,
    elected_party = elected_candidate_candidat_elu
  )
#Two-Column Version
head(cleaned_elections_data)

cleaned_elections_data$elected_party|>
  unique()

cleaned_elections_data <-
  cleaned_elections_data |>
  separate(
    col = elected_party,
    into = c("Other", "party"),
    sep = "/"
  ) |>
  select(-Other)


head(cleaned_elections_data)

cleaned_elections_data <-
  cleaned_elections_data |>
  mutate(
    party =
      case_match(
         party,
        "Conservateur" ~ "Conservative",
        "Libéral" ~ "Liberal",
        "NPD-Nouveau Parti démocratique" ~ "NDP",
        "Parti Vert" ~ "Green",
        "Bloc Québécois" ~ "Bloc Quebecois",
      )
  )

head(cleaned_elections_data)

write_csv(
  x = cleaned_elections_data,
  file = "cleaned_elections_data.csv"
)

