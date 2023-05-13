 INSERT INTO material(material_id, material_name, unit, price)
 values (1, 'Cát Vàng', 'm2', 200),
        (2, 'Đá 1x2', 'm2', 300),
        (3, 'Cát Đen', 'm2', 100),
        (4, 'Xi Măng', 'Bao', 100),
        (5, 'Sắt', 'Cây', 20);

 INSERT INTO inventory(inventory_id, material_id, quantity, total_input_quantity, total_export_quantity)
 VALUES (1, 5, 10, 50, 30),
      (2, 4, 50, 50, 30),
        (3, 3, 20, 40, 20),
       (4, 2, 30, 30, 10),
        (5, 1, 40, 60, 20);

 INSERT INTO supplier(supplier_id, supplier_code, supplier_name, address_supplier, number_phone_supplier)
 VALUES (1, '1#2', 'Hung', 'Ha noi', '123'),
        (2, '1#3', 'Nam', 'Ha noi', '124'),
        (3, '1#4', 'Chung', 'Nam Dinh', '125');

 INSERT INTO oder(oder_id, oder_code, oder_day, supplier_id)
 VALUES (1, '1@2', '2023-5-13', 3),
        (2, '1@3', '2023-5-14', 2),
        (3, '1@4', '2023-5-15', 1);

INSERT INTO import_coupon(import_coupon_id, import_coupon_code, import_coupon_day, oder_id)
 VALUES (1, '1$2', '2023-4-13', 1),
        (2, '1$3', '2023-4-12', 2),
        (3, '1$4', '2023-4-14', 3);

 INSERT INTO shipment_voucher (Shipment_Voucher_id, Shipment_Voucher_code, Shipment_Voucher_day, Client_Name)
 VALUES (1, '1%2', '2023-5-20', 'Dung'),
        (2, '1%1', '2023-5-21', 'Cong'),
        (3, '1%3', '2023-5-22', 'Dung');

 INSERT INTO order_details(order_details_id, oder_id, material_id, order_quantity)
 VALUES (1, 3, 5, 60),
        (2, 2, 4, 50),
        (3, 2, 2, 40),
        (4, 1, 2, 30),
        (5, 1, 1, 20),
        (6, 1, 1, 10);

 INSERT INTO import_coupon_details(import_coupon_details_id, import_coupon_id, material_id, import_quantity,
                                   import_unit_price, note)
 VALUES (1, 2, 5, 20, 30, 'Hang ok'),
        (2, 3, 3, 10, 40, 'Hang ok'),
        (3, 1, 3, 40, 50, 'Hang ok'),
        (4, 2, 2, 30, 60, 'Hang ok'),
        (5, 3, 1, 10, 20, 'Hang ok'),
        (6, 1, 2, 20, 10, 'Hang ok');

 INSERT INTO shipment_voucher_details(shipment_voucher_details_id, shipment_voucher_id, material_id, output_quantity,
                                      output_unit_price, note)
 VALUES (1, 3, 1, 10, 20, 'ok'),
        (2, 2, 2, 10, 50, 'ok'),
        (3, 1, 2, 10, 40, 'ok'),
       (4, 2, 3, 10, 30, 'ok'),
       (5, 2, 4, 10, 20, 'ok'),
        (6, 3, 1, 10, 10, 'ok');
alter table material add column Material_code varchar(255);

create view vw_CTPNHAP as
select Import_Coupon_Details_id,
       import_coupon.Import_coupon_id,
       material.Material_code,
       Import_Quantity,
       Import_unit_price,
       Import_Quantity * Import_unit_price as 'Import Into money'
From import_coupon_details
         join import_coupon on import_coupon.Import_coupon_id = import_coupon_details.Import_Coupon_id
         join material on import_coupon_details.Material_id = material.Material_id
order by Import_Coupon_Details_id,
       import_coupon.Import_coupon_id,
       material.Material_code,
       Import_Quantity,
       Import_unit_price asc;

select *
from vw_CTPNHAP;

drop view vw_CTPNHAP;

create view vw_CTPNHAP_VT as
select Import_Coupon_Details_id,
       import_coupon.Import_coupon_id,
       material.Material_code,
       material.Material_name,
       Import_Quantity,
       Import_unit_price,
       Import_Quantity * Import_unit_price as 'Import Into money'
from import_coupon_details
join import_coupon on import_coupon.Import_coupon_id = import_coupon_details.Import_Coupon_id
join material on material.Material_id = import_coupon_details.Material_id
order by  Import_Coupon_Details_id,
       import_coupon.Import_coupon_id,
       material.Material_code,
       material.Material_name,
       Import_Quantity,
       Import_unit_price asc;
       
select * from vw_ctpnhap_vt;
drop view vw_ctpnhap_vt;

create view  vw_CTPNHAP_VT_PN as 
select import_coupon_details.Import_Coupon_Details_id,
import_coupon.Import_coupon_id,
import_coupon.Import_coupon_day,
oder.Oder_id,
material.Material_code,
material.Material_name,
 Import_Quantity,
       Import_unit_price,
       Import_Quantity * Import_unit_price as 'Import Into money'
from import_coupon_details
join import_coupon on import_coupon.Import_coupon_id = import_coupon_details.Import_Coupon_id
join material on material.Material_id = import_coupon_details.Material_id
join oder on import_coupon.Oder_id = oder.Oder_id
order by import_coupon_details.Import_Coupon_Details_id,
import_coupon.Import_coupon_id,
import_coupon.Import_coupon_day,
oder.Oder_id,
material.Material_code,
material.Material_name,
 Import_Quantity asc;
 
 select * from vw_ctpnhap_vt_pn;
 drop view vw_ctpnhap_vt_pn;
 
 create view  vw_CTPNHAP_VT_PN_DH as 
 select import_coupon.Import_coupon_id,
 import_coupon.Import_coupon_day,
 oder.Oder_id,
 supplier.Supplier_code,
 material.Material_code,
 material.Material_name,
 Import_Quantity,
 Import_unit_price,
 Import_Quantity * Import_unit_price as 'Import Into money'
 from import_coupon_details
 join import_coupon on import_coupon.Import_coupon_id = import_coupon_details.Import_Coupon_id
 join material on material.Material_id = import_coupon_details.Material_id
 join oder on oder.Oder_id = import_coupon.Oder_id
 join supplier on supplier.Supplier_id = oder.Supplier_id
 order by  import_coupon.Import_coupon_id,
 import_coupon.Import_coupon_day,
 oder.Oder_id,
 supplier.Supplier_code,
 material.Material_code,
 material.Material_name,
 Import_Quantity,
 Import_unit_price asc;
 
 select * from vw_ctpnhap_vt_pn_dh;
 drop view vw_ctpnhap_vt_pn_dh;
 
 create view  vw_CTPNHAP_loc as 
 select import_coupon.Import_coupon_id,
 material.Material_code,
 Import_Quantity,
 Import_unit_price,
 Import_Quantity * Import_unit_price as 'Import Into money'
 from import_coupon_details
 join import_coupon on import_coupon.Import_coupon_id = import_coupon_details.Import_Coupon_id
 join material on material.Material_id = import_coupon_details.Material_id
 where import_coupon_details.Import_Quantity > 5;
 
 select * from vw_ctpnhap_loc;
 drop view vw_ctpnhap_loc;
 
 
 
       








