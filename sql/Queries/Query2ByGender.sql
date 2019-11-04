-- Show sales trends for various brands over the past 3 years, by year, buyer gender, and buyer income range. 

SELECT brandname, c.gender, COUNT(SaleId) AS SalesByYear
FROM Sale S 
LEFT JOIN vehicle  V ON S.vin = V.vin
LEFT JOIN customer C ON c.customerid = s.customerid
LEFT JOIN CarModel CM ON CM.modelid = v.modelid
LEFT JOIN brand B ON b.brandid = cm.brandid
WHERE SaleDate > ADD_MONTHS(SYSDATE, -(12 * 3))
GROUP BY brandname, c.gender
ORDER BY SalesByYear DESC
