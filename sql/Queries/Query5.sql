-- Find the top brand(s) by unit sales in the past year.

SELECT b.brandname, salecount.sale_count
FROM (
	SELECT b.brandid, count(*) AS sale_count
	FROM sale s
	INNER JOIN Vehicle v ON s.vin = v.vin
	INNER JOIN carModel m ON v.modelid = m.modelid
	INNER JOIN Brand b ON m.brandid=b.brandid
	WHERE saledate > '01 Nov 2018'
	GROUP BY b.brandid
) salecount
INNER JOIN Brand b ON salecount.brandid=b.brandid
ORDER BY sale_count DESC;
