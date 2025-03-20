-- Retrieve the current system date.
-- SELECT SYSDATE FROM DUAL
-- SELECT CURRENT_DATE FROM DUAL

-- Retrieve the current timestamp including fractional seconds.
-- SELECT CURRENT_TIMESTAMP FROM DUAL

-- Get the database time zone.
-- SELECT DBTIMEZONE FROM DUAL

-- Get the session time zone.


-- Find the next week’s date from SYSDATE.
-- SELECT SYSDATE+7 AS NEXTWEEK_DATE FROM DUAL

-- Subtract 17 days from SYSDATE.
-- SELECT SYSDATE-17 AS 17DAYSBACK FROM DUAL

-- Retrieve the TIME_ID and calculate TIME_ID + 7 for all sales transactions.
-- SELECT TIME_ID,TIME_ID+7 AS AWEEKADDED FROM SH.TIMES

-- Add 2 hours to the SYSTIMESTAMP.
-- SELECT SYSTIMESTAMP,SYSTIMESTAMP+INTERVAL '2' HOUR FROM DUAL

-- Add 2 minutes to the SYSTIMESTAMP.
-- SELECT SYSTIMESTAMP,SYSTIMESTAMP+INTERVAL '2' MINUTE FROM DUAL

-- Add 2 seconds to the SYSTIMESTAMP.
-- SELECT SYSTIMESTAMP,SYSTIMESTAMP+INTERVAL '2' SECOND FROM DUAL

-- Add 2 years to the SYSTIMESTAMP.
-- SELECT SYSTIMESTAMP,SYSTIMESTAMP+INTERVAL '2' YEAR FROM DUAL

-- Add 2 months to the SYSTIMESTAMP.
-- SELECT SYSTIMESTAMP,SYSTIMESTAMP+INTERVAL '2' MONTH FROM DUAL

-- Add 2 days and 4 hours to SYSTIMESTAMP.
-- SELECT SYSTIMESTAMP,SYSTIMESTAMP+INTERVAL '2' DAY+INTERVAL '4' HOUR FROM DUAL


-- Extract year, month, and day from the TIME_ID column.
-- SELECT TIME_ID ,EXTRACT(YEAR FROM TIME_ID) YEAR ,
-- EXTRACT(MONTH FROM TIME_ID) MONTH ,
-- EXTRACT(DAY FROM TIME_ID) DAY FROM SH.TIMES

-- Find the last day of the month for each TIME_ID.
-- SELECT TIME_ID, LAST_DAY(TIME_ID) AS LAST_DAY_OF_MONTH FROM SH.TIMES

-- Retrieve all records from the sales.sh table.
-- SELECT * FROM SH.SALES

-- Get the total number of sales transactions recorded.
-- SELECT COUNT(*) FROM SH.SALES

-- Retrieve unique product IDs from the sales.sh table.
-- SELECT DISTINCT PROD_ID FROM SH.SALES


-- Get all sales details where the quantity sold is more than 5.
-- SELECT * FROM SH.SALES WHERE QUANTITY_SOLD > 5

-- Find the total revenue by multiplying price and quantity for all sales.
-- SELECT SUM(QUANTITY_SOLD * AMOUNT_SOLD) AS TOTAL_REVENUE FROM SH.SALES

-- Find the average sale amount per transaction.
-- SELECT AVG(QUANTITY_SOLD * AMOUNT_SOLD) AS AVG_SALE FROM SH.SALES

-- Retrieve the top 5 highest sales transactions by amount.
-- SELECT PROD_ID, SUM(QUANTITY_SOLD * AMOUNT_SOLD) AS TOTAL_SALE
-- FROM SH.SALES GROUP BY PROD_ID
-- ORDER BY TOTAL_SALE DESC
-- FETCH FIRST 5 ROWS ONLY

-- Retrieve all sales made for a specific product ID (P1001).
-- SELECT PROD_ID FROM SH.SALES
-- WHERE TO_CHAR(PROD_ID) = 'P1001'

-- Count the number of transactions per product.
-- SELECT PROD_ID, COUNT(QUANTITY_SOLD) AS TRANSACTION_MADE 
-- FROM SH.SALES GROUP BY PROD_ID

-- Find the total number of unique customers who made purchases.
-- SELECT COUNT(DISTINCT CUST_ID) AS UNIQUE_CUSTOMER FROM SH.SALES

-- Time Functions
-- Retrieve all sales transactions that occurred in the last 30 days.
-- SELECT * FROM SH.SALES WHERE TIME_ID >= SYSDATE-30

-- Extract the year from the sales date column.
-- SELECT TIME_ID ,EXTRACT(YEAR FROM TIME_ID) YEAR FROM SH.SALES

-- Extract the month from the sales date column.
-- SELECT TIME_ID ,EXTRACT(MONTH FROM TIME_ID) MONTH FROM SH.SALES

-- Find the total sales for each month.
-- SELECT TO_CHAR(TIME_ID, 'YYYY-MM') AS MONTH,
-- SUM(QUANTITY_SOLD * AMOUNT_SOLD) AS TOTAL_SALE
-- FROM SH.SALES GROUP BY TO_CHAR(TIME_ID, 'YYYY-MM') ORDER BY MONTH

-- Retrieve sales records for transactions that occurred on weekends.
-- SELECT * FROM SH.SALES
-- WHERE TO_CHAR(TIME_ID, 'D') IN ('1', '7')

-- Find the first and last recorded sales transaction dates.
-- SELECT MIN(TIME_ID) AS FIRST_DAY,
-- MAX(TIME_ID) AS LAST_DAY FROM SH.SALES

-- Retrieve sales transactions that happened on a specific date ('2024-03-01').
-- SELECT * FROM SH.SALES
-- WHERE TIME_ID = TO_DATE('2024-03-01', 'YYYY-MM-DD')

-- Count the number of sales transactions that happened in the last 7 days.
-- SELECT COUNT(*) AS SALES_COUNT FROM SH.SALES
-- WHERE TIME_ID >= SYSDATE - 7

-- Retrieve sales that occurred during a specific time range (09:00 AM - 12:00 PM).
-- SELECT * FROM SH.SALES
-- WHERE TO_CHAR(TIME_ID, 'HH24:MI') BETWEEN '09:00' AND '12:00'

-- Get the difference in days between the first and the last transaction in the table.
-- SELECT MAX(TIME_ID) - MIN(TIME_ID) AS DAYS_DIFF FROM SH.SALES