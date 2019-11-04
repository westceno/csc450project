SELECT *
FROM
(SELECT brandNAME, COUNT(SalePrice) AS unitsales
FROM sale NATURAL JOIN vehicle NATURAL JOIN (CARModel NATURAL JOIN brand)
GROUP BY brandNAME
ORDER BY unitsales DESC)
INNER JOIN
(SELECT *
FROM 
( SELECT brandNAME, COUNT(SalePrice) AS maxunitsales
FROM sale NATURAL JOIN vehicle NATURAL JOIN (CARModel NATURAL JOIN brand)
GROUP BY brandNAME
ORDER BY maxunitsales DESC 
) WHERE ROWNUM = 1) 
ON unitsales = maxunitsales