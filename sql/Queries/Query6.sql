-- In what month(s) do convertibles sell best?

SELECT t.Month, t.sales
FROM
(SELECT EXTRACT(MONTH FROM s.saledate) AS Month, COUNT(SaleId) sales
FROM BodyStyle BS 
LEFT JOIN CarModel CM ON bs.styleid = cm.bodystyleid
LEFT JOIN Vehicle V ON V.ModelId = cm.modelid
LEFT JOIN Sale S ON V.VIN = S.VIN
WHERE stylename = 'Convertible' AND EXTRACT(MONTH FROM s.saledate) IS NOT  NULL 
GROUP BY StyleName, EXTRACT(MONTH FROM s.saledate)
ORDER BY sales DESC) t
INNER JOIN
(SELECT *
FROM 
( SELECT EXTRACT(MONTH FROM s.saledate) AS Month, COUNT(SaleId) Maxsales
FROM BodyStyle BS 
LEFT JOIN CarModel CM ON bs.styleid = cm.bodystyleid
LEFT JOIN Vehicle V ON V.ModelId = cm.modelid
LEFT JOIN Sale S ON V.VIN = S.VIN
WHERE stylename = 'Convertible' AND EXTRACT(MONTH FROM s.saledate) IS NOT  NULL 
GROUP BY StyleName, EXTRACT(MONTH FROM s.saledate)
ORDER BY Maxsales DESC
) WHERE ROWNUM = 1) 
ON sales = Maxsales
