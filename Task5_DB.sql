create table q3_q4_review(
purchase_date date,
total_price numeric(10,2),
promo_code varchar(50),
sales_after_promo numeric(10,2)
)
SELECT * FROM q3_q4_review;

SELECT * FROM sales_table WHERE purchase_date BETWEEN '2022-07-01' AND '2022-12-31';

SELECT * FROM marketplace_table;

SELECT * FROM sales_table INNER JOIN marketplace_table USING(item_id)
WHERE purchase_date BETWEEN '2022-07-01' AND '2022-12-31'
ORDER BY purchase_date ASC;

SELECT * FROM sales_table INNER JOIN promo_code USING(promo_id)
WHERE purchase_date BETWEEN '2022-07-01' AND '2022-12-31'
ORDER BY purchase_date ASC;

SELECT sales_table.sales_id, sales_table.purchase_date, sales_table.quantity, marketplace_table.price, (quantity*price) AS total_price
FROM sales_table
INNER JOIN marketplace_table ON sales_table.item_id=marketplace_table.item_id
WHERE purchase_date BETWEEN '2022-07-01' AND '2022-12-31'
ORDER BY purchase_date ASC;

SELECT sales_table.purchase_date, (quantity*price) AS total_price, promo_code.promo_name AS promo_code, ((quantity*price)-promo_code.price_deduction) AS sales_after_promo
FROM ((sales_table
INNER JOIN marketplace_table ON sales_table.item_id=marketplace_table.item_id)
INNER JOIN promo_code ON sales_table.promo_id=promo_code.promo_id)
WHERE purchase_date BETWEEN '2022-07-01' AND '2022-12-31'
ORDER BY purchase_date ASC;

SELECT sales_table.purchase_date, (quantity*price) AS total_price, promo_code.promo_name AS promo_code, ((quantity*price)-promo_code.price_deduction) AS sales_after_promo
FROM ((sales_table
INNER JOIN marketplace_table ON sales_table.item_id=marketplace_table.item_id)
LEFT JOIN promo_code ON sales_table.promo_id=promo_code.promo_id)
WHERE purchase_date BETWEEN '2022-07-01' AND '2022-12-31'
ORDER BY purchase_date ASC;

SELECT * FROM shipping_summary

SELECT * FROM marketplace_table

SELECT * FROM shipping_table INNER JOIN seller_table USING(seller_id)
WHERE purchase_date BETWEEN '2022-12-02' AND '2022-12-31'
ORDER BY purchase_date ASC;

SELECT * FROM shipping_table INNER JOIN buyer_table USING(buyer_id)
WHERE purchase_date BETWEEN '2022-12-02' AND '2022-12-31'
ORDER BY purchase_date ASC;

SELECT shipping_table.shipping_date, seller_table.seller_name, buyer_table.buyer_name, buyer_table.address,
buyer_table.city, buyer_table.zipcode
FROM ((shipping_table
INNER JOIN seller_table ON shipping_table.seller_id = seller_table.seller_id)
INNER JOIN buyer_table ON shipping_table.buyer_id = buyer_table.buyer_id)
WHERE purchase_date BETWEEN '2022-07-01' AND '2022-12-31'
ORDER BY purchase_date ASC;



SELECT shipping_table.shipping_date, seller_table.seller_name, buyer_table.buyer_name, 
buyer_table.address, buyer_table.city, buyer_table.zipcode, 
shipping_id || '-' || TO_CHAR(purchase_date, 'YYMMDD') || '-' || TO_CHAR(shipping_date, 'YYMMDD') || '-' || buyer_table.buyer_id || '-' || seller_table.seller_id 
AS kode_resi
FROM ((shipping_table
INNER JOIN seller_table ON shipping_table.seller_id = seller_table.seller_id)
INNER JOIN buyer_table ON shipping_table.buyer_id = buyer_table.buyer_id)
WHERE purchase_date BETWEEN '2022-07-01' AND '2022-12-31'
ORDER BY purchase_date ASC;