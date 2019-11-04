-- Find the top dealer(s) by dollar-amount sold in the past year.

SELECT t.dealername, t.sales
FROM ( SELECT dealername, SUM(SalePrice) AS sales
FROM (sale S 
LEFT JOIN vehicle V ON S.VIN = V.VIN 
LEFT JOIN CARModel CM ON cm.modelid = v.modelid
LEFT JOIN dealer D ON v.dealerid = d.dealerid)
GROUP BY dealername) t INNER JOIN 
(SELECT *
FROM 
( SELECT dealername, SUM(SalePrice) AS Maxsales
FROM (sale S 
LEFT JOIN vehicle V ON S.VIN = V.VIN 
LEFT JOIN CARModel CM ON cm.modelid = v.modelid
LEFT JOIN dealer D ON v.dealerid = d.dealerid)
GROUP BY dealername
ORDER BY Maxsales DESC 
) WHERE ROWNUM = 1) 
ON t.sales = maxsales
