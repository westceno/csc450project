SELECT t.brandName, sales
FROM ( SELECT brandNAME, SUM(SalePrice) AS sales
FROM (sale S 
LEFT JOIN vehicle V ON S.VIN = V.VIN 
LEFT JOIN CARModel CM ON cm.modelid = v.modelid  
LEFT JOIN brand B ON b.brandid = cm.brandid)
GROUP BY brandName) t INNER JOIN 
(SELECT *
FROM 
( SELECT brandNAME, SUM(SalePrice) AS maxsales
FROM (sale S 
LEFT JOIN vehicle V ON S.VIN = V.VIN 
LEFT JOIN CARModel CM ON cm.modelid = v.modelid  
LEFT JOIN brand B ON b.brandid = cm.brandid)
GROUP BY brandName
ORDER BY maxsales DESC 
) WHERE ROWNUM = 1) 
ON sales = maxsales