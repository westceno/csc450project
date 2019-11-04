-- Find the dealer(s) who keeps a vehicle in inventory for the longest average time.

SELECT t.dealername, averagetime
FROM
(SELECT dealername, AVG(SaleDate  - ProductionDate) AS averagetime
FROM sale S Left JOIN vehicle V ON S.VIN = V.VIN LEFT JOIN dealer D ON d.dealerid = s.dealerid 
GROUP BY dealername
ORDER BY averagetime DESC)t
INNER JOIN
(SELECT *
FROM 
( SELECT dealername, AVG(SaleDate  - ProductionDate) AS Maxaveragetime
FROM sale S Left JOIN vehicle V ON S.VIN = V.VIN LEFT JOIN dealer D ON d.dealerid = s.dealerid 
GROUP BY dealername
ORDER BY Maxaveragetime DESC
) WHERE ROWNUM = 1) 
ON averagetime = maxaveragetime
