# Sales-Inventory-and-Procurement-Analysis
![image](https://github.com/SurajspatiL99/Sales-Inventory-and-Procurement-Analysis/assets/101862962/3e0f070d-03fd-4657-9fb4-e10d243f46a1)

# Table of contents 


# Objective
Minimize waste by optimizing inventory levels.
Identify the most efficient purchasing strategies based on sales, procurement, and inventory data.
Evaluate product sales performance to formulate a sustainable inventory management approach.

## 1. Data Preprocessing:

- link for [dataset](https://www.kaggle.com/datasets/bhanupratapbiswas/inventory-analysis-case-study)
- Consolidate all CSV files into a unified master dataset.
- Screen for any missing or erroneous entries.
- Standardize date formats for consistent time series analysis.

## 2. Inventory Analysis:

- Assess inventory status at the year's start and end using BegInvFINAL12312016.csv and EndInvFINAL12312016.csv.
- Pinpoint products with the highest and lowest inventory presence.

**Insights:**

**Top Products:**

"Ketel One Vodka" emerged as the top product by the end of the year, even though it was in the 4th position at the beginning. This could imply an increased demand or higher restocking levels for this product during the year.
"Capt Morgan Spiced Rum", initially the highest in inventory at the start of the year, narrowly missed the top position by a single unit by the year's end.
"Smirnoff 80 Proof" seems to have undergone a brand update or rebranding, as the brand number changed from 3876 to 8111 during the year. Despite this, its popularity remained consistent.
"Absolut 80 Proof" held steady, only dropping one rank from the beginning to the end of the year.
A new entrant, "Jack Daniels No 7 Black", made its way into the top 5 by the end of the year, replacing "Maurice's Mentholated Mint" from the beginning of the year's list.

**Bottom Products:**

It's alarming to see products with zero inventory both at the beginning and the end of the year. It's possible that these items either never had stock during the entire year, or they had stock that was completely sold out and never replenished.
There isn't a significant overlap between the products in the bottom 5 of both lists, indicating that inventory for low-stock items could be fluctuating throughout the year.
The presence of wines and niche products among the bottom lists suggests that these might be specialty items with selective demand or limited supply.

**Inventory Management Observations:**

**The overall high consistency among the top products suggests steady demand and effective inventory replenishment strategies for popular items.**
However, **the consistent zero counts at both year start and end for certain products indicate potential issues in inventory management or procurement**. It may be worthwhile to review the demand for these products and determine if it makes business sense to continue carrying them or if there might be supply chain issues preventing their restocking.

## 3. Sales Analysis:

- Examine SalesFINAL12312016.csv to identify bestsellers and products with sluggish sales.
- Analyze sales trends over time, considering variables such as sales quantity, sales price, and date.

![image](https://github.com/SurajspatiL99/Sales-Inventory-and-Procurement-Analysis/assets/101862962/579d212b-e692-4692-84aa-0823c2026d24)

![image](https://github.com/SurajspatiL99/Sales-Inventory-and-Procurement-Analysis/assets/101862962/a131e6e3-fa2f-4dc5-b43c-c2d525be3562)

1. **There's a cyclical nature to the sales quantities, which might hint at weekly patterns or trends.**
2. **A significant peak is noticed around January 25th; this could be attributed to specific events, promotions, or even seasonal demands.** However, as we transition into February, there's a noticeable decline in sales, which then appears to stabilize as the month progresses.
3. **Spirits like "Smirnoff 80 Proof" emerge as the top sellers, reflecting a steady demand.** On the other hand, several products are moving slowly, indicating limited sales. As these products vary in type and brand, a strategic review might be necessary to decide on their continued stocking.

## 4. Purchasing Analysis:

- Evaluate procurement activities using PurchasesFINAL12312016.csv and InvoicePurchases12312016.csv.
- Investigate purchase volumes from different suppliers, procurement costs, and supply chain processes.

**Top Vendors by Purchase Cost:**

1. **DIAGEO NORTH AMERICA INC stands out as the top vendor with the highest purchase cost, amounting to 3,919,293.52 US dollars.**
2. The following two vendors, 'JIM BEAM BRANDS COMPANY' and 'PERNOD RICARD USA', have notable purchase costs of 2,445,075.37 and 2,002,210.70, respectively

![image](https://github.com/SurajspatiL99/Sales-Inventory-and-Procurement-Analysis/assets/101862962/c70bef81-1408-4b85-9b89-adb3806cd8d5)


3. **It's interesting to see that the top 10 vendors have a significant difference in their purchase costs, with 'DIAGEO NORTH AMERICA INC' nearly leading by a margin of 1.5 million usd from the vendor in the second position.**

![image](https://github.com/SurajspatiL99/Sales-Inventory-and-Procurement-Analysis/assets/101862962/79eb7468-807e-43be-a82f-adc9148485c2)

The bar chart illustrates the top 10 vendors by purchase cost. We observe that** "DIAGEO NORTH AMERICA INC" clearly dominates, with a significantly higher purchase cost compared to others. **The other vendors, like "JIM BEAM BRANDS COMPANY" and "PERNOD RICARD USA", have a more consistent distribution, showing a balanced spending across them.

Transitioning to the pie chart, which provides a distribution of purchase costs among top vendors, we get a more granular view. "DIAGEO NORTH AMERICA INC" accounts for 22.4% of the total purchase costs among the top vendors. The other vendors hold percentages ranging from 5.6% to 14%, indicating a more even distribution of costs among them.

In conclusion, while there's a dominant vendor in terms of purchase cost, the overall distribution among the top vendors is relatively even, with only a few outliers. This suggests a diversified vendor strategy, but with a few preferred partnerships.


**Supply and Payment Durations:**

1. **On average, it takes approximately 7 days for the supply process**, which indicates a relatively quick turnaround for receiving products after placing an order.
2. However, **the payment duration averages around 35 days.** This could mean that there might be longer credit terms agreed upon with the vendors or there might be some delay in the payment process.

![image](https://github.com/SurajspatiL99/Sales-Inventory-and-Procurement-Analysis/assets/101862962/ba89fb6a-32a1-49f6-92b4-59eb2eaa2836)

![image](https://github.com/SurajspatiL99/Sales-Inventory-and-Procurement-Analysis/assets/101862962/af56901a-f591-4c61-82de-a4fc3efbb872)

1. The regular intervals observed in the supply duration chart suggest that there might be specific supply cycles or replenishment schedules that are adhered to.
2. Peaks in the supply distribution, particularly around 4, 6, 8, 10, and 12 days, might indicate standard supply contract durations or preferred restocking periods.
3. **The oscillation in payment durations, especially between 25 to 45 days, suggests variability in the terms of payment or potential inconsistencies in payment execution.**


## 5. Optimal Stock Level Calculation:

- Determine the optimal stock level for each product by leveraging sales, procurement, and inventory data.
- Propose stock levels tailored to the sales velocity of products and supply lead times.

In an inventory management context, the Sales_Per_Day represents the average number of units sold per day, whereas the Max_Daily_Sales represents the highest number of units sold in a single day for a given product. Logically, the Max_Daily_Sales should never be lower than the Sales_Per_Day, as this would imply that the average daily sales are higher than the highest sales ever recorded for a single day, which is contradictory.

The occurrence of such a situation could be due to various reasons, including data entry errors, outliers, or computational errors. In our dataset, we observed that there were 555 products with this inconsistency.

To rectify this, we updated the Max_Daily_Sales value to be equal to the Sales_Per_Day value for these problematic products. This ensures that the Max_Daily_Sales is at least as large as the average daily sales, thereby maintaining logical consistency in the dataset.

![image](https://github.com/SurajspatiL99/Sales-Inventory-and-Procurement-Analysis/assets/101862962/381d37cd-2e70-4ae9-8933-c197774bfc52)

**The bar chart visually represents the recommended stock levels for the top 20 products. "Smirnoff 80 Proof" stands out as the product with the highest suggested stock level, indicating it has a high sales velocity and/or longer lead times. Conversely, products at the bottom of the chart like "Sambuca Romana Liqueur" have comparatively lower recommended stock levels. This visualization helps in quick decision-making regarding inventory replenishment and allocation.**


![image](https://github.com/SurajspatiL99/Sales-Inventory-and-Procurement-Analysis/assets/101862962/2592f182-3c19-4993-b97b-f0dd75cb1e6e)

**This bar chart showcases the daily sales velocity of various products. At a glance, it's evident that "Smirnoff 80 Proof" has the highest sales per day, significantly outpacing other products. As we move to the right of the chart, the sales per day for each product decreases, indicating a descending order of popularity or demand. The varying shades of color from dark to light also emphasize this declining trend in sales velocity. It provides valuable insights for inventory management, helping businesses prioritize which products to stock more frequently based on their sales rate.**

![image](https://github.com/SurajspatiL99/Sales-Inventory-and-Procurement-Analysis/assets/101862962/398d4178-dd6d-4ef7-bb6e-99ef0cc0fa4a)

The bar graph displays the top 10 products that need to be reordered based on inventory data. The products are sorted by the quantity that needs to be ordered, which is determined by the difference between the recommended stock levels and the current stock on hand. If the current stock is below the recommended level, the product appears on the list with the quantity to order represented on the x-axis.

From the graph, we can observe the following:

1. The product "Josh Cellars Cab Svgn Sonoma" has the highest quantity to reorder, approaching the 800-unit mark.
2. "Bacardi Superior Rum Trav" and "Jim Beam Traveler" follow next with slightly less quantity to order, both near or above the 600-unit mark.
3. Other products like "Baileys Espresso Creme" and "Sebastiani Znfdl Sonoma Cnty" are in the middle range with quantities to order around 400 units.
4. The product with the least quantity to reorder among the top 10 is "Serpent's Bite Cider Whiskey," which is just below the 200-unit mark.



![image](https://github.com/SurajspatiL99/Sales-Inventory-and-Procurement-Analysis/assets/101862962/bdedca2e-e718-4d4c-a022-488eb59786b2)

**This inventory review highlights a significant surplus in the current stock levels when compared with the recommended stock levels for the top 10 products, sorted by the recommended quantity. Notably, "Ketel One Vodka" and "Rumpleminze" showcase a pronounced excess beyond the suggested inventory, suggesting inefficiencies in stock management**. The presence of stock quantities exceeding recommended levels across all observed items may lead to higher carrying costs and risk of stock becoming outdated. Immediate measures such as revising purchase orders and aligning with sales projections are advised to mitigate the risks associated with overstocking and to optimize the stock turnover ratio.



![image](https://github.com/SurajspatiL99/Sales-Inventory-and-Procurement-Analysis/assets/101862962/a359def7-1f9d-467f-b18f-4bd7d0ec9d85)


**Current vs Recommended Stock Levels" shows that for all top-selling 10 products, the current stock (blue) is below the recommended stock levels (orange), indicating a need for restocking to meet the suggested inventory.**


# Conclusion:
The insights derived from these analyses will provide recommendations for managing inventory in a more efficient and sustainable manner, aiming to cut costs and prevent overstocking and waste.

**Top Products & Trends:**

- ** "Ketel One Vodka" soared from 4th to the top, hinting at surging demand.**
- "Capt Morgan Spiced Rum" finished a close second, just one unit behind.
- "Smirnoff 80 Proof" held its ground despite a rebranding, shifting from number 3876 to 8111.
- "Absolut 80 Proof" slightly dropped in rank, remaining strong.
- Newcomer "Jack Daniels No 7 Black" broke into the top 5.

** Inventory Challenges:**

- **Zero inventory items at year's start and end suggest stocking or demand issues.**
- Low-stock items show unpredictable inventory levels.
- Specialty items, like select wines, linger at the bottom, indicating niche demand.

**Inventory Management Insights:**

- Strong consistency in top products reflects solid demand forecasting and replenishment.
- Recurring zero stock levels could point to deeper inventory procurement flaws.
- Sales peaked notably on January 25th, then stabilized in February.
- **DIAGEO NORTH AMERICA INC dominated vendor purchases with $3.9 million**, significantly ahead of others.
- **Average supply duration is 7 days, but average payment stretches to 35 days.**

**Operational Data Points:**

- **Data corrections were made for 555 products to align Max_Daily_Sales with Sales_Per_Day.**
- "Smirnoff 80 Proof" leads the recommended stock levels.
- Majority of products have minimal safety stock, implying tight inventory control.
- **Lead times peak around 8 days.**
- Daily sales velocity shows "Smirnoff 80 Proof" far ahead, emphasizing its high demand.

**Stocking Strategies:**

- **"Josh Cellars Cab Svgn Sonoma" requires the most restocking, nearly 800 units.
- For the top ten products with the highest recommended stock levels, still current stock levels exceed recommended levels, hinting at overstocking and a need for inventory adjustment.**
- **There is a clear necessity to replenish the inventory for the most ordered 10 products to meet the recommended stock levels and ensure adequate supply to match demand.**
- In essence, top-selling spirits demonstrate strong market demand with effective inventory turns, while zero-stock items and niche products present opportunities for inventory optimization. A significant sales event occurs in late January, and the payment terms to vendors may require review. Inventory discrepancies are being addressed, and a focus on high-velocity products like "Smirnoff 80 Proof" is evident. The strategy includes refining restocking practices to avoid excess inventory and associated costs.
