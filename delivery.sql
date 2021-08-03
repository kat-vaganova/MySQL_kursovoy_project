 -- что предпочитают покупатели доставку или самовывоз?



select 
 type_of_delivery,
 count(1)
 from deliveries d 
 where 
 type_of_delivery = 'storehouses'
 union
 select 
 type_of_delivery,
 count(1)
 from deliveries d 
 where 
 type_of_delivery = 'courier';
 
