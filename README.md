# NYC-Traffic-Collision-Analysis-SQL-Power-BI-GitHub-
End-to-end analysis of 1M+ NYC traffic collision records using SQL and Power BI to identify crash trends, high-risk locations, and safety insights.
)
📌 Project Overview

This project analyzes over 1 million New York City traffic collision records to identify crash trends, high-risk locations, contributing factors, and the most affected road users.
The goal is to transform raw public data into actionable traffic safety insights using SQL and Power BI.

The final output is an interactive Power BI dashboard designed for decision-makers, policy teams, and urban planners.

🎯 Key Business Questions Answered

Are traffic crashes increasing or decreasing over time?

Which boroughs, streets, and intersections are the most dangerous?

What are the leading causes of crashes, and how do they vary by borough?

Which groups — pedestrians, cyclists, motorists — face the highest risk?

Which vehicle categories are most frequently involved in crashes?

🗂 Dataset

Source: NYC Open Data – Motor Vehicle Collisions

Time Period: 2020–2024

Records: 1M+ collision records

Granularity: Collision-level with location, vehicle, injury, and fatality details

🛠️ Tech Stack

SQL – Data cleaning, normalization, aggregation

Excel – Initial inspection and validation

Power BI – Interactive dashboards and visual storytelling

🔧 Data Preparation & Modeling

Imported flat files into a SQL database for efficient analysis

Cleaned and standardized:

Borough and street name inconsistencies

Vehicle type variations (e.g., SUV, Taxi, Motorcycle)

Converted date and time fields into proper datetime formats

Normalized vehicle data by unpivoting multiple vehicle columns into a single vehicle table

Created derived metrics for crashes, injuries, and fatalities

📊 Dashboard Pages & Insights
Page 1: Traffic Trends & Impact

Total crashes over time (yearly trends)

Borough-wise crash distribution

Injury and fatality trends

High-level KPIs for overall traffic safety impact

Insight Example:
Certain boroughs consistently account for a higher share of crashes, indicating the need for targeted enforcement.

Page 2: High-Risk Locations & Vehicle Patterns

Top collision-prone streets

Comparison of vehicle categories involved in crashes

Severity-focused visuals highlighting risk concentration

Insight Example:
A small set of streets contributes disproportionately to total collisions, making them priority candidates for safety interventions.

🧠 Key Findings

Traffic crashes show location-specific concentration rather than uniform distribution

Driver-related factors dominate crash causes across boroughs

Pedestrians and cyclists face higher injury risk in specific zones

Certain vehicle categories are more frequently involved in severe collisions

📢 Business & Policy Recommendations

Increase speed enforcement and monitoring in high-crash corridors

Improve pedestrian crossings and bike lane infrastructure in identified hotspots

Run targeted distracted driving awareness campaigns

Use data-driven prioritization for road safety investments


📂 Repository Structure
📁 data/          → Raw and cleaned datasets  
📁 sql/           → SQL queries used for analysis  
📁 visuals/       → Dashboard screenshots  
README.md         → Project documentation  

💼 Why This Project Matters

This project demonstrates:

End-to-end data analysis workflow

Strong SQL data modeling skills

Ability to convert complex datasets into executive-ready insights

Practical application of analytics to real-world urban problems
