#Data Transformation

# Add a new column for Order Processing Time (days between Order and Ship Date)
superstore <- superstore %>%
  mutate(Order_Processing_Time = as.numeric(`Ship Date` - `Order Date`))
View(superstore)

# Filter out high-discount sales (> 0.5)
high_discount_sales <- superstore %>% filter(Discount > 0.5)
View(superstore)

# Summarize sales by region
sales_by_region <- superstore %>%
  group_by(Region) %>%
  summarise(
    Total_Sales = sum(Sales, na.rm = TRUE),
    Total_Profit = sum(Profit, na.rm = TRUE),
    Average_Discount = mean(Discount)
  ) %>%
  arrange(desc(Total_Sales))

print(sales_by_region)        #printing region wise sales

#Category wise sales
sales_by_category <- superstore %>%
  group_by(Category) %>%
  summarise(
    Total_Sales = sum(Sales, na.rm = TRUE),
    Total_Profit = sum(Profit, na.rm = TRUE),
    Average_Discount = mean(Discount)
  ) %>%
  arrange(desc(Total_Sales))

print(sales_by_category)        #printing city wise sales
