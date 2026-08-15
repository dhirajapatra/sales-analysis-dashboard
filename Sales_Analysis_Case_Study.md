# Superstore Sales Analysis — Case Study

## What was the problem?
Just because a business makes a lot of sales doesn't mean it's making a lot of profit. This project looks at Superstore's sales data to find out which areas of the business (regions, products, customer types) are actually making money — and which ones are quietly losing money, even if their sales look fine.

**Goal:** Find out where the business is doing well, where it's struggling, and suggest what to do about it.

## How I did it
1. Loaded the sales data (Orders, Returns, and People info) into SQL Server.
2. Checked the data for errors — made sure the numbers matched the original file, and found one row with a missing profit value, which I noted and excluded.
3. Wrote SQL queries to dig into sales and profit by region, product type, month, customer, and customer segment.
4. Built an interactive dashboard in Power BI so the results are easy to explore visually.
5. Double-checked that the dashboard numbers matched what I found in SQL.

## What I found

**1. The Central region makes the least profit.**
Even though it has decent sales, Central earns less profit than the other regions. This is worth looking into — it could be pricing, too many discounts, or higher costs in that area.

**2. "Tables" is the only product type actually losing money — and discounts aren't the main reason.**
Another product, Machines, gets discounted even more than Tables but still makes good profit. So why does Tables lose money? Because Tables are a cheaper product to begin with. When a product is already low-priced, costs like discounts, shipping, and handling eat up a much bigger chunk of the sale — sometimes more than the sale is even worth. That's why Tables ends up in the red, even without huge discounts.

**3. Sales are highest in December.**
This lines up with holiday shopping. It's useful for planning — the business should make sure it has enough stock and staff ready before December.

**4. Return rates are about the same for every product type (around 8%).**
No single category has a returns problem — returns seem to happen at a similar, steady rate everywhere.

**5. Home Office customers are the most profitable customer group.**
They might not be the biggest spenders, but the business earns more profit per sale from them compared to regular Consumers or Corporate clients. This makes Home Office a group worth paying more attention to.

## What I'd recommend
- **Look closely at the Tables product line.** Since the problem is low margin (not just discounting), simply reducing discounts won't fully fix it — the business may need to raise prices slightly, lower shipping/handling costs, or bundle it with other products.
- **Find out why the Central region underperforms.** Compare it to better-performing regions to see what's different — pricing, costs, or product mix.
- **Prepare for the December rush.** Stock up and staff up ahead of the holiday season since that's consistently the busiest month.
- **Invest more in Home Office customers.** Since they're the most profitable group, marketing more toward them could grow profit faster than chasing more total sales.

## Tools used
SQL Server (for analyzing the data) · Power BI (for the interactive dashboard) · Excel (for an initial summary and pivot tables)

## Files
- Power BI dashboard: *[add screenshot or link here]*
- SQL queries: `sales_analysis_queries.sql`
- Excel workbook: `Sample_dataset.xlsm`
