SELECT brandname, COUNT(SaleId) AS SalesByYear
FROM Sale S 
LEFT JOIN vehicle  V ON S.vin = V.vin
LEFT JOIN customer C ON c.customerid = s.customerid
LEFT JOIN CarModel CM ON CM.modelid = v.modelid
LEFT JOIN brand B ON b.brandid = cm.brandid
WHERE SaleDate > ADD_MONTHS(SYSDATE, -(12 * 3)) 
AND c.income > 2000 AND c.income < 70000
GROUP BY brandname
ORDER BY SalesByYear DESC
