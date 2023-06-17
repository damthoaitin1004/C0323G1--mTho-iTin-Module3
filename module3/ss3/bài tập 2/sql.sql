-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
use sales_manager;
select *
from older;
-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
select c.customer_name,p.product_name 
from order_detail od
join older o on od.order_id = o.order_id
join product p on od.product_id = p.product_id
join customer c on o.customer_id = c.customer_id ;
-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
select c.customer_name
from order_detail od
join older o on od.order_id = o.order_id
right join customer c on o.customer_id = c.customer_id 
where o.customer_id is null;
select   o.order_id, older_date,p.product_price * od.order_qty AS 'total price'
from order_detail od
join  older o on od.order_id = o.order_id
join  product p on od.product_id = p.product_id ; 
