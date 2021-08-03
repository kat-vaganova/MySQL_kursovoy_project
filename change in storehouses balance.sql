
 -- при новом заказе изменяется остаток на складе
 -- если товара не достаточно то выводится ошибка

 -- 1. отобразили складские остатки по средством представления

create view reserve as
SELECT 
st.name as storehouses,
pr.id as products_id,
pr.name as products,
st_pr.value as balance
from 
storehouses st
inner join
storehouses_products st_pr
inner join
products pr
 on
 st.id = st_pr.storehous_id
 and
 st_pr.product_id = pr.id
with check option;

 -- просмотр получившегося проедставления
select * from reserve;


 -- 2. если количество товаров в заказе меньше остатка на складе выводим ошибку 

delimiter //


create trigger  orders_tigger  before insert on order_products
         for each row
          begin
	      if new.total >  (select  value from storehouses_products 
 where product_id = @product)
          then  
          signal sqlstate '45000'
          set message_text = 'Недостает товара на складе, закажите поменьше!';
          end if;
         end//
         
create trigger  orders_tigger  before update on order_products
         for each row
          begin
	      if new.total >  (select  value from storehouses_products 
 where product_id = @product)
          then  
          signal sqlstate '45000'
          set message_text = 'Недостает товара на складе, закажите поменьше!';
          end if;
         end//

delimiter ;



 --  3 оформляем новый заказ и забираем товар со склада
 
  start transaction;
 
 -- так как в данном случае (случае тестирования) нам неважно какой покупатель, что купил и сколько то
  --  вводим переменные и сгенерированные ими данные используем для заказа и для склада.
 select  @product := floor(rand()*(60-1)+1);  -- product_id приобретенного продукта в заказе order_products и на складе storehouses_products
 select  @total := floor(rand()*(10-1)+1); -- количество покупаемого товара калонка total в таблице order_products
 
 -- оформляем заказ
 -- задаем покупателя и номер заказа
   insert into orders (id, user_id)
   values (85, floor(rand()*(20-1)+1));
 
  -- выбираем товар и его количесево
 insert into order_products (order_id, product_id, total)
 values (85, @product, @total);

 -- в случае изменения заказа
update order_products
set
order_id = 85,
product_id = @product,
total = @total
where id = 200;

 -- забираем товары со склада

update storehouses_products
set
value = value - @total
where product_id = @product;

-- проверяем остатки
select product_id, value from storehouses_products 
 where product_id = @product;

 
 commit;

  -- проверяем остаток товара в ранее созданном представлении 
select * from reserve where products_id = @product ;




