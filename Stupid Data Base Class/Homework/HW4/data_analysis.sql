SELECT * FROM ecommercedb.item; 
SELECT * FROM ecommercedb.itemprice; 
SELECT * FROM ecommercedb.orderheader; 


SELECT COUNT(*) FROM ecommercedb.orderheader;
SELECT COUNT(*) FROM ecommercedb.customertable;

-- total number of customers that have placed an order;
SELECT COUNT(*) FROM ecommercedb.customertable WHERE CustomerID 
	IN (SELECT CustomerTable_CustomerID FROM ecommercedb.orderheader); 

-- unique zipcodes

SELECT DISTINCT Zip FROM ecommercedb.address;

-- ten most frequent items
SELECT * FROM (
	SELECT ol.Item_ItemNumber
		,COUNT(*) as SaleFrequency
        , SUM(Quantity) as SaleQuantity
        , SUM(Quantity * PricePerQty) as SaleValue
        , SUM(Quantity * PricePerQty)/SUM(Quantity) as SalePricePerUnit
        , SUM(Quantity * ip.SalePrice) as Cost
        , SUM(Quantity * ip.SalePrice)/SUM(Quantity) as CostPerUnit 
        , SUM(Quantity * (ol.PricePerQty - ip.SalePrice)) as Profit 
	FROM ecommercedb.orderline ol
    LEFT JOIN ecommercedb.itemprice ip ON ip.Item_ItemNumber = ol.Item_ItemNumber
    GROUP BY ol.Item_ItemNumber
ORDER BY SUM(Quantity * PricePerQty) DESC) as temp LIMIT 10;

