#Data Cleaning

# Convert date columns to Date format
superstore <- superstore %>%
  mutate(
    `Order Date` = as.Date(`Order Date`, format = "%Y/%m/%d"),
    `Ship Date` = as.Date(`Ship Date`, format = "%Y/%m/%d")
  )
View(superstore)
# Check for missing values
colSums(is.na(superstore))
