-- о скидках


-- найдем сумму каждого товара в заказе
drop view summa_tovara_v_zakaze; 
 
create view summa_tovara_v_zakaze as
(select 
 order_id, 
product_id,
(select id from products where id = product_id) as id_from_products, -- после удалить
total,
 (select price from products where id = product_id) as 'price',
 (select total * price where id = id) as summa_tovara
from 
order_products)
with check option;

 -- смотрим результат
select * from summa_tovara_v_zakaze;

 -- сопоставляем скидки сумме заказов поступивших от данного покупателя
drop view skidki;


create view skidki as
select
u.id as id,
 CONCAT_WS(' ', first_name, last_name) as 'name',
 sum(summa_tovara) as summa_zakazov,
 (select discount from discounts where discounts.user_id = u.id) as skidki
from 
users u
inner join
summa_tovara_v_zakaze s_t_z
on u.id = s_t_z.order_id
group by order_id;


select * from skidki;

-- скидки не у всех покупателей, внесем их полный список в таблицу

insert into 
discounts (user_id)
select id 
from users 
where id > 10;


select * from discounts d;

 --  в силу "нечестности" установления скидок назначаем новые в зависимости от накопленной суммы покупок

drop procedure gradatsiya_skidoc;


create procedure gradatsiya_skidoc ()
begin
 update discounts set discount = 3 where id in (select id from skidki where summa_zakazov < 25);
 update discounts set discount = 5 where id in(select id from skidki where summa_zakazov between 25 and 50);
 update discounts set discount = 7 where id in (select id from skidki where summa_zakazov between 50 and 75);
 update discounts set discount = 10 where id in (select id from skidki where summa_zakazov > 75);
end//

call gradatsiya_skidoc;

 -- просматриваем новые скидки 
  -- так:
select * from discounts;

 -- или вот так:
create view new_skidki as
select
 CONCAT_WS(' ', first_name, last_name) as 'name',
 s.summa_zakazov,
 (select discount from discounts where discounts.user_id = u.id) as new_discount
from 
users u
inner join
skidki s
on u.id = s.id
with check option;

select * from new_skidki;



 -- полюборпытствуем насколько мы щедры - подсчитаем количество покупателей в каждой "скидочной"группе (group_by)

select
group_CONCAt(' ', first_name, last_name) as 'name',
 (select discount from discounts where discounts.user_id = u.id) as skidki,
 count(1)
from 
users u
group by skidki
with rollup;

