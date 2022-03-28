CREATE DATABASE QL_HANGHOA_DTT
GO
USE QL_HANGHOA_DTT
CREATE TABLE KHACHHANG(
MaKH nchar(10),
TenCongty nvarchar(50),
TenGiaoDich nvarchar(50),
DiaChi nvarchar(50),
DienThoai nchar(10),
Email nchar(50),
	PRIMARY KEY (MaKH))

CREATE TABLE DONDATHANG(
SoHD nchar(10),
MaKH nchar(10),
MANV nchar(10),
NgayDatHang date,
NgayGiaoHang date,
NoiGiaoHang nvarchar(50),
	PRIMARY KEY (SoHD))

CREATE TABLE NHANVIEN(
MaNV nchar (10),
Ho nvarchar(50),
Ten nvarchar(50),
NgaySinh date,
NgayLamViec date,
DiaChi nvarchar(50),
DienThoai nchar(10),
LuongCoBan float,
PhuCap float,
	PRIMARY KEY (MaNV))

CREATE TABLE NHACUNGCAP(
MaCongTy nchar(10),
TenCongTy nvarchar(50),
TenGiaoDich nvarchar(50),
DiaChi nvarchar(50),
DienThoai nchar(10),
Email nvarchar(50),
	PRIMARY KEY (MaCongTy) )

CREATE TABLE CHITIETDATHANG(
SoHD nchar(10),
MaHang nchar(10),
GiaBan float,
SoLuong int,
MucGiamGia int)

CREATE TABLE MATHANG(
MaHang nchar(10),
TenHang nvarchar(50),
MaCongTy nchar(10),
MaLoaiHang nchar(10),
SoLuong int,
DonViTinh nvarchar(10),
GiaHang float,
	PRIMARY KEY (MaHang))

CREATE TABLE LOAIHANG(
MaLoaiHang nchar(10),
TenLoaiHang nvarchar(50),
	PRIMARY KEY (MaLoaiHang))

ALTER TABLE DONDATHANG ADD CONSTRAINT FK_MAKH FOREIGN KEY(MaKH) REFERENCES KHACHHANG(MaKH)
ALTER TABLE DONDATHANG ADD CONSTRAINT FK_MANV FOREIGN KEY(MaNV) REFERENCES NHANVIEN(MaNV)
ALTER TABLE CHITIETDATHANG ADD CONSTRAINT FK_SOHD FOREIGN KEY(SoHD) REFERENCES DONDATHANG(SoHD)
ALTER TABLE CHITIETDATHANG ADD CONSTRAINT FK_MAH FOREIGN KEY (MaHang) REFERENCES MATHANG(MaHang)
ALTER TABLE MATHANG ADD CONSTRAINT FK_MACT FOREIGN KEY (MaCongTy) REFERENCES NHACUNGCAP(MaCongTy)
ALTER TABLE MATHANG ADD CONSTRAINT FK_MALH FOREIGN KEY (MaLoaiHang) REFERENCES LOAIHANG(MaLoaiHang)

INSERT INTO KHACHHANG(MaKH, TenCongty, TenGiaoDich, DiaChi, DienThoai, Email) VALUES
('DLAD', N'Đại Lý Anh Đào', N'Anh Đào', N'66 Huỳnh Thục Kháng. TP.Quy Nhơn', '0563825698', 'anhdaoqn@gmail.com'),
('DLHL', N'Đại lý Hòa Lợi', N'Hòa Lợi', N'1228 Trần Hưng Đạo. TP.Quy Nhơn', '0563865987', 'hoaloicompany@gmail.com'),
('DLXM', N'Đại Lý Xuân Mai', N'Xuân Mai', N'Thị trấn Diêu Trì', '0563860425', 'xuanmaitaphoa@gmail.com')
INSERT INTO NHANVIEN(MaNV, Ho, Ten, NgaySinh, NgayLamViec, DiaChi, DienThoai, LuongCoBan, PhuCap) VALUES
('001', N'Nguyễn Bảo', N'Duy', '1999-02-26', '2018-08-10', N'27 Nguyễn Lữ, phường Phô Mây, TP.Quy Nhơn', '0965663135', 650000, 800000),
('002', N'Trần Huy', N'Hoàng', '2000-09-14', '2018-08-10', N'Cát Tài, Phù Cát, Bình Định', '0359820309', 580000, 0),
('003', N'Nguyễn Văn', N'Thông', '1997-07-19', '2017-06-15', N'Vĩnh Định, Vĩnh Thịnh, VĨnh Thạnh, Bình Định', '0395570740', 7000000, 1000000),
('004', N'Đặng Văn', N'Tuấn', '1994-01-26', '2016-05-01', N'Mỹ Châu, Phù Mỹ, Bình Định', '0965712840', 7200000, 1000000)
INSERT INTO LOAIHANG(MaLoaiHang, TenLoaiHang) VALUES
('SB', N'Sữa Bột'), ('SC', N'Sữa Chua'), ('SD', N'Sữa Đặc'), 
('ST', N'Sữa Tươi')
INSERT INTO NHACUNGCAP(MaCongTy, TenCongTy, TenGiaoDich, DiaChi, DienThoai, Email) VALUES
('AB', N'Công Ty Abbott Việt Nam', N'Abbott Laboratories', N'Số 2 Ngô Đức Kế, quận 1, TP.Hồ Chí Minh', '0283827260', NULL),
('DL', N'Công Ty Dutch Lady Việt Nam', N'FrieslandCampina', N'Xã Bình Hòa, huyện Thuận An, tỉnh Bình Dương', '0650375442', 
'cskh@frieslandcampina.com'),
('NTF', N'Công Ty Cổ Phần thực phẩm dinh dưỡng NutiFood', 'NutiFood', N'283 Hoàng Diệu, phường 6, quận 4 Tp.Hồ Chí Minh', '0838267999', 
'nutifood@nutifood.com.vn'),
('VNM', N'Công Ty Cổ Phần sữa Việt Nam', 'Vinamilk', N'Số 10, đường Tân Trào, quận 7, Tp.Hồ Chí Minh', '0285415555', 
'vinamilk@vinamilk.com.vn')
INSERT INTO MATHANG(MaHang, TenHang, MaCongTy, MaLoaiHang, SoLuong, DonViTinh, GiaHang) VALUES
('SB001', N'Sữa bột Abbott Grow', 'AB', 'SB', 15, 'lon', 550000),
('SB002', N'Sữa bột NutriMum', 'NTF', 'SB', 14, 'lon', 450000),
('SB003', N'Sữa bột Enterex Protein', 'VNM', 'SB', 20, 'lon', 500000),
('SB004', N'Sữa bột Wakanda', 'VNM', 'SB', 10, 'lon', 420000),
('SC001', N'Sữa chua Vinamilk Nha Đam', 'VNM', 'SC', 20, 'lon', 500000),
('SC002', N'Sữa chua Zott Milch Geister', 'AB', 'SC', 50, 'lon', 520000),
('SC003', N'Sữa chua Love in Farm', 'DL', 'SC', 50, 'lon', 450000),
('SD001', N'Sữa đặc Ông Thọ đỏ', 'VNM', 'SD', 12, 'lon', 180000),
('SD002', N'Sữa đặc Hoàn Hảo', 'DL', 'SD', 20, 'lon', 170000),
('SD003', N'Sữa đặc Phương Nam', 'NTF', 'SD', 10, 'lon', 150000),
('ST001', N'Sữa tươi tiệt trùng Vinamilk', 'VNM', 'ST', 10, 'lon', 400000),
('ST002', N'Sữa tươi PediaSure vị chuối', 'NTF', 'ST', 15, 'lon', 380000);

INSERT INTO DONDATHANG(SoHD, MaKH, MANV, NgayDatHang, NgayGiaoHang, NoiGiaoHang) VALUES 
('10144', 'DLXM', '001', '2019-10-09', '2019-10-14', N'Thị trấn Diêu Trì'),
('10145', 'DLAD', '002', '2019-10-10', '2019-10-14', N'66 Huỳnh Thúc Kháng'),
('10183', 'DLHL', '002', '2019-10-14', '2019-10-20', N'1228 Trần Hưng Đạo, Quy Nhơn'),
('10202', 'DLAD', '003', '2019-10-15', '2019-10-20', N'66 Huỳnh Thúc Kháng')

INSERT INTO CHITIETDATHANG(SoHD, MaHang, GiaBan, SoLuong, MucGiamGia) VALUES
('10144', 'SB001', 600000, 5, 5),
('10144', 'SB003', 540000, 5, 5),
('10144', 'SD001', 21000, 10, 8),
('10145', 'SB003', 550000, 4, 6),
('10145', 'ST001', 440000, 6, 5),
('10183', 'SD001', 210000, 5, 6),
('10183', 'ST001', 450000, 6, 6),
('10183', 'SD003', 190000, 10, 6),
('10183', 'ST002', 420000, 5, 5),
('10202', 'SB001', 610000, 6, 6),
('10202', 'SB004', 470000, 8, 6);

--Bài tập: 
--1. Cho biết danh sách các đối tác cung cấp hàng cho công ty. (4 mẫu tin)
SELECT * FROM NHACUNGCAP
--2. Mã hàng, tên hàng và số lượng của các mặt hàng hiện có trong công ty. (12 mẫu tin)
SELECT MaHang, TenHang, SoLuong FROM MATHANG
--3. Họ tên và địa chỉ và năm bắt đầu làm việc của các nhân viên trong công ty (4 mẫu tin
SELECT Ho, Ten, DiaChi, YEAR(NgayLamViec) AS NamLamViec FROM NHANVIEN
--4. Địa chỉ và điện thoại của nhà cung cấp có tên giao dịch Vinamilk là gì?
SELECT DiaChi, DienThoai FROM NHACUNGCAP WHERE TenGiaoDich='Vinamilk'
--5. Cho biết mã hàng và tên hàng của các mặt hàng có giá lớn hơn 200.000 và số lượng hiện có ít hơn 50. (7 mẫu tin)
SELECT MaHang, TenHang, SoLuong, GiaHang FROM MATHANG WHERE GiaHang > 200000 AND SoLuong < 50
--6. Cho biết mỗi mặt hàng trong công ty do ai cung cấp. (12 mẫu tin)
SELECT MaHang, TenHang, TenCongTy FROM MATHANG, NHACUNGCAP WHERE MATHANG.MaCongTy = NHACUNGCAP.MaCongTy
--7. Công Ty NutiFood đã cung cấp những mặt hàng nào? (3 mẫu tin)
SELECT * FROM MATHANG WHERE MaCongTy='NTF'
--8. Loại hàng sữa đặc do những công ty nào cung cấp và địa chỉ của các công ty đó là gì?
SELECT TenCongTy, NHACUNGCAP.MaCongTy, DiaChi FROM NHACUNGCAP 
INNER JOIN MATHANG ON NHACUNGCAP.MaCongTy = MATHANG.MaCongTy
WHERE MATHANG.MaHang LIKE 'SD%' 
--9. Những khách hàng nào (tên giao dịch) đã đặt mua mặt hàng sữa đặc của công ty? (2 mẫu tin)
SELECT DISTINCT DONDATHANG.MaKH, TenGiaoDich FROM KHACHHANG 
INNER JOIN DONDATHANG ON KHACHHANG.MaKH = DONDATHANG.MaKH 
INNER JOIN CHITIETDATHANG ON DONDATHANG.SoHD = CHITIETDATHANG.SoHD 
INNER JOIN MATHANG ON CHITIETDATHANG.MaHang = MATHANG.MaHang 
WHERE CHITIETDATHANG.MaHang LIKE 'SD%' 
--10. Đơn đặt hàng số 10145 do ai đặt và do nhân viên nào lập, thời gian và địa điểm giao hàng là ở đâu? (1 mẫu tin)
SELECT KHACHHANG.TenCongty, DONDATHANG.MANV, NHANVIEN.Ho, NHANVIEN.Ten, NgayDatHang, NgayGiaoHang, NoiGiaoHang 
FROM DONDATHANG, KHACHHANG, NHANVIEN WHERE SoHD = '10145' AND
KHACHHANG.MaKH = DONDATHANG.MaKH AND NHANVIEN.MaNV = DONDATHANG.MANV
--11. Hãy cho biết số tiền lương mà công ty phải trả cho mỗi nhân viên là bao nhiêu (lương = lương cơ bản + phụ cấp) (4 mẫu tin)
SELECT (LuongCoBan + PhuCap) AS LUONGPHAITRA FROM NHANVIEN
--12. Trong đơn đặt hàng số 10183 đặt mua những mặt hàng nào và số tiền mà khách hàng phải trả cho mỗi mặt 
--hàng là bao nhiêu (số tiền phải trả được tính theo công thức (SoLuong x GiaBan - SoLuong x GiaBan x MucGiamGia/100) (4 mẫu tin)
SELECT CHITIETDATHANG.SoHD, MATHANG.TenHang, 
(CHITIETDATHANG.SoLuong * GiaBan - CHITIETDATHANG.SoLuong * GiaBan * MucGiamGia/100) AS THANHTOAN
FROM CHITIETDATHANG INNER JOIN MATHANG ON CHITIETDATHANG.MaHang = MATHANG.MaHang WHERE
CHITIETDATHANG.SoHD = '10183'
--13. Hãy cho biết có những khách hàng nào lại chính là đối tác cung cấp hàng của công ty (tức là có cùng tên giao dịch). (0 mẫu tin)
SELECT KHACHHANG.TenGiaoDich FROM KHACHHANG INNER JOIN NHACUNGCAP ON NHACUNGCAP.TenGiaoDich = KHACHHANG.TenGiaoDich
--14. Trong công ty có những nhân viên nào có cùng ngày sinh
SELECT NgaySinh, COUNT(1) AS TrungNS FROM NHANVIEN GROUP BY NgaySinh HAVING COUNT(1)>1
--15. Những đơn đặt hàng nào yêu cầu giao hàng ngay tại công ty đặt hàng và những đơn đó của công ty nào? (1 mẫu tin)
SELECT SoHD, DONDATHANG.MaKH, NoiGiaoHang FROM DONDATHANG INNER JOIN KHACHHANG 
ON DONDATHANG.MaKH = KHACHHANG.MaKH
WHERE DONDATHANG.NoiGiaoHang = KHACHHANG.DiaChi
--16. Cho biết tên công ty, tên giao dịch, địa chỉ và điện thoại của các khách hàng và các nhà cung cấp hàng cho công ty. (7 mẫu tin)
SELECT TenCongty, TenGiaoDich, DiaChi FROM NHACUNGCAP UNION
SELECT TenCongty, TenGiaoDich, DiaChi FROM KHACHHANG
--17. Những mặt hàng nào chưa từng được khách hàng đặt mua (5 mẫu tin)
SELECT MaHang, TenHang FROM MATHANG WHERE NOT EXISTS (SELECT CHITIETDATHANG.MaHang FROM CHITIETDATHANG
WHERE MaHang = MATHang.MaHang)
--18. Những nhân viên nào của công ty chưa từng lập bất kỳ một hóa đơn đặt hàng nào? (1 mẫu tin)
SELECT MaNV, (Ho + ' ' + Ten) AS HoTen FROM NHANVIEN WHERE
NOT EXISTS (SELECT MaNV FROM DONDATHANG WHERE MANV = NHANVIEN.MaNV)
--19. Những nhân viên nào của công ty có lương cơ bản cao nhất? (1 mẫu tin)
SELECT TOP 1 * FROM NHANVIEN ORDER BY LuongCoBan DESC
--20. Tổng số tiền mà khách hàng phải trả cho mỗi đơn đặt hàng là bao nhiêu? (4 mẫu tin)
SELECT SoHD, SUM(GiaBan * SoLuong - CHITIETDATHANG.SoLuong * GiaBan * MucGiamGia/100) AS TongTien FROM CHITIETDATHANG GROUP BY SoHD 
---21. Trong năm 2019, những mặt hàng nào chỉ được đặt mua đúng một lần. (3 mẫu tin)
SELECT MATHANG.MaHang, TenHang FROM MATHANG INNER JOIN CHITIETDATHANG
ON CHITIETDATHANG.MaHang = MATHANG.MaHang INNER JOIN DONDATHANG ON
DONDATHANG.SoHD = CHITIETDATHANG.SoHD WHERE YEAR (DONDATHANG.NgayDatHang)= '2019'
GROUP BY MATHANG.MaHang, TenHang HAVING COUNT (MATHANG.MaHang)= 1
---22. Hãy cho biết mỗi một khách hàng đã phải bỏ ra bao nhiêu tiền để đặt mua hàng của công ty? (3 mẫu tin)
SELECT KHACHHANG.MaKH, SUM(GiaBan * SoLuong - CHITIETDATHANG.SoLuong * GiaBan * MucGiamGia/100)
AS TONGTIEN FROM KHACHHANG INNER JOIN DONDATHANG ON KHACHHANG.MaKH = DONDATHANG.MaKH
INNER JOIN CHITIETDATHANG ON CHITIETDATHANG.SoHD = DONDATHANG.SoHD
GROUP BY KHACHHANG.MaKH
---23. Mỗi một nhân viên của công ty đã lập bao nhiêu đơn đặt hàng (nếu nhân viên chưa hề lập một hóa đơn nào thì cho kết quả là 0) (4 mẫu tin)
SELECT NHANVIEN.MaNV, Ho, Ten, Count(SoHD) as SoDon FROM NHANVIEN LEFT OUTER JOIN DONDATHANG
ON DONDATHANG.MANV = NHANVIEN.MaNV GROUP BY NHANVIEN.MaNV, Ho, Ten
---24. Cho biết tổng số tiền mặt hàng mà cửa hàng thu được trong mỗi tháng của năm 2019(thời gian được tính theo ngày đặt hàng). (1 mẫu tin)
SELECT MONTH(NgayDatHang) AS THANG,
SUM(GiaBan * SoLuong - CHITIETDATHANG.SoLuong * GiaBan * MucGiamGia/100)
AS TONGTIEN
FROM DONDATHANG INNER JOIN CHITIETDATHANG ON
DONDATHANG.SoHD = CHITIETDATHANG.SoHD
WHERE YEAR (NgayDatHang) = '2019'
GROUP BY MONTH(NgayDatHang)
---25. Hãy cho biết tổng số tiền lời mà công ty thu được từ mỗi mặt hàng trong năm 2019 (7 mẫu tin)
SELECT MATHANG.MaHang, MATHANG.TenHang, SUM(CHITIETDATHANG.SoLuong * GiaHang) AS TENHANG,
SUM(GiaBan * CHITIETDATHANG.SoLuong - CHITIETDATHANG.SoLuong * GiaBan * MucGiamGia/100) AS TIENBAN,
SUM(GiaBan * CHITIETDATHANG.SoLuong - CHITIETDATHANG.SoLuong * GiaBan * MucGiamGia/100) -
SUM(CHITIETDATHANG.SoLuong * GiaHang) AS TIENLAI FROM MATHANG INNER JOIN CHITIETDATHANG ON 
CHITIETDATHANG.MaHang = MATHANG.MaHang INNER JOIN DONDATHANG ON 
DONDATHANG.SoHD = CHITIETDATHANG.SoHD WHERE YEAR(DONDATHANG.NgayDatHang)='2019'
GROUP BY MATHANG.MaHang, MATHANG.TenHang
---26. Hãy cho biết tổng số lượng hàng của mỗi mặt hàng mà công ty đã có (tổng số lượng hàng hiện có
--và đã bán).(12 mẫu tin)
SELECT MATHANG.MaHang,TenHang,MATHANG.SoLuong +
CASE WHEN SUM(CHITIETDATHANG.SoLuong) IS NULL THEN 0
ELSE SUM(CHITIETDATHANG.SoLuong) END AS TongSL
FROM MATHANG LEFT OUTER JOIN CHITIETDATHANG ON 
CHITIETDATHANG.MaHang = MATHANG.MaHang 
GROUP BY MATHANG.MaHang, TenHang, MATHANG.SoLuong
---27. Nhân viên nào của công ty bán được số lượng hàng nhiều nhất và số lượng 
--hàng bán được của những nhân viên này là bao nhiêu? Nguyễn Thành Pú, tổng 36
SELECT NHANVIEN.MaNV, Ho, Ten, SUM(CHITIETDATHANG.SoLuong) AS SoLuong FROM NHANVIEN
INNER JOIN DONDATHANG ON DONDATHANG.MANV = NHANVIEN.MaNV INNER JOIN CHITIETDATHANG
ON CHITIETDATHANG.SoHD = DONDATHANG.SoHD GROUP BY NHANVIEN.MaNV, Ho, Ten
---28. Đơn đặt hàng nào số lượng hàng được đặt mua ít nhất?
SELECT DONDATHANG.SoHD, SUM(CHITIETDATHANG.SoLuong) FROM
DONDATHANG INNER JOIN CHITIETDATHANG ON CHITIETDATHANG.SoHD = DONDATHANG.SoHD
GROUP BY DONDATHANG.SoHD HAVING SUM(SoLuong) <= ALL(SELECT SUM(CHITIETDATHANG.SoLuong) 
FROM DONDATHANG INNER JOIN CHITIETDATHANG ON CHITIETDATHANG.SoHD = DONDATHANG.SoHD
GROUP BY DONDATHANG.SoHD)
--29. Số tiền nhiều nhất mà mỗi khách hàng đã từng bỏ ra để đặt hàng trong 
--các đơn đặt hàng là bao nhiêu? (3 mẫu tin)
SELECT TOP 1 SUM(SoLuong*GiaBan-SoLuong*GiaBan*MucGiamGia/100) FROM DONDATHANG 
INNER JOIN CHITIETDATHANG ON CHITIETDATHANG.SoHD = DONDATHANG.SoHD ORDER BY 1 DESC
--30. Thống kê xem trong năm 2019, mỗi một mặt hàng trong mỗi tháng và trong cả năm 
--bán được với số lượng bao nhiêu
SELECT MATHANG.MaHang, MATHANG.TenHang, 
SUM(CASE MONTH(NgayDatHang) WHEN 1 THEN CHITIETDATHANG.SoLuong ELSE 0 END) 
AS THANG_1,
SUM(CASE MONTH(NgayDatHang) WHEN 2 THEN CHITIETDATHANG.SoLuong ELSE 0 END) 
AS THANG_2,
SUM(CASE MONTH(NgayDatHang) WHEN 3 THEN CHITIETDATHANG.SoLuong ELSE 0 END) 
AS THANG_3,
SUM(CASE MONTH(NgayDatHang) WHEN 4 THEN CHITIETDATHANG.SoLuong ELSE 0 END) 
AS THANG_4,
SUM(CASE MONTH(NgayDatHang) WHEN 5 THEN CHITIETDATHANG.SoLuong ELSE 0 END) 
AS THANG_5,
SUM(CASE MONTH(NgayDatHang) WHEN 6 THEN CHITIETDATHANG.SoLuong ELSE 0 END) 
AS THANG_6,
SUM(CASE MONTH(NgayDatHang) WHEN 7 THEN CHITIETDATHANG.SoLuong ELSE 0 END) 
AS THANG_7,
SUM(CASE MONTH(NgayDatHang) WHEN 8 THEN CHITIETDATHANG.SoLuong ELSE 0 END) 
AS THANG_8,
SUM(CASE MONTH(NgayDatHang) WHEN 9 THEN CHITIETDATHANG.SoLuong ELSE 0 END) 
AS THANG_9,
SUM(CASE MONTH(NgayDatHang) WHEN 10 THEN CHITIETDATHANG.SoLuong ELSE 0 END) 
AS THANG_10,
SUM(CASE MONTH(NgayDatHang) WHEN 11 THEN CHITIETDATHANG.SoLuong ELSE 0 END) 
AS THANG_11,
SUM(CASE MONTH(NgayDatHang) WHEN 12 THEN CHITIETDATHANG.SoLuong ELSE 0 END) 
AS THANG_12,
SUM(CHITIETDATHANG.SoLuong) AS CaNam
FROM DONDATHANG INNER JOIN CHITIETDATHANG ON 
CHITIETDATHANG.SoHD = DONDATHANG.SoHD 
INNER JOIN MATHANG ON CHITIETDATHANG.MaHang = MATHANG.MaHang
GROUP BY MATHANG.MaHang, MATHANG.TenHang
---31. Tăng số lượng hàng của những mặt hàng do công ty Vinamilk cung cấp lên gấp đôi
UPDATE MATHANG SET SoLuong = SoLuong*2 WHERE MATHANG.MaCongTy='VNM'
---32. Cập nhật giá trị của trường NoiGiaoHang trong bảng DONDATHANG bằng địa chỉ của khách hàng 
--đối với những đơn đặt hàng chưa xác định được nơi giao hàng (giá trị trường NoiGiaoHang bằng NULL).
UPDATE DONDATHANG SET NoiGiaoHang=(SELECT DiaChi FROM KHACHHANG WHERE KHACHHANG.MaKH = DONDATHANG.MaKH)
WHERE NoiGiaoHang IS NULL  
--33. Cập nhật lại dữ liệu trong bảng KHACHHANG sao cho nếu tên công ty và tên giao dịch của khách hàng 
--trùng với tên công ty và tên giao dịch của một nhà cung cấp nào đó thì địa chỉ, điện thoại và email
--phải giống nhau.
UPDATE KHACHHANG SET 
DiaChi = NHACUNGCAP.DiaChi,
DienThoai = NHACUNGCAP.DienThoai,
Email = NHACUNGCAP.Email
FROM NHACUNGCAP
WHERE KHACHHANG.TenCongty = NHACUNGCAP.TenCongTy 
AND KHACHHANG.TenGiaoDich = NHACUNGCAP.TenGiaoDich 
---34. Tăng lương lên gấp rưỡi cho những nhân viên bán được số lượng hàng nhiều hơn 500 
--trong năm 2019
UPDATE NHANVIEN 
SET LuongCoBan=LuongCoBan*1.5 
WHERE MaNV = (SELECT MaNV 
FROM DONDATHANG
INNER JOIN CHITIETDATHANG ON DONDATHANG.SoHD=CHITIETDATHANG.SoHD
WHERE MANV=NHANVIEN.MaNV AND YEAR(NgayDatHang) = '2019'
GROUP BY MANV HAVING SUM(soluong) > 100)
---35. Tăng phụ cấp lên bằng 50% lương cho những nhân viên bán được hàng nhiều nhất
UPDATE NHANVIEN 
SET PhuCap = LuongCoBan/2
WHERE MaNV IN
(SELECT MaNV FROM DONDATHANG 
INNER JOIN CHITIETDATHANG ON DONDATHANG.SoHD=CHITIETDATHANG.SoHD 
GROUP BY MANV HAVING SUM(SoLuong) >= ALL(SELECT SUM(SoLuong)
FROM DONDATHANG INNER JOIN CHITIETDATHANG ON DONDATHANG.SoHD=CHITIETDATHANG.SoHD GROUP BY MaNV))
---36. Giảm 25% lương của những nhân viên trong năm 2019 không lập được bất kỳ đơn đặt hàng nào
UPDATE NHANVIEN SET LuongCoBan=LuongCoBan * 0.85
WHERE NOT EXISTS (SELECT MaNV FROM DONDATHANG WHERE MaNV=NHANVIEN.MaNV AND YEAR(NgayDatHang) = '2019') 
---37. Giả sử trong bảng DONDATHANG có thêm trường SoTien, cho biết số tiền mà khách hàng phải trả
--trong mỗi đơn đặt hàng. Hãy tính giá trị cho trường này
ALTER TABLE DONDATHANG ADD SoTien float
UPDATE DONDATHANG
SET SoTien = (SELECT SUM(SoLuong*GiaBan+SoLuong*GiaBan*MucGiamGia)
FROM CHITIETDATHANG 
WHERE SoHD = DONDATHANG.SoHD GROUP BY SoHD) 
---38. Xóa khỏi bảng NHANVIEN những nhân viên đã làm việc trong công ty quá 40 năm
DELETE FROM NHANVIEN WHERE DATEDIFF(YY,ngaylamviec,GETDATE()) > 40
---39. Xóa những đơn đặt hàng trước năm 2000 ra khỏi cơ sở dữ liệu
DELETE FROM DONDATHANG WHERE NgayDatHang < '1/1/2000' 
---40. Xóa khỏi bảng LOAIHANG những loại hàng hiện không có mặt hàng 
DELETE FROM LOAIHANG WHERE NOT EXISTS (SELECT MaHang FROM MATHANG WHERE MaLoaiHang = LOAIHANG.MaLoaiHang) 
---41. Xóa khỏi bảng KHACHHANG những khách hàng hiện không có bất kỳ đơn đặt hàng nào cho công ty
DELETE FROM KHACHHANG WHERE NOT EXISTS (SELECT SoHD FROM DONDATHANG WHERE MaKH = KHACHHANG.MaKH)
---42. Xóa khỏi bảng MATHANG những mặt hàng có số lượng bằng 0 và không được đặt mua trong bất kì đơn đặt hàng nào
DELETE FROM MATHANG WHERE SoLuong = 0 AND NOT EXISTS 
(SELECT SoHD FROM CHITIETDATHANG WHERE CHITIETDATHANG.MaHang = MATHANG.MaHang)