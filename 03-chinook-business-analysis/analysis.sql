-- 1. total revenue
select round(sum(Total), 2) as "Total Revenue" from Invoice;

-- 2. total customers
select count(*) as "Total Customers" from Customer;

-- 3. total orders
select count(*) as "Total Orders" from Invoice;

-- 4. average order value
select round(avg(Total), 2) as "Average Order Value" from Invoice;

-- 5. average spending per customer
select round(sum(i.Total) * 1.0 / count(distinct i.CustomerId), 2) as "Average Spending Per Customer" from Invoice i;

-- 6. top 10 customers by spending
select c.CustomerId, c.FirstName || ' ' || c.LastName as "Customer Name",round(sum(i.Total), 2) as "Total Spent" from Customer c
join Invoice i on c.CustomerId = i.CustomerId
group by c.CustomerId
order by "Total Spent" desc
limit 10;

-- 7. revenue by country
select BillingCountry, round(sum(Total), 2) as "Revenue" from Invoice
group by BillingCountry
order by "Revenue" desc;

-- 8. customer count by country
select Country, count(*) as "Customer Count" from Customer
group by Country
order by "Customer Count" desc;

-- 9. top-selling genres
select g.Name as "Genre", sum(il.Quantity) as "Units Sold", round(sum(il.UnitPrice * il.Quantity), 2) as "Revenue" from InvoiceLine il
join Track t on il.TrackId = t.TrackId
join Genre g on t.GenreId = g.GenreId
group by g.Name
order by "Revenue" desc;

-- 10. top-selling artists
select ar.Name as "Artist", sum(il.Quantity) as "Units Sold", round(sum(il.UnitPrice * il.Quantity), 2) as "Revenue" from InvoiceLine il
join Track t on il.TrackId = t.TrackId
join Album al on t.AlbumId = al.AlbumId
join Artist ar on al.ArtistId = ar.ArtistId
group by ar.Name
order by "Revenue" desc
limit 10;

-- 11. top-selling tracks
select t.Name as "Track Name", sum(il.Quantity) as "Units Sold", round(sum(il.UnitPrice * il.Quantity), 2) as "Revenue" from InvoiceLine il
join Track t on il.TrackId = t.TrackId
group by t.Name
order by "Units Sold" desc
limit 10;

-- 12. revenue by year
select strftime('%Y', InvoiceDate) as "Year", round(sum(Total), 2) as "Revenue" from Invoice
group by "Year"
order by "Year";

-- 13. revenue by month
select strftime('%Y-%m', InvoiceDate) as "Month", round(sum(Total), 2) as "Revenue" from Invoice
group by "Month"
order by "Month";

-- 14. monthly sales growth (uses cte + window function)
with MonthlyRevenue as (
    select strftime('%Y-%m', InvoiceDate) as "Month", sum(Total) as "Revenue"
    from Invoice
    group by "Month"
)

select "Month", round("Revenue", 2) as "Revenue",
       round("Revenue" - lag("Revenue") over (order by "Month"), 2) as "Change from Previous Month",
       round((("Revenue" - lag("Revenue") over (order by "Month")) * 100.0) /
             lag("Revenue") over (order by "Month"), 2) as "Growth Percentage"
from MonthlyRevenue
order by "Month";

-- 15. highest-performing country
select BillingCountry, round(sum(Total), 2) as "Revenue" from Invoice
group by BillingCountry
order by "Revenue" desc
limit 1;

-- 16. highest-performing month
select strftime('%Y-%m', InvoiceDate) as "Month", round(sum(Total), 2) as "Revenue" from Invoice
group by "Month"
order by "Revenue" desc
limit 1;

-- 17. highest-performing artist
select ar.Name as "Artist", round(sum(il.UnitPrice * il.Quantity), 2) as "Revenue" from InvoiceLine il
join Track t on il.TrackId = t.TrackId
join Album al on t.AlbumId = al.AlbumId
join Artist ar on al.ArtistId = ar.ArtistId
group by ar.Name
order by "Revenue" desc
limit 1;

-- 18. customers with highest purchase frequency
select c.CustomerId, c.FirstName || ' ' || c.LastName as "Customer Name", count(i.InvoiceId) as "Purchase Count" from Customer c
join Invoice i on c.CustomerId = i.CustomerId
group by c.CustomerId
order by "Purchase Count" desc
limit 10;

-- 19. revenue contribution of top customers (uses subquery)
with CustomerRevenue as (
    select c.CustomerId, c.FirstName || ' ' || c.LastName as "Customer Name", sum(i.Total) as "Total Spent" from Customer c
    join Invoice i on c.CustomerId = i.CustomerId
    group by c.CustomerId
)

select "Customer Name", round("Total Spent", 2) as "Total Spent", round("Total Spent" * 100.0 / (select sum(Total) from Invoice), 2) as "Percentage of Total Revenue"
from CustomerRevenue
order by "Total Spent" desc
limit 10;

-- 20. high, medium and low-value customer segments (uses case)
with CustomerRevenue as (
    select c.CustomerId, c.FirstName || ' ' || c.LastName as "Customer Name", sum(i.Total) as "Total Spent"
    from Customer c
    join Invoice i on c.CustomerId = i.CustomerId
    group by c.CustomerId
)

select "Customer Name", round("Total Spent", 2) as "Total Spent",
       case
           when "Total Spent" >= 40 then 'High-Value'
           when "Total Spent" >= 20 then 'Medium-Value'
           else 'Low-Value'
       end as "Segment"
from CustomerRevenue
order by "Total Spent" desc;