CREATE TABLE esg_performance_dashboard (
    CompanyID INT,
    CompanyName VARCHAR(100),
    Industry VARCHAR(50),
    Region VARCHAR(50),
    Year INT,
    Revenue FLOAT,
    ProfitMargin FLOAT,
    MarketCap FLOAT,
    GrowthRate FLOAT,
    ESG_Overall FLOAT,
    ESG_Environmental FLOAT,
    ESG_Social FLOAT,
    ESG_Governance FLOAT,
    CarbonEmissions FLOAT,
    WaterUsage FLOAT,
    EnergyConsumption FLOAT,
    ESG_Quartile VARCHAR(20),
    Revenue_per_Carbon FLOAT
);
select*from esg_performance_dashboard limit 10;

Q1- Which industries have the highest average ESG scores?
SELECT
    Industry,
    ROUND(AVG(ESG_Overall)::numeric, 2) AS Avg_ESG_Overall
FROM esg_performance_dashboard
GROUP BY Industry
ORDER BY Avg_ESG_Overall DESC;


Q2-Which regions have the highest average profit margins?
SELECT 
    Region,
    ROUND(AVG(ProfitMargin)::numeric, 2) AS Avg_ProfitMargin
FROM esg_performance_dashboard
GROUP BY Region
ORDER BY Avg_ProfitMargin DESC;


Q3-Which industries have the highest average carbon emissions?
SELECT
    Industry,
    ROUND(AVG(CarbonEmissions)::numeric, 2) AS Avg_CarbonEmissions
FROM esg_performance_dashboard
GROUP BY Industry
ORDER BY Avg_CarbonEmissions DESC;


Q4-Which industries have the highest average carbon emissions?
SELECT
    Industry,
    ROUND(AVG(Revenue_per_Carbon)::numeric, 5) AS Avg_Revenue_per_Carbon
FROM esg_performance_dashboard
GROUP BY Industry
ORDER BY Avg_Revenue_per_Carbon DESC;

Q5-Do higher ESG groups show stronger financial performance?
SELECT
    ESG_Quartile,
    ROUND(AVG(Revenue)::numeric, 2) AS Avg_Revenue,
    ROUND(AVG(ProfitMargin)::numeric, 2) AS Avg_ProfitMargin,
    ROUND(AVG(GrowthRate)::numeric, 2) AS Avg_GrowthRate,
    ROUND(AVG(MarketCap)::numeric, 2) AS Avg_MarketCap,
    ROUND(AVG(CarbonEmissions)::numeric, 2) AS Avg_CarbonEmissions
FROM esg_performance_dashboard
GROUP BY ESG_Quartile
ORDER BY
    CASE ESG_Quartile
        WHEN 'Low' THEN 1
        WHEN 'Medium-Low' THEN 2
        WHEN 'Medium-High' THEN 3
        WHEN 'High' THEN 4
    END;
	
Q6-How has average ESG performance changed over time?
SELECT
    Year,
    ROUND(AVG(ESG_Overall)::numeric, 2) AS Avg_ESG_Overall
FROM esg_performance_dashboard
GROUP BY Year
ORDER BY Year;

Q7-Which regions have the highest average Revenue per Carbon?
SELECT
    Region,
    ROUND(AVG(Revenue_per_Carbon)::numeric, 5) AS Avg_Revenue_per_Carbon
FROM esg_performance_dashboard
GROUP BY Region
ORDER BY Avg_Revenue_per_Carbon DESC;





