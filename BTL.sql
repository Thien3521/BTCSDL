Create Database QLCHTHUOC
Use QLCHTHUOC

Create table CHUCH(
TenChu nvarchar(30) not null primary key,
Diachi nvarchar(50),
SĐT char(15) );

Create table CUAHANG(
TenCH nvarchar(30) not null primary key,
Diachi nvarchar(50),
SĐT char(15) );

Create table NHANVIEN(
MaNV char(8) not null primary key,
Ten nvarchar(30),
DiaChi nvarchar(50),
Tuoi int,
GioiTinh nvarchar(4),
NhiemVu nvarchar(15),
SĐT nvarchar(15) );

Create table LAM(
MaNV char(8) not null,
TenCH nvarchar(30) not null,
TenChu nvarchar(30),
Primary key(MaNV,TenCH),
Foreign key(TenChu) references CHUCH (TenChu) );

Create table HANGHOA(
MaHH char(8) not null primary key,
Ten nvarchar(50) ,
Gia float,
SoLuong int );

Create table THUOC(
MaHH char(8) not null primary key,
Ten nvarchar(10) ,
CongDung nvarchar(20),
Loai nvarchar(10) ,
Foreign key (MaHH) references HANGHOA (MaHH));

Create table DUNGCU(
MaHH char(8) not null primary key,
Ten nvarchar(10) ,
Loai nvarchar(10) ,
Foreign key (MaHH) references HANGHOA(MaHH));

Create table KHACHHANG(
MaKH char(8) not null primary key,
Ten nvarchar(30) ,
DiaChi nvarchar (50),
GioiTinh nvarchar(4),
Tuoi int,
SĐT char(15) );

Create table BANHANG(
MaNV char(8) not null,
MaKH char(8) not null,
MaHH char(8) not null,
SoLuong int,
Primary key (MaNV,MaKH,MaHH),
Foreign key (MaNV) references NHANVIEN (MaNV),
Foreign key (MaKH) references KHACHHANG (MaKH),
Foreign key (MaHH) references HANGHOA (MaHH) );

Create table NHACC(
MaCC char(8) not null primary key,
Ten nvarchar(30),
DiaChi nvarchar(50),
SĐT char(15) );

Create table NHAPHANG(
MaNH char(8) not null primary key,
MaCC char (8),
MaNV char(8),
MaHH char(8),
SoLuong int,
Foreign key (MaCC) references NHACC (MaCC),
Foreign key (MaHH) references HANGHOA (MaHH),
Foreign key (MaNV) references NHANVIEN (MaNV) );

Insert into CHUCH
values (N'Thủy Lợi', N'175 Tây Sơn, Đống Đa', '012345678');

Select*
From CHUCH;

Insert into CUAHANG
Values (N'Cửa Hàng Thuốc', N'175 Tây Sơn, Đống Đa', '012345678');

Select*
From CUAHANG;

Insert into HANGHOA
Values ('H001', N'BERBERIN', 10000, 100),
	   ('H002', N'Vaccine Covid 19', 20000, 200),
	   ('H003', N'Panadol', 30000, 300),
	   ('H004', N'Khẩu trang', 4000, 400),
	   ('H005', N'Kim tiêm', 5000, 500),
	   ('H006', N'Băng gạc', 6000, 600),
	   ('H007', N'C sủi', 70000, 70);

Select Ten, Gia
From HANGHOA;

Insert into NHANVIEN
Values ('NV001', N'Văn Khiêm', N'Nam Định', 20, 'Nam', N'Tính tiền', '012345689'),
       ('NV002', N'Việt Đức', N'Three Đảo', 20, 'Nam', N'Bán hàng', '012345699'),
	   ('NV003', N'Đình Thiên', N'Ninh Bình', 20, 'Nam', N'Nhập hàng', '012345999');

Select*
From NHANVIEN;

Insert into LAM
Values ('NV001', N'Cửa Hàng Thuốc', N'Thủy Lợi'),
       ('NV002', N'Cửa Hàng Thuốc', N'Thủy Lợi'),
	   ('NV003', N'Cửa Hàng Thuốc', N'Thủy Lợi');

Select*
From LAM;

Insert into THUOC
Values ('H001', N'BERBERIN',N'Chữa đau bụng', N'Hộp'),
	   ('H002', N'VC19', N'Diệt virut Covid 19', N'Liều'),
	   ('H003', N'Panadol', N'Hạ sốt', N'Vỉ'),
	   ('H007', N'C sủi', N'Bổ sung vitamin', N'Hộp');
	  
Select*
From THUOC;

Insert into DUNGCU
Values ('H004', N'Khẩu trang',N'Hộp'),
	   ('H005', N'Kim tiêm', N'Ống'),
	   ('H006', N'Băng gạc', N'Cuộn');

Select*
From DUNGCU;

Insert into KHACHHANG
Values ('KH001', N'Nguyễn Văn A', N'Vĩnh Phúc', N'Nam', 21, '099887766'),
       ('KH002', N'Nguyễn Thị B', N'Vĩnh Long', N'Nữ', 21, '099887755'),
	   ('KH003', N'Nguyễn Văn C', N'Vĩnh Tuy', N'Nam', 22, '099887999'),
	   ('KH004', N'Nguyễn Văn D', N'Vĩnh Viễn', N'Nam', 21, '099880099'),
	   ('KH005', N'Nguyễn Thị Thùy L', N'Vĩnh Cửu', N'Nữ', 18, '099000000');

Select*
From KHACHHANG;

Insert into BANHANG
Values ('NV001', 'KH002', 'H001', 1),
       ('NV001', 'KH004', 'H003', 2),
	   ('NV002', 'KH001', 'H005', 2),
	   ('NV001', 'KH001', 'H002', 3),
	   ('NV002', 'KH004', 'H004', 4),
	   ('NV002', 'KH002', 'H001', 1);

Select*
From BANHANG;

Insert into NHACC
Values ('CTT1',N'VINPHACO', N'Vĩnh Yên, Vĩnh Phúc', '0321654987'),
	   ('CTT2',N'TRAPHACO', N'Ba Đình, Hà Nội', '0321987654'),
	   ('CTT3',N'DOMESCO', N'Đồng Tháp', '0321989904'),
	   ('CTT4','OPC',N'Tp Hồ Chí Minh', '0211387654'),
	   ('CTT5',N'DƯỢC PHẨM HÀ TÂY', N'Hà Nam', '032176548');


Select*
From NHACC;

Insert into NHAPHANG
Values ('NH001', 'CTT1', 'NV003', 'H001', 100),
	   ('NH002', 'CTT1', 'NV003', 'H002', 2000),
	   ('NH003', 'CTT2', 'NV003', 'H003', 300),
	   ('NH004', 'CTT3', 'NV003', 'H004', 400),
	   ('NH005', 'CTT3', 'NV003', 'H005', 50),
	   ('NH006', 'CTT4', 'NV003', 'H006', 6000),
	   ('NH007', 'CTT5', 'NV003', 'H007', 700);

--Câu 1: Đưa ra tên hàng hóa, giá cả và số lượng của tất cả mặt hàng
Select*
From NHAPHANG;

--Câu 2: Đưa ra tất cả giá trị của bảng HANGHOA theo thứ tự giảm dần của giá cả:
Select *
From HANGHOA
Order by Gia desc;

--Câu 3: Đưa ra tất cả giá trị của bảng HANGHOA theo thứ tự tăng dần của số lượng:
Select *
From HANGHOA
Order by SoLuong;

--Câu 4: Đưa ra mã khách, tên khách của các khách hàng có họ Nguyễn
Select MaKH, Ten
From KHACHHANG
Where Ten like N'Nguyễn%';

--Câu 5: Tính giá tiền trung bình của thuốc:
Select AVG(Gia) as giaTB
From HANGHOA, THUOC
Where HANGHOA.MaHH=THUOC.MaHH;

--Câu 6: Tính tổng số khách hàng trong bảng KHACHHANG có địa chỉ là Bắc Ninh:
Select count(MaKH) as tongso
From KHACHHANG
Where DiaChi like N'Vĩnh Phúc';

--Câu 7: Đưa ra tên hàng hóa có giá thành lớn nhất
Select Ten
From HANGHOA
Where Gia=(select max(Gia) from HANGHOA );

--Câu 8:  Tổng số lượng hàng bán của từng nhân viên:
Select NV.Ten, SUM(BH.SoLuong) As soluongban
From NHANVIEN NV, BANHANG BH
Where NV.MaNV=BH.MaNV
Group by NV.Ten;

--Câu 9: Tính tổng tiền sau khi bán hết hàng trong kho của từng mặt hàng:
Select MaHH, Gia*SoLuong as tongtien
From HANGHOA;

--Câu 10: Cho biết các thông tin về khách và việc mua hàng của họ
Select KHACHHANG.*, BANHANG.*
From KHACHHANG left outer join BANHANG on
KHACHHANG.MaKH=BANHANG.MaKH;

--Câu 11: Cho biết thông tin về mặt hàng có số lượng nhiều nhất:
Select *
From HANGHOA
Where SoLuong=(Select Max(SoLuong) From HANGHOA);

--Câu 12: Cho biết mặt hàng chưa từng được bán:
Select *
From HANGHOA
Where HANGHOA.MaHH Not in (select BANHANG.MaHH from BANHANG);

--Câu 13: Cho biết các mặt hàng có số lượng không phải lớn nhất:
Select *
From HANGHOA
Where SoLuong< some (select SoLuong from HANGHOA);

--Câu 14: Số lượng trung bình 1 lần đặt hàng của 1 mặt hàng:
Select MaHH, AVG(SoLuong) As solandatTB
From BANHANG
Group by MaHH;

--Câu 15: Mặt hàng có số lượng trung bình lớn nhất:
Select MaHH, AVG(SoLuong) As SLTBlonnhat
From BANHANG
Group by MaHH
Having AVG(SoLuong)>= all( Select Avg(SoLuong) from BANHANG group by MaHH);

select*
From NHANVIEN;
select*
From KHACHHANG;

--Câu 16: Cho biết nhân viên và khách hàng có địa chỉ Hưng Yên :
Insert into KHACHHANG
Values('KH006', N'Phùng Thế T', 'Three Đảo','Nam', '16', '033998877');

Select Ten
From NHANVIEN
Where DiaChi like N'Three Đảo'
Union
Select Ten
From KHACHHANG
Where DiaChi like 'Three Đảo';

--Câu 17: In ra hàng hóa ứng với nhà cung cấp
Select *
From NHACC;
Select*
From HANGHOA;
Select*
From NHAPHANG;

Select HANGHOA.Ten, NHACC.Ten As TenNhaCungCap
From HANGHOA, NHACC, NHAPHANG
Where HANGHOA.MaHH = NHAPHANG.MaHH 
and NHAPHANG.MaCC = NHACC.MaCC;