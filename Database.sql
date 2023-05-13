create database Mini_test_tuan2;
use Mini_test_tuan2;

create table Material
(
    Material_id   int primary key,
    Material_name varchar(50),
    Unit          varchar(20),
    Price         decimal
);

create table Inventory
(
    Inventory_id          int primary key,
    Material_id           int,
    foreign key (Material_id) references Material (Material_id),
    Quantity              int,
    Total_Input_Quantity  decimal,
    Total_Export_Quantity decimal
);

create table Supplier
(
    Supplier_id           int primary key,
    Supplier_code         varchar(255),
    unique (Supplier_code),
    Supplier_name         varchar(50),
    Address_Supplier      varchar(50),
    Number_Phone_Supplier varchar(20)
);

create table Oder
(
    Oder_id     int primary key,
    Oder_code   varchar(255),
    unique (Oder_code),
    Oder_Day    date,
    Supplier_id int,
    foreign key (Supplier_id) references Supplier (Supplier_id)
);

create table Import_Coupon
(
    Import_coupon_id   int primary key,
    Import_coupon_code varchar(255),
    unique (Import_coupon_code),
    Import_coupon_day  date,
    Oder_id            int,
    foreign key (Oder_id) references Oder (Oder_id)
);

create table Shipment_Voucher
(
    Shipment_Voucher_id   int primary key,
    Shipment_Voucher_code varchar(255),
    unique (Shipment_Voucher_code),
    Shipment_Voucher_day  date,
    Client_Name           varchar(50)
);

create table Order_details
(
    Order_details_id int primary key,
    Oder_id          int,
    Material_id      int,
    foreign key (Oder_id) references Oder (Oder_id),
    foreign key (Material_id) references Material (Material_id),
    Order_Quantity   int
);

create table Import_Coupon_Details
(
    Import_Coupon_Details_id int primary key,
    Import_Coupon_id         int,
    Material_id              int,
    foreign key (Import_Coupon_id) references Import_Coupon (Import_Coupon_id),
    foreign key (Material_id) references Material (Material_id),
    Import_Quantity          int,
    Import_unit_price        decimal,
    Note                     varchar(255)
);

create table Shipment_Voucher_Details
(
    Shipment_Voucher_Details_id int primary key,
    Shipment_Voucher_id         int,
    Material_id                 int,
    foreign key (Shipment_Voucher_id) references Shipment_Voucher (Shipment_Voucher_id),
    foreign key (Material_id) references Material (Material_id),
    Output_Quantity             int,
    Output_unit_price           decimal,
    Note                        varchar(255)
);