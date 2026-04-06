```python
import pandas as pd

# Import numpy for numeric calculations
import numpy as np
```


```python
df = pd.read_csv("company_esg_financial_dataset.csv")

```


```python
print(df.head())
```

       CompanyID CompanyName Industry         Region  Year  Revenue  ProfitMargin  \
    0          1   Company_1   Retail  Latin America  2015    459.2           6.0   
    1          1   Company_1   Retail  Latin America  2016    473.8           4.6   
    2          1   Company_1   Retail  Latin America  2017    564.9           5.2   
    3          1   Company_1   Retail  Latin America  2018    558.4           4.3   
    4          1   Company_1   Retail  Latin America  2019    554.5           4.9   
    
       MarketCap  GrowthRate  ESG_Overall  ESG_Environmental  ESG_Social  \
    0      337.5         NaN         57.0               60.7        33.5   
    1      366.6         3.2         56.7               58.9        32.8   
    2      313.4        19.2         56.5               57.6        34.0   
    3      283.0        -1.1         58.0               62.3        33.4   
    4      538.1        -0.7         56.6               63.7        30.0   
    
       ESG_Governance  CarbonEmissions  WaterUsage  EnergyConsumption  
    0            76.8          35577.4     17788.7            71154.7  
    1            78.5          37314.7     18657.4            74629.4  
    2            77.8          45006.4     22503.2            90012.9  
    3            78.3          42650.1     21325.1            85300.2  
    4            76.1          41799.4     20899.7            83598.8  



```python
print("Dataset shape:", df.shape)
```

    Dataset shape: (11000, 16)



```python
print("Column names:")
print(df.columns)
```

    Column names:
    Index(['CompanyID', 'CompanyName', 'Industry', 'Region', 'Year', 'Revenue',
           'ProfitMargin', 'MarketCap', 'GrowthRate', 'ESG_Overall',
           'ESG_Environmental', 'ESG_Social', 'ESG_Governance', 'CarbonEmissions',
           'WaterUsage', 'EnergyConsumption'],
          dtype='object')



```python
print(df.info())
```

    <class 'pandas.core.frame.DataFrame'>
    RangeIndex: 11000 entries, 0 to 10999
    Data columns (total 16 columns):
     #   Column             Non-Null Count  Dtype  
    ---  ------             --------------  -----  
     0   CompanyID          11000 non-null  int64  
     1   CompanyName        11000 non-null  object 
     2   Industry           11000 non-null  object 
     3   Region             11000 non-null  object 
     4   Year               11000 non-null  int64  
     5   Revenue            11000 non-null  float64
     6   ProfitMargin       11000 non-null  float64
     7   MarketCap          11000 non-null  float64
     8   GrowthRate         10000 non-null  float64
     9   ESG_Overall        11000 non-null  float64
     10  ESG_Environmental  11000 non-null  float64
     11  ESG_Social         11000 non-null  float64
     12  ESG_Governance     11000 non-null  float64
     13  CarbonEmissions    11000 non-null  float64
     14  WaterUsage         11000 non-null  float64
     15  EnergyConsumption  11000 non-null  float64
    dtypes: float64(11), int64(2), object(3)
    memory usage: 1.3+ MB
    None



```python
missing_values = df.isnull().sum()
print("Missing values in each column:")
print(missing_values)
```

    Missing values in each column:
    CompanyID               0
    CompanyName             0
    Industry                0
    Region                  0
    Year                    0
    Revenue                 0
    ProfitMargin            0
    MarketCap               0
    GrowthRate           1000
    ESG_Overall             0
    ESG_Environmental       0
    ESG_Social              0
    ESG_Governance          0
    CarbonEmissions         0
    WaterUsage              0
    EnergyConsumption       0
    dtype: int64



```python
missing_growthrate = df["GrowthRate"].isnull().sum()
total_rows = len(df)

missing_percentage = (missing_growthrate / total_rows) * 100

print("Missing values in GrowthRate:", missing_growthrate)
print("Percentage missing in GrowthRate:", round(missing_percentage, 2), "%")
```

    Missing values in GrowthRate: 1000
    Percentage missing in GrowthRate: 9.09 %



```python
# Check missing values before treatment
print("Missing values before treatment:", df["GrowthRate"].isnull().sum())


```

    Missing values before treatment: 1000



```python
# Find the median value of GrowthRate
# We use median because it is more robust than mean when outliers may exist
growthrate_median = df["GrowthRate"].median()
```


```python
# Fill missing GrowthRate values with the median
df["GrowthRate"] = df["GrowthRate"].fillna(growthrate_median)
```


```python
# Check missing values after treatment
print("Missing values after treatment:", df["GrowthRate"].isnull().sum())
```

    Missing values after treatment: 0



```python
# Print the median used for filling
print("Median used to fill missing GrowthRate values:", growthrate_median)
```

    Median used to fill missing GrowthRate values: 4.9



```python
# Check missing values in all columns again after cleaning
print(df.isnull().sum())
```

    CompanyID            0
    CompanyName          0
    Industry             0
    Region               0
    Year                 0
    Revenue              0
    ProfitMargin         0
    MarketCap            0
    GrowthRate           0
    ESG_Overall          0
    ESG_Environmental    0
    ESG_Social           0
    ESG_Governance       0
    CarbonEmissions      0
    WaterUsage           0
    EnergyConsumption    0
    dtype: int64



```python
# Check the number of duplicate rows in the dataset
duplicate_count = df.duplicated().sum()

# Print the result
print("Number of duplicate rows:", duplicate_count)
```

    Number of duplicate rows: 0



```python
# Display all unique industries in the dataset
print("Unique industries:")
print(df["Industry"].unique())
```

    Unique industries:
    ['Retail' 'Transportation' 'Technology' 'Finance' 'Healthcare' 'Energy'
     'Consumer Goods' 'Utilities' 'Manufacturing']



```python
# Count how many records belong to each industry
industry_counts = df["Industry"].value_counts()

# Print the result
print("Number of records in each industry:")
print(industry_counts)
```

    Number of records in each industry:
    Industry
    Healthcare        1331
    Transportation    1287
    Manufacturing     1287
    Consumer Goods    1276
    Finance           1243
    Energy            1188
    Utilities         1177
    Retail            1166
    Technology        1045
    Name: count, dtype: int64



```python
# Display all unique regions in the dataset
print("Unique regions:")
print(df["Region"].unique())
```

    Unique regions:
    ['Latin America' 'Asia' 'Africa' 'Middle East' 'Oceania' 'Europe'
     'North America']



```python
# Count how many records belong to each region
region_counts = df["Region"].value_counts()

# Print the result
print("Number of records in each region:")
print(region_counts)
```

    Number of records in each region:
    Region
    Asia             1672
    Oceania          1661
    Middle East      1617
    Europe           1540
    North America    1540
    Latin America    1507
    Africa           1463
    Name: count, dtype: int64



```python
# Find the earliest and latest year in the dataset
min_year = df["Year"].min()
max_year = df["Year"].max()

# Print the result
print("Earliest year in dataset:", min_year)
print("Latest year in dataset:", max_year)
```

    Earliest year in dataset: 2015
    Latest year in dataset: 2025



```python
# Count how many records are present in each year
year_counts = df["Year"].value_counts().sort_index()

# Print the result
print("Number of records per year:")
print(year_counts)
```

    Number of records per year:
    Year
    2015    1000
    2016    1000
    2017    1000
    2018    1000
    2019    1000
    2020    1000
    2021    1000
    2022    1000
    2023    1000
    2024    1000
    2025    1000
    Name: count, dtype: int64



```python
# Count how many year records each company has
company_record_count = df.groupby("CompanyName")["Year"].count().sort_values(ascending=False)

# Print the top 10 companies with the most records
print("Top 10 companies by number of records:")
print(company_record_count.head(10))
```

    Top 10 companies by number of records:
    CompanyName
    Company_1      11
    Company_702    11
    Company_691    11
    Company_692    11
    Company_693    11
    Company_694    11
    Company_695    11
    Company_696    11
    Company_697    11
    Company_698    11
    Name: Year, dtype: int64



```python
# Check whether any company has duplicate entries for the same year
duplicate_company_year = df.duplicated(subset=["CompanyName", "Year"]).sum()

# Print the result
print("Duplicate CompanyName-Year combinations:", duplicate_company_year)
```

    Duplicate CompanyName-Year combinations: 0



```python
# Select important numeric columns for analysis
numeric_columns = [
    "Revenue",
    "ProfitMargin",
    "MarketCap",
    "GrowthRate",
    "ESG_Overall",
    "ESG_Environmental",
    "ESG_Social",
    "ESG_Governance",
    "CarbonEmissions",
    "WaterUsage",
    "EnergyConsumption"
]

# Display summary statistics for selected columns
print("Summary statistics for numeric columns:")
print(df[numeric_columns].describe())
```

    Summary statistics for numeric columns:
                 Revenue  ProfitMargin      MarketCap    GrowthRate   ESG_Overall  \
    count   11000.000000  11000.000000   11000.000000  11000.000000  11000.000000   
    mean     4670.850591     10.900455   13380.622236      4.836700     54.615273   
    std      9969.954369      8.758711   39922.870373      8.986164     15.893937   
    min        35.900000    -20.000000       1.800000    -36.000000      6.300000   
    25%       938.775000      5.300000    1098.525000     -0.600000     44.100000   
    50%      1902.300000     10.500000    3096.450000      4.900000     54.600000   
    75%      4342.625000     16.300000    9995.500000     10.300000     65.600000   
    max    180810.400000     50.000000  865271.700000     38.000000     98.800000   
    
           ESG_Environmental    ESG_Social  ESG_Governance  CarbonEmissions  \
    count       11000.000000  11000.000000    11000.000000     1.100000e+04   
    mean           56.416991     55.660582       51.767655     1.271462e+06   
    std            26.767233     23.356152       25.323370     5.067760e+06   
    min             0.000000      0.000000        0.000000     2.042200e+03   
    25%            34.700000     37.600000       30.775000     1.228530e+05   
    50%            55.600000     55.150000       52.100000     2.920734e+05   
    75%            79.000000     73.800000       73.000000     7.407311e+05   
    max           100.000000    100.000000      100.000000     1.741047e+08   
    
             WaterUsage  EnergyConsumption  
    count  1.100000e+04       1.100000e+04  
    mean   5.600442e+05       1.165839e+07  
    std    1.565686e+06       5.095836e+07  
    min    1.021100e+03       5.105500e+03  
    25%    6.488467e+04       3.069161e+05  
    50%    2.038805e+05       1.221745e+06  
    75%    5.251880e+05       5.616437e+06  
    max    5.223142e+07       1.741047e+09  



```python
# Group the dataset by Industry and calculate average ESG Overall score
industry_esg = df.groupby("Industry")["ESG_Overall"].mean().sort_values(ascending=False)

# Print the result
print("Average ESG Overall score by Industry:")
print(industry_esg)
```

    Average ESG Overall score by Industry:
    Industry
    Finance           64.620434
    Technology        63.345167
    Healthcare        57.254395
    Retail            55.681818
    Consumer Goods    54.829467
    Utilities         51.601274
    Manufacturing     50.462626
    Energy            49.014815
    Transportation    46.034499
    Name: ESG_Overall, dtype: float64



```python
# Group the dataset by Region and calculate average Profit Margin
region_profit = df.groupby("Region")["ProfitMargin"].mean().sort_values(ascending=False)

# Print the result
print("Average Profit Margin by Region:")
print(region_profit)
```

    Average Profit Margin by Region:
    Region
    Africa           11.372249
    Asia             11.342285
    North America    11.285779
    Oceania          10.847562
    Middle East      10.771243
    Latin America    10.379695
    Europe           10.289545
    Name: ProfitMargin, dtype: float64



```python
# Group the dataset by Year and calculate average ESG Overall score
yearly_esg = df.groupby("Year")["ESG_Overall"].mean()

# Print the result
print("Average ESG Overall score by Year:")
print(yearly_esg)
```

    Average ESG Overall score by Year:
    Year
    2015    51.4419
    2016    52.0439
    2017    52.6777
    2018    53.3514
    2019    53.9070
    2020    54.5884
    2021    55.2397
    2022    55.9208
    2023    56.5865
    2024    57.1767
    2025    57.8340
    Name: ESG_Overall, dtype: float64



```python
# Group the dataset by Industry and calculate average Carbon Emissions
industry_carbon = df.groupby("Industry")["CarbonEmissions"].mean().sort_values(ascending=False)

# Print the result
print("Average Carbon Emissions by Industry:")
print(industry_carbon)
```

    Average Carbon Emissions by Industry:
    Industry
    Energy            8.191265e+06
    Utilities         8.693411e+05
    Transportation    6.503149e+05
    Manufacturing     6.235968e+05
    Technology        4.504187e+05
    Consumer Goods    3.403685e+05
    Healthcare        3.353292e+05
    Retail            1.297126e+05
    Finance           7.205045e+04
    Name: CarbonEmissions, dtype: float64



```python
# Group the dataset by Industry and calculate average Growth Rate
industry_growth = df.groupby("Industry")["GrowthRate"].mean().sort_values(ascending=False)

# Print the result
print("Average Growth Rate by Industry:")
print(industry_growth)
```

    Average Growth Rate by Industry:
    Industry
    Technology        8.804306
    Healthcare        6.927724
    Consumer Goods    5.383621
    Finance           5.050442
    Retail            4.385420
    Transportation    4.330769
    Manufacturing     4.173815
    Energy            2.440488
    Utilities         2.274511
    Name: GrowthRate, dtype: float64



```python
# Group the dataset by Industry and calculate average Market Cap
industry_marketcap = df.groupby("Industry")["MarketCap"].mean().sort_values(ascending=False)

# Print the result
print("Average Market Cap by Industry:")
print(industry_marketcap)
```

    Average Market Cap by Industry:
    Industry
    Technology        69081.640957
    Energy            20766.332744
    Healthcare        13135.287829
    Finance           12797.976750
    Consumer Goods     4208.344671
    Manufacturing      3672.348873
    Retail             2382.425472
    Transportation     1755.243745
    Utilities          1531.100850
    Name: MarketCap, dtype: float64



```python
# -----------------------------
# 1. Correlation analysis
# -----------------------------

# Select the numeric columns we want to analyze
numeric_columns = [
    "Revenue",
    "ProfitMargin",
    "MarketCap",
    "GrowthRate",
    "ESG_Overall",
    "ESG_Environmental",
    "ESG_Social",
    "ESG_Governance",
    "CarbonEmissions",
    "WaterUsage",
    "EnergyConsumption"
]

# Create the correlation matrix
correlation_matrix = df[numeric_columns].corr()

# Print the full correlation matrix
print("Correlation Matrix:")
print(correlation_matrix)
```

    Correlation Matrix:
                        Revenue  ProfitMargin  MarketCap  GrowthRate  ESG_Overall  \
    Revenue            1.000000      0.132488   0.836884    0.162354     0.148869   
    ProfitMargin       0.132488      1.000000   0.259927    0.058999     0.088006   
    MarketCap          0.836884      0.259927   1.000000    0.127677     0.143793   
    GrowthRate         0.162354      0.058999   0.127677    1.000000     0.064806   
    ESG_Overall        0.148869      0.088006   0.143793    0.064806     1.000000   
    ESG_Environmental  0.206628      0.218662   0.214595    0.097281     0.568171   
    ESG_Social         0.047173     -0.032642   0.039297    0.006769     0.662357   
    ESG_Governance     0.018489     -0.035372   0.007758    0.012995     0.671476   
    CarbonEmissions    0.507967     -0.006027   0.299603    0.085326    -0.039672   
    WaterUsage         0.540424     -0.002967   0.319704    0.099323    -0.042911   
    EnergyConsumption  0.476501     -0.010356   0.268541    0.076218    -0.043649   
    
                       ESG_Environmental  ESG_Social  ESG_Governance  \
    Revenue                     0.206628    0.047173        0.018489   
    ProfitMargin                0.218662   -0.032642       -0.035372   
    MarketCap                   0.214595    0.039297        0.007758   
    GrowthRate                  0.097281    0.006769        0.012995   
    ESG_Overall                 0.568171    0.662357        0.671476   
    ESG_Environmental           1.000000    0.025030       -0.010290   
    ESG_Social                  0.025030    1.000000        0.298431   
    ESG_Governance             -0.010290    0.298431        1.000000   
    CarbonEmissions            -0.151823    0.024222        0.063486   
    WaterUsage                 -0.167818    0.032781        0.066401   
    EnergyConsumption          -0.158019    0.025077        0.061755   
    
                       CarbonEmissions  WaterUsage  EnergyConsumption  
    Revenue                   0.507967    0.540424           0.476501  
    ProfitMargin             -0.006027   -0.002967          -0.010356  
    MarketCap                 0.299603    0.319704           0.268541  
    GrowthRate                0.085326    0.099323           0.076218  
    ESG_Overall              -0.039672   -0.042911          -0.043649  
    ESG_Environmental        -0.151823   -0.167818          -0.158019  
    ESG_Social                0.024222    0.032781           0.025077  
    ESG_Governance            0.063486    0.066401           0.061755  
    CarbonEmissions           1.000000    0.968974           0.997210  
    WaterUsage                0.968974    1.000000           0.974503  
    EnergyConsumption         0.997210    0.974503           1.000000  



```python
# -----------------------------
# 2. Focus on ESG Overall relationships
# -----------------------------

# Select the correlation of ESG_Overall with key financial metrics
esg_vs_finance = correlation_matrix["ESG_Overall"][[
    "Revenue",
    "ProfitMargin",
    "MarketCap",
    "GrowthRate"
]]

# Print the result
print("Correlation of ESG Overall with key financial metrics:")
print(esg_vs_finance)
```

    Correlation of ESG Overall with key financial metrics:
    Revenue         0.148869
    ProfitMargin    0.088006
    MarketCap       0.143793
    GrowthRate      0.064806
    Name: ESG_Overall, dtype: float64



```python
# -----------------------------
# 3. Focus on Carbon Emissions relationships
# -----------------------------

# Select the correlation of CarbonEmissions with key variables
carbon_vs_business = correlation_matrix["CarbonEmissions"][[
    "Revenue",
    "ProfitMargin",
    "MarketCap",
    "GrowthRate",
    "EnergyConsumption",
    "WaterUsage"
]]

# Print the result
print("Correlation of Carbon Emissions with key variables:")
print(carbon_vs_business)
```

    Correlation of Carbon Emissions with key variables:
    Revenue              0.507967
    ProfitMargin        -0.006027
    MarketCap            0.299603
    GrowthRate           0.085326
    EnergyConsumption    0.997210
    WaterUsage           0.968974
    Name: CarbonEmissions, dtype: float64



```python
# -----------------------------
# 1. Create ESG quartiles
# -----------------------------

# Divide ESG_Overall into 4 equal groups
# qcut creates groups based on the distribution of the data
df["ESG_Quartile"] = pd.qcut(
    df["ESG_Overall"],
    4,
    labels=["Low", "Medium-Low", "Medium-High", "High"]
)

# Check how many companies fall into each ESG quartile
print("Number of records in each ESG quartile:")
print(df["ESG_Quartile"].value_counts())
```

    Number of records in each ESG quartile:
    ESG_Quartile
    Medium-Low     2757
    Medium-High    2754
    Low            2753
    High           2736
    Name: count, dtype: int64



```python
# -----------------------------
# 2. Compare performance by ESG quartile
# -----------------------------

# Group the data by ESG quartile and calculate average values
quartile_summary = df.groupby("ESG_Quartile")[[
    "Revenue",
    "ProfitMargin",
    "GrowthRate",
    "MarketCap",
    "CarbonEmissions"
]].mean()

# Print the result
print("Average performance by ESG Quartile:")
print(quartile_summary)
```

    Average performance by ESG Quartile:
                      Revenue  ProfitMargin  GrowthRate     MarketCap  \
    ESG_Quartile                                                        
    Low           2956.069960     10.467744    4.101235   7424.951181   
    Medium-Low    3907.580812     10.097352    4.590569   9782.079761   
    Medium-High   5034.493174     10.580610    4.962092  13873.635330   
    High          6799.379167     12.467069    5.698538  22503.204825   
    
                  CarbonEmissions  
    ESG_Quartile                   
    Low              1.508570e+06  
    Medium-Low       1.275479e+06  
    Medium-High      1.422507e+06  
    High             8.767963e+05  


    /var/folders/qf/087rpzjn2lz3trk3z5yxp4qw0000gn/T/ipykernel_3180/684979979.py:6: FutureWarning: The default of observed=False is deprecated and will be changed to True in a future version of pandas. Pass observed=False to retain current behavior or observed=True to adopt the future default and silence this warning.
      quartile_summary = df.groupby("ESG_Quartile")[[



```python
# -----------------------------
# 3. Create a custom efficiency metric
# -----------------------------

# Create a new metric called Revenue_per_Carbon
# This tells us how much revenue a company generates
# for each unit of carbon emissions

# Replace 0 in CarbonEmissions with NaN to avoid division by zero
df["Revenue_per_Carbon"] = df["Revenue"] / df["CarbonEmissions"].replace(0, np.nan)

# View the first few rows of the new metric
print("Sample of Revenue_per_Carbon:")
print(df[["CompanyName", "Revenue", "CarbonEmissions", "Revenue_per_Carbon"]].head())
```

    Sample of Revenue_per_Carbon:
      CompanyName  Revenue  CarbonEmissions  Revenue_per_Carbon
    0   Company_1    459.2          35577.4            0.012907
    1   Company_1    473.8          37314.7            0.012697
    2   Company_1    564.9          45006.4            0.012552
    3   Company_1    558.4          42650.1            0.013093
    4   Company_1    554.5          41799.4            0.013266



```python
# -----------------------------
# 4. Compare Revenue_per_Carbon by ESG quartile
# -----------------------------

# Group the data by ESG quartile and calculate average Revenue_per_Carbon
quartile_efficiency = df.groupby("ESG_Quartile", observed=False)["Revenue_per_Carbon"].mean()

# Print the result
print("Average Revenue per Carbon by ESG Quartile:")
print(quartile_efficiency)
```

    Average Revenue per Carbon by ESG Quartile:
    ESG_Quartile
    Low            0.007144
    Medium-Low     0.015324
    Medium-High    0.019805
    High           0.030058
    Name: Revenue_per_Carbon, dtype: float64



```python
# -----------------------------
# 5. Compare Revenue_per_Carbon by Industry
# -----------------------------

# Group the data by Industry and calculate average Revenue_per_Carbon
industry_efficiency = df.groupby("Industry")["Revenue_per_Carbon"].mean().sort_values(ascending=False)

# Print the result
print("Average Revenue per Carbon by Industry:")
print(industry_efficiency)
```

    Average Revenue per Carbon by Industry:
    Industry
    Finance           0.089741
    Technology        0.033682
    Healthcare        0.014025
    Retail            0.013010
    Consumer Goods    0.006204
    Manufacturing     0.003787
    Transportation    0.001768
    Utilities         0.001467
    Energy            0.001114
    Name: Revenue_per_Carbon, dtype: float64



```python
# Save the cleaned and enriched dataset to a new CSV file
df.to_csv("cleaned_esg_dashboard_data.csv", index=False)

# Confirm the file was saved successfully
print("Cleaned dataset saved successfully.")
```

    Cleaned dataset saved successfully.



```python

```
