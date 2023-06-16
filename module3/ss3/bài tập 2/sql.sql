-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order

use sales_manager;
select *
from older;
-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
select c.cName,p.pName 
from order_detail od
join older o on od.oID = o.oID
join product p on od.pID = p.pID
join customer c on o.cID = c.cID ;
-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
select cName
from order_detail od
join older o on od.oID = o.oID
right join customer c on o.cID = c.cID 
where cID is null;
