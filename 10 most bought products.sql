 -- предпочтения покупателей (10 самых покупаемых товаров)
 
 SELECT 
  pr.name as product,
 sum(o_p.total) as count
 -- comment 'количество купленного товара'
  FROM 
  products pr
 inner join
 order_products o_p
 on 
pr.id=o_p.product_id
group by pr.name
order by count DESC 
limit 10;
 