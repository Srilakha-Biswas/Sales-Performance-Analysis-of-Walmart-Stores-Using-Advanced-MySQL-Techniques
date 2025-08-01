SELECT * FROM siri.`walmartsales dataset - walmartsales`;
select `Product line`,`Customer type`,sum(total) as `Total Sales` ,count(`Product line`) from siri.`walmartsales dataset - walmartsales`
group by `Customer type`,`Product line`
Order by `Customer type`,sum(total)desc;