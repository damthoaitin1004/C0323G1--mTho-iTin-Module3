create database quan_ly_cua_hang;
use quan_ly_cua_hang;
create table phieu_xuat(
so_phieu_xuat int not null primary key,
ngay_xuat date 
);
create table vat_tu(
ma_vat_tu int not null primary key,
ten_vat_tu varchar(45)
);
create table ct_phieu_xuat(
so_phieu_xuat int not null,
ma_vat_tu int not null,
don_gia_xuat double not null,
so_luong_xuat int not null,
foreign key (so_phieu_xuat) references phieu_xuat (so_phieu_xuat),
foreign key (ma_vat_tu) references vat_tu (ma_vat_tu),
primary key (so_phieu_xuat,ma_vat_tu)
);
create table phieu_nhap(
so_phieu_nhap int not null primary key,
ngay_nhap date
);
create table chi_tiet_phieu_nhap(
ma_vat_tu int not null,
so_phieu_nhap int not null ,
primary key (ma_vat_tu,so_phieu_nhap),
don_gia_nhap double not null,
so_luong_xuat int not null,
foreign key (ma_vat_tu) references vat_tu (ma_vat_tu),
foreign key (so_phieu_nhap) references phieu_nhap (so_phieu_nhap)
);


create table nha_cung_cap(
ma_nha_cung_cap int primary key,
ten_nha_cung_cap varchar(45),
dia_chi varchar(100),
so_dien_thoai varchar(12)
);
create table don_dat_hang(
so_don_dat_hang int not null primary key,
ma_nha_cung_cap int,
ngay_dat_hang date,
foreign key (ma_nha_cung_cap) references nha_cung_cap(ma_nha_cung_cap)
);
create table chi_tiet_don_dat_hang(
ma_vat_tu int not null,
so_don_dat_hang int not null,
primary key (ma_vat_tu,so_don_dat_hang),
foreign key (ma_vat_tu) references vat_tu (ma_vat_tu),
foreign key (so_don_dat_hang) references don_dat_hang (so_don_dat_hang)
);
create table so_dien_thoai(
so_dien_thoai varchar (12) primary key,
ma_nha_cung_cap int,
foreign key (ma_nha_cung_cap) references nha_cung_cap (ma_nha_cung_cap)
)




