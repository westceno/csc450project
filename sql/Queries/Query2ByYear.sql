SELECT brandname, EXTRACT(year FROM SaleDate) AS sales, COUNT(SaleId) AS SalesByYear
FROM Sale S 
LEFT JOIN vehicle  V ON S.vin = V.vin
LEFT JOIN customer C ON c.customerid = s.customerid
LEFT JOIN CarModel CM ON CM.modelid = v.modelid
LEFT JOIN brand B ON b.brandid = cm.brandid
WHERE SaleDate > ADD_MONTHS(SYSDATE, -(12 * 3))
GROUP BY brandname, EXTRACT(year FROM SaleDate)
ORDER BY SalesByYear DESC