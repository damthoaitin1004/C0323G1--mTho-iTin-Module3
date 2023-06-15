create database QuanLyCuaHang;
use QuanLyCuaHang;
create table PhieuXuat(
SoPx int not null primary key,
ngayXuat date 
);
create table VatTu(
MaVTU int not null primary key,
TenVTU varchar(45)
);
create table CTPXuat(
SoPx int not null,
MaVTU int not null,
DGXuat double not null,
SLXuat int not null,
foreign key (SoPx) references PhieuXuat (SoPx),
foreign key (MaVTU) references VatTu (MaVTU),
primary key (SoPx,MaVTU)
);
create table PhieuNhap(
SoPN int not null primary key,
NgayNhap date
);
create table CTPNhap(
MaVTU int not null,
SoPN int not null ,
primary key (MaVTU,SoPN),
DGNhap double not null,
SLNhap int not null,
foreign key (MaVTU) references VatTu (MaVTU),
foreign key (SoPN) references PhieuNhap (SoPN)
);


create table NHACC(
MaNCC int primary key,
TenNCC varchar(45),
DiaChi varchar(100),
SĐT varchar(12)
);
create table DONDH(
SoDH int not null primary key,
MaNCC int,
NgayDH date,
foreign key (MaNCC) references NHACC(MaNCC)
);
create table CTDONDH(
MaVTU int not null,
SoDH int not null,
primary key (MaVTU,SoDH),
foreign key (MaVTU) references VatTu (MaVTU),
foreign key (SoDH) references DONDH (SoDH)
);
create table SĐT(
so_dien_thoai varchar (12) primary key,
MaNCC int,
foreign key (MaNCC) references NHACC (MaNCC)
)




