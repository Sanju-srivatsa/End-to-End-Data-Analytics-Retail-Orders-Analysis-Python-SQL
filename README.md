# Retail Orders Analysis: End-to-End Data Analytics Project

## **Introduction**
This project is an end-to-end data analytics workflow designed to mimic a real-world business scenario. It demonstrates the Extract, Transform, Load (ETL) process and data analysis to uncover actionable insights from a retail orders dataset.

The dataset contains attributes such as product details, pricing, regional information, and sales data. The objective is to clean and preprocess the data, perform structured querying using SQL, and create visualizations to answer key business questions.

---

## **Project Objectives**
### **Data Extraction**
- Utilize the Kaggle API to download the dataset programmatically.
- Extract the dataset from its compressed format for further processing.

### **Data Transformation**
- Clean and preprocess the dataset, handling missing and duplicate values.
- Derive additional metrics such as profit, discount, and sale price.
- Normalize column names to a consistent format.

### **Data Loading**
- Load the transformed dataset into SQLite and MySQL databases for efficient querying.
- Implement proper database schema design with constraints and indexing for optimized performance.

### **Data Analysis**
- Use SQL queries to address business questions such as:
  - Top-performing products by revenue.
  - Regional sales and profit trends.
  - Month-over-month sales growth.
  - High-growth subcategories based on profit.
- Generate detailed visualizations for insights.

### **Insights and Recommendations**
- Extract actionable insights and provide business recommendations.
- Visualize key metrics to support decision-making.

---

## **Technologies Used**
- **Python**: For data cleaning, preprocessing, and visualization.
  - Libraries: `pandas`, `sqlalchemy`, `mysql.connector`, `seaborn`, `matplotlib`
- **SQL**: For querying and analyzing data.
  - Databases: SQLite and MySQL
- **Kaggle API**: For automated dataset extraction.
- **Visualization Tools**: Seaborn and Matplotlib for creating insightful charts.

---

## **Dataset Description**
The dataset includes retail orders with the following key attributes:
- `order_id`: Unique identifier for each order.
- `order_date`: Date when the order was placed.
- `ship_mode`: Shipping method used for the order.
- `segment`: Customer segment (e.g., Consumer, Corporate).
- `region`: Regional classification of the sales.
- `category` and `sub_category`: Product categories and subcategories.
- `sale_price`, `quantity`, `discount`, and `profit`: Metrics for financial analysis.

---

## **Workflow Steps**

### **1. Data Extraction**
- The Kaggle API was used to programmatically download the dataset from [Kaggle](https://www.kaggle.com).
- The dataset was extracted from its `.zip` format and loaded into a Pandas DataFrame.

### **2. Data Cleaning**
- **Missing Values**: Handled missing values in the `ship_mode` column by replacing them with "Unknown."
- **Duplicate Records**: Identified and removed duplicate `order_id` entries to ensure data integrity.
- **Standardization**: Normalized column names to lowercase with underscores for consistency.

### **3. Data Transformation**
- Derived new metrics:
  - **Discount**: Calculated as `list_price * discount_percent`.
  - **Sale Price**: Determined by subtracting the discount from the list price.
  - **Profit**: Calculated as `sale_price - cost_price`.
- Reformatted the `order_date` column for better querying.

### **4. Data Loading**
- **SQLite**: Created a database using SQLite for local data analysis.
- **MySQL**: Loaded the data into a MySQL database for scalable querying.

### **5. Data Analysis**
SQL queries were designed to address the following:
1. **Top-Performing Products by Revenue**: Identified products contributing the most revenue.
2. **Regional Sales Trends**: Analyzed total sales across different regions.
3. **Month-over-Month Sales Growth**: Monitored sales performance trends over time.
4. **High-Growth Subcategories by Profit**: Highlighted profitable subcategories.
5. **Discount Impact on Revenue**: Assessed how discounts affect revenue.

---

## **Visualizations**
1. **Top 10 Products by Revenue**:
   - Bar chart visualizing the products with the highest revenue.

2. **Regional Sales Trends**:
   - Bar chart showing total sales for each region.

3. **Month-over-Month Sales Growth**:
   - Line chart tracking sales trends month by month.

4. **High-Growth Subcategories by Profit**:
   - Horizontal bar chart showcasing subcategories with the highest profits.

5. **Impact of Discount on Revenue**:
   - Line chart illustrating the relationship between discount percentages and total revenue.

6. **Profitability by Region**:
   - Bar chart highlighting profits generated in each region.

---

## **SQL Queries Used**
### Example Queries:
- **Top 10 Products by Revenue**:
  ```sql
  SELECT product_id, SUM(sale_price * quantity) AS total_revenue
  FROM retail_orders
  GROUP BY product_id
  ORDER BY total_revenue DESC
  LIMIT 10;
  ```
- **Regional Sales Trends**:
  ```sql
  SELECT region, SUM(sale_price * quantity) AS total_sales
  FROM retail_orders
  GROUP BY region
  ORDER BY total_sales DESC;
  ```

- **Month-over-Month Sales Growth**:
  ```sql
  SELECT DATE_FORMAT(order_date, '%Y-%m') AS month, SUM(sale_price * quantity) AS total_sales
  FROM retail_orders
  GROUP BY month
  ORDER BY month;
  ```

---

## **Insights and Recommendations**
### **Key Insights**
1. **Top-Performing Products**:
   - Products generating the highest revenue should be prioritized for marketing campaigns.
2. **Regional Trends**:
   - Regions with high sales should receive additional resources to maximize revenue.
3. **Discount Strategy**:
   - Analyze the impact of discounts to optimize pricing strategies.
4. **Profitability**:
   - Subcategories with high profits should be prioritized for upselling opportunities.

### **Recommendations**
- Allocate more resources to high-performing regions and subcategories.
- Optimize discount strategies to balance revenue growth and profitability.
- Focus marketing efforts on top-selling products to maximize ROI.

---

## **Future Enhancements**
- **Scalability**: Automate the ETL process using tools like Apache Airflow or AWS Glue.
- **Machine Learning**: Implement predictive models for sales forecasting.
- **Interactive Dashboards**: Develop dashboards using Tableau, Power BI, or Streamlit.
- **Cloud Deployment**: Migrate the database to a cloud platform like AWS or Azure for scalability.

---

## **Conclusion**
This project demonstrates a comprehensive data analytics workflow, from data cleaning and transformation to database integration and visualization. It showcases the practical application of Python and SQL in solving real-world business problems and generating actionable insights.

For further exploration, this workflow can be extended to include advanced analytics, predictive modeling, and interactive dashboards, providing even greater value for decision-making in retail operations.
