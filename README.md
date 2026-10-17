# Shoe Retail Sales Analytics

## Project Overview
This project analyzes a shoe retail business's sales and purchasing data for 2023 using MySQL and Tableau. It explores revenue trends, brand performance, product preferences, discount patterns, and supplier purchasing activity through SQL queries and interactive dashboards.

## Objectives
- Analyze overall sales performance and net revenue.
- Identify top-performing brands and sole types.
- Track monthly sales trends and seasonal variations.
- Evaluate discounts and their impact on revenue.
- Compare supplier purchasing expenditure and quantities purchased.

## Tools & Technologies
- **MySQL** — Data querying, aggregation, and analysis
- **Tableau Desktop** — Data visualization and interactive dashboards
- **CSV** — Data storage and import

## Dataset
The project uses four related datasets:
- `Products.csv` — Brand, sole type, size, color, and reorder level
- `Sales.csv` — Sale dates, quantities, selling prices, customer types, and discounts
- `Purchases.csv` — Purchase dates, suppliers, quantities, and purchase costs
- `Suppliers.csv` — Supplier names and cities

The dataset is synthetic and intended for learning and portfolio demonstration.

## Key Findings
- **130,696 units sold** during 2023.
- **9,561,145.91 in net revenue**, calculated after discounts. The dataset does not specify a verified currency.
- **August** recorded the highest monthly net revenue.
- **February** recorded the lowest monthly net revenue.
- **Relaxo** generated the highest net revenue among the listed brands.
- **PU** sole type generated the highest net revenue among the listed sole types.

## Dashboards

### 1. Sales Overview
- Total net revenue and units sold
- Monthly revenue trend
- Brand performance comparison

### 2. Product Performance
- Revenue by sole type
- Units sold by brand
- Average net revenue per unit by brand
- Brand versus sole type revenue heatmap

### 3. Inventory & Procurement
- Purchasing expenditure by supplier
- Units purchased by supplier
- Purchasing expenditure by sole type

## SQL Analysis
The SQL analysis covers:
- Overall sales performance
- Monthly revenue trends
- Brand and sole type comparisons
- Average net revenue per unit
- Supplier purchasing expenditure
- Monthly purchasing activity

## Repository Structure
```text
Shoe-Retail-Sales-Analytics/
├── data/
│   ├── Products.csv
│   ├── Sales.csv
│   ├── Purchases.csv
│   └── Suppliers.csv
├── tableau/
│   └── Shoe-Retail-Sales-Analytics.twbx
├── sql/
│   └── sql_analysis.sql
└── README.md
```

## Limitations
This project analyzes sales revenue and purchasing expenditure separately. It does not calculate verified profit or actual current inventory because the dataset does not provide a complete inventory-costing history or opening stock.

## Conclusion
This project demonstrates practical SQL analysis, data aggregation, and Tableau dashboard development to derive actionable insights from retail sales and purchasing data.
