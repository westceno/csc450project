-- Suppose that it is found that manual transmission systems produced between two given dates are defective. 
-- Find the VIN of each car containing such a transmission and the customer to which it was sold; 
-- the vehicle production date should be in the interval when the defective transmissions were produced. 

SELECT VIN 
FROM Vehicle NATURAL JOIN Transmission
WHERE productiondate > '23-JUN-93' AND productiondate < '30-JUN-99'
