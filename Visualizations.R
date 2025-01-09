#Insights and Visualizations

#Region wise sales
ggplot(sales_by_region,aes(x="",y=Total_Sales,fill= Region))+
  geom_bar(width=1,stat="Identity")+
  coord_polar(theta="y")+
  labs(title="Region wise Sales")+
  theme_void()               #Remove axis labels and background for pie chart

#Category wise sales
ggplot(sales_by_category,aes(x="",y=Total_Sales,fill= Category))+
  geom_bar(width=1,stat="Identity")+
  coord_polar(theta="y")+
  labs(title="Category wise Sales")+
  theme_void()               #Remove axis labels and background for pie chart

# Sales v/s Profit by Category
ggplot(superstore, aes(x = Category, y = Profit, fill = Category)) +
  geom_boxplot() +
  labs(title = "Category wise Profit Distribution", y = "Profit") +
  theme_minimal()

# Sales trend over time
ggplot(superstore, aes(x = `Order Date`, y = Sales, color = Region)) +
  geom_line(stat = "summary", fun = "sum") +
  labs(title = "Region wise sales trend", x = "Order Date", y = "Total Sales") +
  theme_minimal()

# Top 10 profitable products
top_products <- superstore %>%
  group_by(`Product Name`) %>%
  summarise(Total_Profit = sum(Profit, na.rm = TRUE)) %>%
  arrange(desc(Total_Profit)) %>%
  slice_head(n = 10)
print(top_products)

#Visualization
ggplot(top_products, aes(x = reorder(`Product Name`, Total_Profit), y = Total_Profit)) +
  geom_bar(stat = "identity", fill = "yellow") +
  coord_flip() +
  labs(title = "Top 10 Most Profitable Products", x = "Product Name", y = "Total Profit") +
  theme_minimal()
