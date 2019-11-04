SELECT VIN 
FROM Vehicle NATURAL JOIN Transmission
WHERE productiondate > '23-JUN-93' AND productiondate < '30-JUN-99'