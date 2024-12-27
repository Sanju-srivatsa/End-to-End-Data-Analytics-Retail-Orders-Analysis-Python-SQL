# Retail Orders Analysis: End-to-End Data Analytics Project

### Kaggle Notebook:
https://www.kaggle.com/code/sanjusrivatsa9/retail-orders-analysis

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
- Automated dataset download using the Kaggle API.
- Decompression of the dataset into a Pandas DataFrame for processing.

### **2. Data Cleaning**
- **Missing Data Handling:** Filled null `ship_mode` values with "Unknown."
- **Duplicate Removal:** Dropped duplicate `order_id` entries.
- **Column Standardization:** Normalized column names for consistency.

### **3. Data Transformation**
- Computed new metrics for analysis:
  - **Discount**: Derived from list price and discount percentage.
  - **Sale Price**: Net price after discount.
  - **Profit**: Sale price minus cost price.
- Reformatted `order_date` for ease of querying.

### **4. Data Loading**
- **SQLite Integration:** Enabled local storage and quick querying.
- **MySQL Integration:** Facilitated scalable data analysis with optimized schemas.

### **5. Data Analysis**
Used SQL to address key business objectives, such as:
- Identifying high-revenue products and profitable regions.
- Evaluating the impact of discounts on sales.
- Tracking sales trends and profitability by month and category.

### **6. Visualization**
- Generated visualizations to complement SQL insights:
  - Bar charts for top-performing products and regions.
  - Line charts for trends in sales growth and discounts.

---

## **Visualizations**
1. **Top 10 Products by Revenue**:
   - Bar chart visualizing the products with the highest revenue.
![image](https://github.com/user-attachments/assets/3608d969-0e1f-42eb-bf50-e27e6e1ee229)

2. **Regional Sales Trends**:
   - Bar chart showing total sales for each region.
![image](https://github.com/user-attachments/assets/e10cdbe4-322d-4892-89e5-3d3b61f7cf04)

3. **Month-over-Month Sales Growth**:
   - Line chart tracking sales trends month by month.
![image](https://github.com/user-attachments/assets/00ba4443-ef32-4acf-af1a-23b5c458f4bd)

4. **High-Growth Subcategories by Profit**:
   - Horizontal bar chart showcasing subcategories with the highest profits.
![image](https://github.com/user-attachments/assets/42f21b02-5ee6-4cd0-b17a-f9b6ee097fc5)

5. **Impact of Discount on Revenue**:
   - Line chart illustrating the relationship between discount percentages and total revenue.
![image](https://github.com/user-attachments/assets/84be412e-37bc-44b5-aabb-b6142991b4d4)

6. **Profitability by Region**:
   - Bar chart highlighting profits generated in each region.
![image](https://github.com/user-attachments/assets/539fa3c3-639e-4ecb-8c4f-263bbffac637)


---

## **SQL File Explanation**
### **Purpose**
The included SQL file is pivotal to this project as it:
1. **Defines the Database Schema**:
   - The `retail_orders` table is created with constraints for data integrity, such as:
     - `order_id` as the primary key.
     - Default values for specific columns (e.g., `country`, `quantity`).
   - Indexes are added for performance optimization.
2. **Answers Business Questions**:
   - Contains 11 business queries addressing key performance indicators, such as:
     - Top-performing products by revenue.
     - Regional profitability.
     - Month-over-month sales growth.
3. **Provides Scalability**:
   - The SQL file can be adapted to analyze other datasets with similar structures.

### **Schema Design**
- **Primary Key:** Ensures unique `order_id`.
- **Indexes:** Improve query performance for `order_date`, `region`, and `category`.
- **Constraints:** Enforce data quality with `NOT NULL` and default values.

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
<img width="1356" alt="image" src="https://github.com/user-attachments/assets/6bb47cf9-fd11-4288-a0b0-0f8f77fbeb76" />

- **Regional Sales Trends**:
  ```sql
  SELECT region, SUM(sale_price * quantity) AS total_sales
  FROM retail_orders
  GROUP BY region
  ORDER BY total_sales DESC;
  ```
<img width="851" alt="image" src="https://github.com/user-attachments/assets/a17150e1-3b99-4c27-9003-1f05eb4d8688" />

- **Month-over-Month Sales Growth**:
  ```sql
  SELECT DATE_FORMAT(order_date, '%Y-%m') AS month, SUM(sale_price * quantity) AS total_sales
  FROM retail_orders
  GROUP BY month
  ORDER BY month;
  ```
<img width="1170" alt="image" src="https://github.com/user-attachments/assets/447849d8-b3a1-43a2-8884-f010bcf42051" />
   ```

---

## **Dataset Attributes**
- **Order Details:** `order_id`, `order_date`, `ship_mode`, `segment`
- **Location Information:** `country`, `city`, `state`, `region`
- **Product Information:** `category`, `sub_category`, `product_id`
- **Financial Metrics:** `quantity`, `discount`, `sale_price`, `profit`

---

## **Insights and Recommendations**

### **Key Insights**
1. **Product Performance:**
   - Specific products consistently generate the highest revenue.
2. **Regional Trends:**
   - Regions with strong profitability warrant increased investment.
3. **Discount Optimization:**
   - Discounts influence revenue positively but require strategic planning.
4. **Category Focus:**
   - Subcategories with high margins offer opportunities for upselling.

### **Recommendations**
- Prioritize marketing efforts on top-performing products and regions.
- Implement dynamic discounting strategies to maximize profitability.
- Focus inventory management on high-demand and high-margin subcategories.

---

## **Future Enhancements**
1. **Automation**:
   - Use tools like Apache Airflow to automate ETL workflows.
2. **Predictive Analysis**:
   - Incorporate machine learning models for sales forecasting.
3. **Interactive Dashboards**:
   - Build dashboards with Tableau or Streamlit for real-time insights.
4. **Cloud Integration**:
   - Migrate workflows to cloud platforms for scalability and accessibility.

---

## **Conclusion**
This project serves as a robust example of leveraging Python, SQL, and data visualization to solve real-world business problems. It highlights the practical application of data engineering and analytics, making it a valuable resource for aspiring data professionals. By extending the analysis to predictive modeling and cloud integration, this workflow can unlock even greater business value.
