# ESG Performance Intelligence Dashboard

An end-to-end data analytics project that explores how ESG performance relates to business outcomes such as revenue, profit margin, market value, and carbon efficiency across industries, regions, and time.

## Project Overview

This project was built to answer a core business question:

**Do higher-ESG companies also perform better financially, and are they more carbon-efficient?**

Using Python, PostgreSQL, and Tableau, I cleaned and analyzed an ESG and financial dataset, created custom metrics, answered structured business questions in SQL, and built interactive dashboards for storytelling and decision support.

## Objectives

The project focuses on:

- comparing ESG performance across industries
- analyzing ESG trends over time
- evaluating financial performance by ESG quartile
- measuring carbon efficiency using a custom metric
- identifying sector and regional differences in sustainability performance

## Tools Used

- **Python** for data cleaning, feature engineering, exploratory analysis
- **PostgreSQL** for structured business queries
- **Tableau Public** for dashboard design and storytelling

## Dataset Features

The dataset includes company-level records with fields such as:

- Company ID
- Company Name
- Industry
- Region
- Year
- Revenue
- Profit Margin
- Market Cap
- Growth Rate
- ESG Overall
- ESG Environmental
- ESG Social
- ESG Governance
- Carbon Emissions
- Water Usage
- Energy Consumption

## Project Workflow

### 1. Data Cleaning in Python
I used Python to:

- load and inspect the dataset
- check data structure and types
- identify missing values
- handle missing values in `GrowthRate`
- validate duplicate rows and company-year uniqueness
- create ESG quartiles
- create a custom metric called `Revenue_per_Carbon`

### 2. SQL Analysis in PostgreSQL
I used SQL to answer business questions such as:

- Which industries have the highest average ESG scores?
- Which regions have the highest average profit margins?
- Which industries are most carbon-efficient?
- Do higher ESG quartiles show stronger business performance?
- How has ESG changed over time?

### 3. Tableau Dashboarding
I built 3 dashboards:

#### Executive ESG Overview
- Average ESG by Industry
- Average ESG Over Time
- Revenue per Carbon by Industry

#### ESG and Financial Performance
- Revenue by ESG Quartile
- Profit Margin by ESG Quartile
- Revenue per Carbon by ESG Quartile

#### Carbon Efficiency and Sustainability
- Carbon Emissions by Industry
- Revenue per Carbon by Region
- Carbon Emissions vs Revenue

## Key Features

### ESG Quartile Analysis
Companies were segmented into:
- Low
- Medium-Low
- Medium-High
- High

This allowed comparison of business outcomes across ESG levels.

### Custom Metric: Revenue per Carbon
A custom metric was created to measure how much revenue a company generates per unit of carbon emissions.

```python
Revenue_per_Carbon = Revenue / CarbonEmissions
