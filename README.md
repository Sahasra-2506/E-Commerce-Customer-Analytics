# E-Commerce Customer Segmentation Analysis (RFM)

An end-to-end analytics project that segments e-commerce customers using RFM (Recency, Frequency, Monetary) analysis to identify which customers drive the most revenue — and which high-value customers are at risk of churning.

**Tools used:** SQL (SQLite) · Python (pandas, numpy) · matplotlib/seaborn · Power BI

---

## Business Problem

An e-commerce company's growth team wants to know: **which customers are worth the most, which are at risk of leaving, and what should be done about it?**

This project answers that using the [Olist Brazilian E-Commerce dataset](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce) (~96,000 customers, ~99,000 orders) by building customer segments from purchase behavior and turning them into an actionable business recommendation.

---

## Project Workflow

**1. SQL — Data Extraction**
Raw relational tables (orders, order items, payments, customers) were joined and aggregated using SQL to build a customer-level dataset. This included window functions (`LAG()` for month-over-month revenue growth) and CTEs to calculate Recency, Frequency, and Monetary value per customer.
→ See [`/sql`](./SQL)

**2. Python — RFM Scoring & Segmentation**
Using pandas and numpy, each customer was scored 1–5 on Recency, Frequency, and Monetary value (quintile-based), then mapped into six business-friendly segments: Champions, Loyal Customers, At Risk, New Customers, Needs Attention, and Lost.
→ See [`/notebooks`](./Notebooks)

**3. Visualization**
Segment size and revenue contribution were visualized with matplotlib/seaborn to validate the segmentation before building the dashboard.
→ See [`/outputs`](./Outputs)

**4. Power BI Dashboard**
An interactive two-page dashboard: an overview page (total revenue, customers, monthly trend) and a segmentation page (customer count and revenue by segment, with a clickable slicer).
→ See [`/powerbi`](./PowerBI)

---

## Key Findings

- **Total revenue analyzed:** $15.42M across 96,478 customers (average order value: $159.83)
- **"At Risk" customers generate $3.7M in revenue** — nearly double what "Champions" bring in ($1.9M), and on par with "Loyal Customers." This was the most important and counter-intuitive finding of the project: the highest-value segment isn't the one you'd assume.
  - 23,270 customers fall into this segment. Since they haven't purchased recently but historically spent heavily, they represent the single biggest revenue-retention opportunity in the business.
- **Repeat purchase behavior is very low across the dataset** — the majority of customers placed only one order. A calendar-based cohort retention analysis wasn't meaningful here, since Olist's customer ID structure doesn't reliably track repeat customers across orders. Order frequency (used in the RFM scoring) was used as a loyalty proxy instead.
- **Revenue dips sharply after August** in the monthly trend — this reflects incomplete data collection in the later months of the dataset rather than an actual business decline.

## Recommendation

Prioritize a re-engagement campaign (targeted offers, reminder emails) for the "At Risk" segment. This group already has a proven history of high spending — the goal is recovering revenue that's already being lost, not acquiring new customers from scratch.

---

## Repository Structure

```
├── Notebooks/            SQL queries: order summaries, RFM base table, monthly revenue (window functions)
├── Outputs/       Python notebook: RFM scoring, segmentation, visualizations
├── PowerBI/          Exported CSVs and chart images
├── SQL/          Power BI dashboard (.pbix)
└── README.md
```

---


