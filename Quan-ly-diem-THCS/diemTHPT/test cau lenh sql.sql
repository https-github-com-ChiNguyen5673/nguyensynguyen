SELECT L.MALOP as 'Mã Lớp', TENLOP as 'Tên Lớp Học','Sỹ Số' = (update TT_LOP set SYSO = (select count(MAHS) from LOP L, DS_HS_LOP D where L.MALOP=D.MALOP)), HOHS+' '+TENHS as 'Họ Tên Lớp Trưởng', HOGV+' '+TENGV as 'Họ Tên GVCN', TENKHOI as 'Khối', TEN_CHUYEN as 'Chuyên', TENHK as 'Học Kỳ', TENNH as 'Năm Học' 
FROM LOP L, TT_LOP TL, HOCSINH H, CHUYEN C, KHOI K, GIAOVIEN G, NAM_HOC NH, HOC_KY HK 
WHERE NH.MANH=TL.MANH and HK.MAHK=TL.MAHK and TL.MALOP=L.MALOP and TL.MA_LOP_TR = H.MAHS AND TL.MA_GVCN = G.MAGV AND L.MAKHOI = K.MAKHOI AND L.MA_CHUYEN = C.MA_CHUYEN




create proc ThemDSHSLOP(@TENNH nvarchar(50), @TENHK nvarchar(50), @TENLOP nvarchar(50), @MAHS char(10))
as
begin
	DECLARE @MAHK char(10)
		set @MAHK = (select MAHK from HOC_KY where TENHK=@TENHK)
	Declare @MANH char(10)
		set @MANH = (select MANH from NAM_HOC where TENNH=@TENNH)
	declare @MALOP char(10)
		set @MALOP = (select MALOP from LOP where TENLOP=@TENLOP)
	insert into DS_HS_LOP( MAHS, MALOP, MAHK, MANH)
	values(@MAHS, @MALOP, @MAHK, @MANH)
end


drop proc ThemDSHSLOP

exec ThemDSHSLop N'2018-2019', N'HỌC KỲ 1', N'LỚP 10A2', 'HS0013'

--cần kiểm tra lại câu lệnh
create proc suaHSDSLop(@TENNH nvarchar(50), @TENHK nvarchar(50), @MAHS char(10), @TENLOP nvarchar(50))
as
begin
	DECLARE @MAHK char(10)
		set @MAHK = (select MAHK from HOC_KY where TENHK=@TENHK)
	Declare @MANH char(10)
		set @MANH = (select MANH from NAM_HOC where TENNH=@TENNH)
	declare @MALOP char(10)
		set @MALOP = (select L.MALOP from LOP L, DS_HS_LOP D where TENLOP=@TENLOP and D.MALOP = L.MALOP)
	update DS_HS_LOP
		set MALOP = @MALOP
	where MAHS = @MAHS
end

drop proc suaHSDSLop
exec suaHSDSLop N'2018-2019', N'HỌC KỲ 1', 'HS0013', N'LỚP 10A1'


--xoa học sinh lớp
delete from DS_HS_LOP where MAHS = 'HS0013' and MALOP = N'LỚP 10A1'

create proc xoaHSDSLOP(@TENNH nvarchar(50), @TENHK nvarchar(50), @MAHS char(10), @TENLOP nvarchar(50))
as
begin
	DECLARE @MAHK char(10)
		set @MAHK = (select MAHK from HOC_KY where TENHK=@TENHK)
	Declare @MANH char(10)
		set @MANH = (select MANH from NAM_HOC where TENNH=@TENNH)
	declare @MALOP char(10)
		set @MALOP = (select D.MALOP from LOP L, DS_HS_LOP D where TENLOP=@TENLOP and D.MALOP = L.MALOP)
	delete from DS_HS_LOP where MAHS = @MAHS and MALOP = @MALOP and MAHK = @MAHK and MANH = @MANH
end

exec xoaHSDSLOP N'2018-2019', N'HỌC KỲ 1', 'HS0013', N'LỚP 10A1'

--
create proc themLop(@TENHK nvarchar(50),@TENNH nvarchar(50),@TENLOP nvarchar(50),@MALT char(10), @MAGVCN char(10))
as
begin
	DECLARE @MAHK char(10)
		set @MAHK = (select MAHK from HOC_KY where TENHK=@TENHK)
	Declare @MANH char(10)
		set @MANH = (select MANH from NAM_HOC where TENNH=@TENNH)
	declare @MALOP char(10)
		set @MALOP = (select MALOP from LOP where TENLOP=@TENLOP)
	declare @SYSO int
		set @SYSO = (select count(DS.MAHS) from LOP L, DS_HS_LOP DS,NAM_HOC N, HOC_KY H where L.MALOP=DS.MALOP and DS.MANH = N.MANH and DS.MAHK=H.MAHK and H.MAHK = @MAHK and N.MANH=@MANH and L.MALOP=@MALOP)
	insert into TT_LOP(MALOP,SYSO,MA_LOP_TR,MA_GVCN,MAHK,MANH)
		values(@MALOP,@SYSO,@MALT,@MAGVCN,@MAHK,@MANH)
end

DROP proc themLop
exec themLop N'HỌC KỲ 1', N'2018-2019', N'LỚP 10A2', 'HS0010', 'GV00001'


create proc suaLop(@TenLop nvarchar(50), @TenHK nvarchar(50), @TenNH nvarchar(50), @MALT char(10), @MAGVCN char(10))
as
begin
	DECLARE @MAHK char(10)
		set @MAHK = (select MAHK from HOC_KY where TENHK=@TENHK)
	Declare @MANH char(10)
		set @MANH = (select MANH from NAM_HOC where TENNH=@TENNH)
	declare @MALOP char(10)
		set @MALOP = (select TL.MALOP from LOP L, TT_LOP TL where TENLOP=@TENLOP and TL.MALOP = L.MALOP)
	declare @SYSO int
		set @SYSO = (select count(DS.MAHS) from LOP L, DS_HS_LOP DS,NAM_HOC N, HOC_KY H where L.MALOP=DS.MALOP and DS.MANH = N.MANH and DS.MAHK=H.MAHK and H.MAHK = @MAHK and N.MANH=@MANH and L.MALOP=@MALOP)	
	update TT_LOP
		set SYSO = @SYSO,
			MA_LOP_TR = @MALT,
			MA_GVCN = @MAGVCN,
			MAHK = @MAHK,
			MANH = @MANH
	where MALOP = @MALOP
end



EXEC suaLop N'LỚP 10A2', N'HỌC KỲ 1', N'2018-2019', 'HS0010', 'GV00002'
		

create proc xoaLop(@TenLop nvarchar(50), @TenNH nvarchar(50), @TenHK nvarchar(50))
as
begin
	DECLARE @MAHK char(10)
		set @MAHK = (select MAHK from HOC_KY where TENHK=@TENHK)
	Declare @MANH char(10)
		set @MANH = (select MANH from NAM_HOC where TENNH=@TENNH)
	declare @MALOP char(10)
		set @MALOP = (select L.MALOP from LOP L, TT_LOP TL where TENLOP=@TENLOP and TL.MALOP = L.MALOP)
	delete from TT_LOP
		where MANH = @MANH and MAHK = @MAHK and MALOP = @MALOP
end

drop proc xoaLop
exec xoaLop N'LỚP 10A2', N'2018-2019', N'HỌC KỲ 1'





create proc HT_MAHS(@MAHS char(10))
as
begin
	select MAHS from HOCSINH Where MAHS = @MAHS
end


drop proc HT_MAHS
exec HT_MAHS 'hs0001'

SELECT MAHS as 'Mã Học Sinh', HOHS+' '+TENHS AS 'Họ Tên Học Sinh', NS as 'Ngày Sinh', GT as 'Giới Tính', DC as 'Địa Chỉ', SDT as 'Số Điện Thoại', HOTEN_BO as 'Họ Tên Bố', NN_BO as 'Nghề Nghiệp Bố', HOTEN_ME as 'Họ Tên Mẹ', NN_ME as 'Nghề Nghiệp Mẹ'  FROM HOCSINH where HOHS+' '+TENHS = N'Nguyễn Trẫn Long'


select MAGV as 'Mã Giáo Viên', HOGV+' '+TENGV as 'Họ Tên Giáo Viên', NS as 'Ngày Sinh', GT as 'Giới Tính', DC as 'Địa Chỉ', SDT as 'Số Điện Thoại', TEN_MON as 'Môn Dạy' from GIAOVIEN G, MONHOC M where G.MAMONHOC=M.MAMONHOC and MAGV = 'GV00001'


create view HT_HocSinh
as
	SELECT MAHS as 'Mã Học Sinh', HOHS+' '+TENHS AS 'Họ Tên Học Sinh', NS as 'Ngày Sinh', GT as 'Giới Tính', DC as 'Địa Chỉ', SDT as 'Số Điện Thoại', HOTEN_BO as 'Họ Tên Bố', NN_BO as 'Nghề Nghiệp Bố', HOTEN_ME as 'Họ Tên Mẹ', NN_ME as 'Nghề Nghiệp Mẹ' 
	FROM HOCSINH


drop view HT_HocSinh



select* from HT_HocSinh where [Giới Tính] = 'nam'

																				
																				
CREATE PROC dsDiemMHHS(@TENNH nvarchar(50), @TENHK nvarchar(50), @MAHS char(10))
as
begin
			
	select M.MAMONHOC as 'Mã Môn Học', TEN_MON as 'Tên Môn Học', CAST(MIENG1 AS CHAR(10)) + ' '+CAST(MIENG2 AS CHAR(10)) +' ' +CAST(MIENG3 AS CHAR(10)) +' '+ CAST(MIENG4 AS CHAR(10)) AS 'Miệng', CAST([15PHUT1] AS CHAR(10))+' ' +CAST([15PHUT2] AS CHAR(10))+' '+CAST([15PHUT3] AS CHAR(10)) as '15 phút', CAST([45PHUT1] AS CHAR(10))+' '+CAST([45PHUT2] AS CHAR(10)) as '45 phút', CUOIKY as 'Cuối Kỳ', TB as 'Điểm TBHK Môn'
	from  HOCSINH H, NAM_HOC NH, HOC_KY HK,  DIEM_CHITIET D, MONHOC M
	where H.MAHS = D.MAHS AND NH.MANH=D.MANH AND HK.MAHK=D.MAHK AND D.MAMONHOC=M.MAMONHOC and TENNH=@TENNH 
	
	
	and TENHK=@TENHK and H.MAHS=@MAHS
end																			


drop proc dsDiemMHHS

exec dsDiemMHHS N'2018-2019', N'HỌC KỲ 1', 'HS006'


CREATE PROC dsDiemMHHS(@TENNH nvarchar(50), @TENHK nvarchar(50), @MAHS char(10))
as
begin
	update DIEM_CHITIET set TB = (select ((cast(MIENG1 as float)
			+cast(MIENG2 as float)+cast(MIENG3 as float)+cast(MIENG4 as float)
			+cast([15phut1] as float)+cast([15phut2] as float)
			+cast([15phut3] as float)+(cast([45phut1] as float)
			+cast([45phut2] as float))*2+cast(CUOIKY as float)*3)/14) 
			from DIEM_CHITIET D
			where TB is NULL and DIEM_CHITIET.MAHS = 'HS0001')
			 
	--and H.MAHS = @MAHS and TENHK = @TENHK and TENNH = @TENNH) 	 		
	
	update DIEM_CHITIET
		set MIENG1 = 'NULL'
	where MIENG1 IS NULL
	update DIEM_CHITIET
		set MIENG2 = 'NULL'
	where MIENG1 IS NULL
	update DIEM_CHITIET
		set MIENG3 = 'NULL'
	where MIENG1 IS NULL
	update DIEM_CHITIET
		set MIENG4 = 'NULL'
	where MIENG4 IS NULL
	update DIEM_CHITIET set [15PHUT1] = 'NULL' where [15PHUT1] IS NULL
	update DIEM_CHITIET set [15PHUT2] = 'NULL' where [15PHUT2] IS NULL 	
	update DIEM_CHITIET set [15PHUT3] = 'NULL' where [15PHUT3] IS NULL
	update DIEM_CHITIET set [45PHUT1] = 'NULL' where [45PHUT1] IS NULL 
	update DIEM_CHITIET set [45PHUT2] = 'NULL' where [45PHUT2] IS NULL 	
	update DIEM_CHITIET set CUOIKY = 'NULL' where CUOIKY IS NULL
	select M.MAMONHOC as 'Mã Môn Học', TEN_MON as 'Tên Môn Học', MIENG1 + ' '+MIENG2+' ' +MIENG3+' '+MIENG4 AS 'Miệng', [15PHUT1]+' ' +[15PHUT2]+' '+[15PHUT3] as '15 phút', [45PHUT1]+' '+[45PHUT2] as '45 phút', CUOIKY, TB as 'Điểm TB Môn'
	from  HOCSINH H, NAM_HOC NH, HOC_KY HK,  DIEM_CHITIET D, MONHOC M
	where H.MAHS = D.MAHS AND NH.MANH=D.MANH AND HK.MAHK=D.MAHK AND D.MAMONHOC=M.MAMONHOC 
	and TENNH=@TENNH and TENHK=@TENHK and H.MAHS=@MAHS
end	

drop proc dsDiemMHHS

exec dsDiemMHHS N'2018-2019', N'HỌC KỲ 1', 'HS0001'

update DIEM_CHITIET set TB = NULL


create proc tinhdiemTBHKMon(@TENNH nvarchar(50), @TENHK nvarchar(50))
as
begin
	update DIEM_CHITIET set TB = (select 
			(cast(MIENG1 as float)+cast(MIENG2 as float)+cast(MIENG3 as float)+cast(MIENG4 as float)
			+cast([15phut1] as float)+cast([15phut2] as float)+cast([15phut3] as float)
			+((cast([45phut1] as float)+cast([45phut2] as float))*2)
			+(cast(CUOIKY as float)*3))/14 
			from DIEM_CHITIET D
			where M.MAMONHOC = D.MAMONHOC and D.MANH=N.MANH and HK.MAHK=D.MAHK and D.MAHS=H.MAHS and TENHK=@TENHK and TENNH=@TENNH)
			from MONHOC M, NAM_HOC N, HOC_KY HK, HOCSINH H
			where DIEM_CHITIET.MAMONHOC = M.MAMONHOC and DIEM_CHITIET.MAHS=H.MAHS and DIEM_CHITIET.MAHK=HK.MAHK and DIEM_CHITIET.MANH=N.MANH
					and  TENHK = @TENHK and TENNH = @TENNH
end

drop proc tinhdiemTBHKMon
exec tinhdiemTBHKMon N'2018-2019', N'HỌC KỲ 2'




--hiển thị danh sách điểm
create proc hienthidsDiemMHLOP(@TENNH nvarchar(50), @TENHK nvarchar(50), @TENMON nvarchar(50), @TENLOP nvarchar(50))
as
begin
	select HS.MAHS AS 'Mã Học Sinh', HOHS+' '+TENHS as 'Họ Và tên',MIENG1 + ' '+MIENG2+' ' +MIENG3+' '+MIENG4 AS 'Miệng', [15PHUT1]+' ' +[15PHUT2]+' '+[15PHUT3] as '15 phút', [45PHUT1]+' '+[45PHUT2] as '45 phút', CUOIKY as 'Cuối Kỳ', TB as 'Điểm TB Môn'
	from DIEM_CHITIET D, MONHOC M, HOC_KY H, NAM_HOC N, HOCSINH HS, DS_HS_LOP DS, LOP L
	where HS.MAHS=D.MAHS and D.MAHK=H.MAHK and D.MANH=N.MANH and D.MAMONHOC=M.MAMONHOC
			and DS.MAHS=HS.MAHS and DS.MALOP=L.MALOP and H.MAHK=DS.MAHK and N.MANH=DS.MANH
		--and TEN_MON=N'TOÁN HỌC' and TENHK=N'HỌC KỲ 1' and TENNH=N'2018-2019' and TENLOP=N'LỚP 10A1'
		and TEN_MON=@TENMON and TENHK=@TENHK and TENNH=@TENNH and TENLOP=@TENLOP
end

drop proc dsDiemMHLOP

exec hienthidsDiemMHLOP N'2018-2019', N'HỌC KỲ 1', N'TOÁN HỌC', N'LỚP 10A1'

--hiển thị điểm hiện tại
CREATE PROC dsDiemMHCTHS(@TENNH nvarchar(50), @TENHK nvarchar(50), @TENMH nvarchar(50), @MAHS char(10))
as
begin
	update DIEM_CHITIET set [MIENG1] = 'NULL' where MIENG1 IS NULL
	update DIEM_CHITIET set [MIENG2] = 'NULL' where MIENG2 IS NULL
	update DIEM_CHITIET set [MIENG3] = 'NULL' where MIENG3 IS NULL
	update DIEM_CHITIET set [MIENG4] = 'NULL' where MIENG4 IS NULL
	update DIEM_CHITIET set [15PHUT1] = 'NULL' where [15PHUT1] IS NULL
	update DIEM_CHITIET set [15PHUT2] = 'NULL' where [15PHUT2] IS NULL 	
	update DIEM_CHITIET set [15PHUT3] = 'NULL' where [15PHUT3] IS NULL
	update DIEM_CHITIET set [45PHUT1] = 'NULL' where [45PHUT1] IS NULL 
	update DIEM_CHITIET set [45PHUT2] = 'NULL' where [45PHUT2] IS NULL 	
	update DIEM_CHITIET set CUOIKY = 'NULL' where CUOIKY IS NULL		
	select M.MAMONHOC as 'Mã Môn Học', TEN_MON as 'Tên Môn Học', [MIENG1]+' '+[MIENG2]+' '+[MIENG3]+' '+[MIENG4] as 'Miệng', [15PHUT1]+' ' +[15PHUT2]+' '+[15PHUT3] as '15 phút', [45PHUT1]+' '+[45PHUT2] as '45 phút', CUOIKY as 'Cuối Kỳ'
	from  HOCSINH H, NAM_HOC NH, HOC_KY HK,  DIEM_CHITIET D, MONHOC M
	where H.MAHS = D.MAHS AND NH.MANH=D.MANH AND HK.MAHK=D.MAHK AND D.MAMONHOC=M.MAMONHOC 
	and TENNH=@TENNH and TENHK=@TENHK and H.MAHS=@MAHS and TEN_MON = @TENMH
end				

drop proc dsDiemMHCTHS

exec dsDiemMHCTHS  N'2018-2019', N'HỌC KỲ 1', N'TOÁN HỌC', 'HS006'




-- khởi tạo nơi chứa điểm thành phần cho môn học của học sinh vào đầu năm học
create proc themdiemMHCTHS_Mieng(@MADIEM char(10), @MAHS char(10), @TENNH nvarchar(50), @TENHK nvarchar(50), @TENMH nvarchar(50))
as
begin
	DECLARE @MAHK char(10)
		set @MAHK = (select MAHK from HOC_KY where TENHK=@TENHK)
	Declare @MANH char(10)
		set @MANH = (select MANH from NAM_HOC where TENNH=@TENNH)
	Declare @MAMH char(10)
		set @MAMH = (select MAMONHOC from MONHOC where TEN_MON=@TENMH)
	insert into DIEM_CHITIET(MADIEM, MAHS, MAMONHOC,MAHK, MANH)
	values (@MADIEM, @MAHS, @MAMH, @MAHK, @MANH)
end
drop proc themdiemMHCTHS_Mieng
exec themdiemMHCTHS_Mieng 'DHS006015', 'HS006', N'2018-2019', N'HỌC KỲ 2', N'TOÁN HỌC'
--thêm miệng 1
create proc themdiemMHCTHS_Mieng1(@MADIEM char(10), @MAHS char(10), @TENNH nvarchar(50), @TENHK nvarchar(50), @TENMH nvarchar(50), @DIEM char(10))
as
begin
	DECLARE @MAHK char(10)
		set @MAHK = (select MAHK from HOC_KY where TENHK=@TENHK)
	Declare @MANH char(10)
		set @MANH = (select MANH from NAM_HOC where TENNH=@TENNH)
	Declare @MAMH char(10)
		set @MAMH = (select MAMONHOC from MONHOC where TEN_MON=@TENMH)
	update DIEM_CHITIET
		set MIENG1 = @DIEM
	where MADIEM=@MADIEM and MAHS=@MAHS and MAMONHOC=@MAMH and MAHK=@MAHK and MANH=@MANH
end
drop proc themdiemMHCTHS_Mieng1
exec themdiemMHCTHS_Mieng1 'DHS006001', 'HS006', N'2018-2019', N'HỌC KỲ 1', N'TOÁN HỌC', '7'

--thêm miệng 2
create proc themdiemMHCTHS_Mieng2(@MADIEM char(10), @MAHS char(10), @TENNH nvarchar(50), @TENHK nvarchar(50), @TENMH nvarchar(50), @DIEM char(10))
as
begin
	DECLARE @MAHK char(10)
		set @MAHK = (select MAHK from HOC_KY where TENHK=@TENHK)
	Declare @MANH char(10)
		set @MANH = (select MANH from NAM_HOC where TENNH=@TENNH)
	Declare @MAMH char(10)
		set @MAMH = (select MAMONHOC from MONHOC where TEN_MON=@TENMH)
		update DIEM_CHITIET
		set MIENG2 = @DIEM
	where MADIEM=@MADIEM and MAHS=@MAHS and MAMONHOC=@MAMH and MAHK=@MAHK and MANH=@MANH and MIENG1 is not NULL
end
drop proc themdiemMHCTHS_Mieng2
exec themdiemMHCTHS_Mieng2 'DHS006001', 'HS006', N'2018-2019', N'HỌC KỲ 1', N'TOÁN HỌC', '7'
--thêm miệng 3
create proc themdiemMHCTHS_Mieng3(@MADIEM char(10), @MAHS char(10), @TENNH nvarchar(50), @TENHK nvarchar(50), @TENMH nvarchar(50), @DIEM char(10))
as
begin
	DECLARE @MAHK char(10)
		set @MAHK = (select MAHK from HOC_KY where TENHK=@TENHK)
	Declare @MANH char(10)
		set @MANH = (select MANH from NAM_HOC where TENNH=@TENNH)
	Declare @MAMH char(10)
		set @MAMH = (select MAMONHOC from MONHOC where TEN_MON=@TENMH)
		update DIEM_CHITIET
		set MIENG3 = @DIEM
	where MADIEM=@MADIEM and MAHS=@MAHS and MAMONHOC=@MAMH and MAHK=@MAHK and MANH=@MANH and MIENG1 is not NULL and MIENG2 is not NULL
end
drop proc themdiemMHCTHS_Mieng3	
exec themdiemMHCTHS_Mieng3 'DHS006001', 'HS006', N'2018-2019', N'HỌC KỲ 1', N'TOÁN HỌC', '7'
--thêm miệng 4
create proc themdiemMHCTHS_Mieng4(@MADIEM char(10), @MAHS char(10), @TENNH nvarchar(50), @TENHK nvarchar(50), @TENMH nvarchar(50), @DIEM char(10))
as
begin
	DECLARE @MAHK char(10)
		set @MAHK = (select MAHK from HOC_KY where TENHK=@TENHK)
	Declare @MANH char(10)
		set @MANH = (select MANH from NAM_HOC where TENNH=@TENNH)
	Declare @MAMH char(10)
		set @MAMH = (select MAMONHOC from MONHOC where TEN_MON=@TENMH)
		update DIEM_CHITIET
		set MIENG4 = @DIEM
	where MADIEM=@MADIEM and MAHS=@MAHS and MAMONHOC=@MAMH and MAHK=@MAHK and MANH=@MANH and MIENG1 is not NULL and MIENG2 is not NULL and MIENG3 is not NULL
end
drop proc themdiemMHCTHS_Mieng4	
exec themdiemMHCTHS_Mieng4 'DHS006001', 'HS006', N'2018-2019', N'HỌC KỲ 1', N'TOÁN HỌC', '7'

--thêm điểm 15 phút lần 1
create proc themdiemMHCTHS_15Phut1(@MADIEM char(10), @MAHS char(10), @TENNH nvarchar(50), @TENHK nvarchar(50), @TENMH nvarchar(50), @DIEM char(10))
as
begin
	DECLARE @MAHK char(10)
		set @MAHK = (select MAHK from HOC_KY where TENHK=@TENHK)
	Declare @MANH char(10)
		set @MANH = (select MANH from NAM_HOC where TENNH=@TENNH)
	Declare @MAMH char(10)
		set @MAMH = (select MAMONHOC from MONHOC where TEN_MON=@TENMH)
	update DIEM_CHITIET
		set [15PHUT1] = @DIEM
	where MADIEM=@MADIEM and MAHS=@MAHS and MAMONHOC=@MAMH and MAHK=@MAHK and MANH=@MANH
end
drop proc themdiemMHCTHS_15Phut1
exec themdiemMHCTHS_15Phut1 'DHS006001', 'HS006', N'2018-2019', N'HỌC KỲ 1', N'TOÁN HỌC', '7'

--thêm điểm 15 phút lần 2
create proc themdiemMHCTHS_15Phut2(@MADIEM char(10), @MAHS char(10), @TENNH nvarchar(50), @TENHK nvarchar(50), @TENMH nvarchar(50), @DIEM char(10))
as
begin
	DECLARE @MAHK char(10)
		set @MAHK = (select MAHK from HOC_KY where TENHK=@TENHK)
	Declare @MANH char(10)
		set @MANH = (select MANH from NAM_HOC where TENNH=@TENNH)
	Declare @MAMH char(10)
		set @MAMH = (select MAMONHOC from MONHOC where TEN_MON=@TENMH)
	update DIEM_CHITIET
		set [15PHUT2] = @DIEM
	where MADIEM=@MADIEM and MAHS=@MAHS and MAMONHOC=@MAMH and MAHK=@MAHK and MANH=@MANH and [15PHUT1] is not Null
end
drop proc themdiemMHCTHS_15Phut2
exec themdiemMHCTHS_15Phut2 'DHS006001', 'HS006', N'2018-2019', N'HỌC KỲ 1', N'TOÁN HỌC', '7'


--thêm điểm 15 phút lần 3
create proc themdiemMHCTHS_15Phut3(@MADIEM char(10), @MAHS char(10), @TENNH nvarchar(50), @TENHK nvarchar(50), @TENMH nvarchar(50), @DIEM char(10))
as
begin
	DECLARE @MAHK char(10)
		set @MAHK = (select MAHK from HOC_KY where TENHK=@TENHK)
	Declare @MANH char(10)
		set @MANH = (select MANH from NAM_HOC where TENNH=@TENNH)
	Declare @MAMH char(10)
		set @MAMH = (select MAMONHOC from MONHOC where TEN_MON=@TENMH)
	update DIEM_CHITIET
		set [15PHUT3] = @DIEM
	where MADIEM=@MADIEM and MAHS=@MAHS and MAMONHOC=@MAMH and MAHK=@MAHK and MANH=@MANH and [15PHUT1] is not Null and [15PHUT2] is not Null
end
end
drop proc themdiemMHCTHS_15Phut3
exec themdiemMHCTHS_15Phut3 'DHS006001', 'HS006', N'2018-2019', N'HỌC KỲ 1', N'TOÁN HỌC', '7'



--thêm điểm 45 phút lần 1
create proc themdiemMHCTHS_45Phut1(@MADIEM char(10), @MAHS char(10), @TENNH nvarchar(50), @TENHK nvarchar(50), @TENMH nvarchar(50), @DIEM char(10))
as
begin
	DECLARE @MAHK char(10)
		set @MAHK = (select MAHK from HOC_KY where TENHK=@TENHK)
	Declare @MANH char(10)
		set @MANH = (select MANH from NAM_HOC where TENNH=@TENNH)
	Declare @MAMH char(10)
		set @MAMH = (select MAMONHOC from MONHOC where TEN_MON=@TENMH)
	update DIEM_CHITIET
		set [45PHUT1] = @DIEM
	where MADIEM=@MADIEM and MAHS=@MAHS and MAMONHOC=@MAMH and MAHK=@MAHK and MANH=@MANH
end
drop proc themdiemMHCTHS_45Phut1
exec themdiemMHCTHS_45Phut1 'DHS006001', 'HS006', N'2018-2019', N'HỌC KỲ 1', N'TOÁN HỌC', '7'

--thêm điểm 45 phút lần 2
create proc themdiemMHCTHS_45Phut2(@MADIEM char(10), @MAHS char(10), @TENNH nvarchar(50), @TENHK nvarchar(50), @TENMH nvarchar(50), @DIEM char(10))
as
begin
	DECLARE @MAHK char(10)
		set @MAHK = (select MAHK from HOC_KY where TENHK=@TENHK)
	Declare @MANH char(10)
		set @MANH = (select MANH from NAM_HOC where TENNH=@TENNH)
	Declare @MAMH char(10)
		set @MAMH = (select MAMONHOC from MONHOC where TEN_MON=@TENMH)
	update DIEM_CHITIET
		set [45PHUT2] = @DIEM
	where MADIEM=@MADIEM and MAHS=@MAHS and MAMONHOC=@MAMH and MAHK=@MAHK and MANH=@MANH
end
drop proc themdiemMHCTHS_45Phut2
exec themdiemMHCTHS_45Phut2 'DHS006001', 'HS006', N'2018-2019', N'HỌC KỲ 1', N'TOÁN HỌC', '7'

--thêm điểm cuối kỳ
create proc themdiemMHCTHS_CuoiKy(@MADIEM char(10), @MAHS char(10), @TENNH nvarchar(50), @TENHK nvarchar(50), @TENMH nvarchar(50), @DIEM char(10))
as
begin
	DECLARE @MAHK char(10)
		set @MAHK = (select MAHK from HOC_KY where TENHK=@TENHK)
	Declare @MANH char(10)
		set @MANH = (select MANH from NAM_HOC where TENNH=@TENNH)
	Declare @MAMH char(10)
		set @MAMH = (select MAMONHOC from MONHOC where TEN_MON=@TENMH)
	update DIEM_CHITIET
		set CUOIKY = @DIEM
	where MADIEM=@MADIEM and MAHS=@MAHS and MAMONHOC=@MAMH and MAHK=@MAHK and MANH=@MANH
	update DIEM_CHITIET set TB = (select 
			(cast(MIENG1 as float)+cast(MIENG2 as float)+cast(MIENG3 as float)+cast(MIENG4 as float)
			+cast([15phut1] as float)+cast([15phut2] as float)+cast([15phut3] as float)
			+((cast([45phut1] as float)+cast([45phut2] as float))*2)
			+(cast(CUOIKY as float)*3))/14 
			from DIEM_CHITIET D
			where M.MAMONHOC = D.MAMONHOC and D.MANH=N.MANH and HK.MAHK=D.MAHK and D.MAHS=H.MAHS and TENHK=@TENHK and TENNH=@TENNH and MADIEM=@MADIEM and MAHS=@MAHS)
			from MONHOC M, NAM_HOC N, HOC_KY HK, HOCSINH H
			where DIEM_CHITIET.MAMONHOC = M.MAMONHOC and DIEM_CHITIET.MAHS=H.MAHS and DIEM_CHITIET.MAHK=HK.MAHK and DIEM_CHITIET.MANH=N.MANH
					and  TENHK = @TENHK and TENNH = @TENNH and MADIEM=@MADIEM and  DIEM_CHITIET.MAHS=@MAHS
	
end
drop proc themdiemMHCTHS_CuoiKy
exec themdiemMHCTHS_CuoiKy 'DHS006001', 'HS006', N'2018-2019', N'HỌC KỲ 1', N'TOÁN HỌC', '7'



--hiển thị điểm TKHK của học sinh
create proc diemTKHKHS(@MAHS char(10), @TENHK nvarchar(50), @TENNH nvarchar(50))
as
begin
	select MADIEM_TKHK as 'Mã Điểm', DIEMTK as 'Điểm Tổng Kết'
	from DIEM_TKHK D, NAM_HOC N, HOC_KY HK, HOCSINH H
	where D.MAHS = H.MAHS and D.MAHK=HK.MAHK and D.MANH=N.MANH
		--and D.MAHS = 'HS005' and TENHK = N'HỌC KỲ 1' and TENNH = N'2018-2019'
		and D.MAHS = @MAHS and TENHK = @TENHK and TENNH = @TENNH
end

exec diemTKHKHS 'HS001', N'HỌC KỲ 1', N'2018-2019'

-- khởi tạo nơi chứa điểm tổng kết học kỳ của học sinh vào đầu năm học
create proc themdiemTKHKCTHS(@MADIEM char(10), @MAHS char(10), @TENNH nvarchar(50), @TENHK nvarchar(50))
as
begin
	DECLARE @MAHK char(10)
		set @MAHK = (select MAHK from HOC_KY where TENHK=@TENHK)
	Declare @MANH char(10)
		set @MANH = (select MANH from NAM_HOC where TENNH=@TENNH)
	insert into DIEM_TKHK(MADIEM_TKHK, MAHS,MAHK, MANH)
		values (@MADIEM, @MAHS, @MAHK, @MANH)
	update DIEM_TKHK
		set DIEMTK = (select Sum(TB)/14 from DIEM_CHITIET D where MAHK=@MAHK and MANH=@MANH and MAHS=@MAHS)
	where  MAHK=@MAHK and MANH=@MANH and MAHS=@MAHS
end
drop proc themdiemTKHKCTHS
exec themdiemTKHKCTHS 'DHS006001', 'HS006', N'2018-2019', N'HỌC KỲ 1'


--Tính điểm cả năm
create proc themdiemTKCNCTHS(@MADIEM char(10), @MAHS char(10), @TENNH nvarchar(50))
as
begin
	Declare @MANH char(10)
		set @MANH = (select MANH from NAM_HOC where TENNH=@TENNH)
	insert into DIEM_TKCN(MADIEM_TKCN, MAHS, MANH)
		values (@MADIEM, @MAHS, @MANH)
	update DIEM_TKHK
		set DIEMTK = (select Sum(DIEMTK*HESO)/Sum(HESO) from DIEM_TKHK D, HOC_KY H where H.MAHK=D.MAHK and MANH=@MANH and MAHS=@MAHS)
	where MANH=@MANH and MAHS=@MAHS
end
drop proc themdiemTKCNCTHS
exec themdiemTKCNCTHS 'DTKHS00601', 'HS006', N'2018-2019'



create proc diemTKCNHS(@MAHS char(10), @TENNH char(10))
as
begin
	select MADIEM_TKCN as 'Mã Điểm', DIEM_TKCN as 'Điểm Tổng Kết'
	from DIEM_TKCN D, NAM_HOC N, HOCSINH H
	where D.MAHS = H.MAHS and D.MANH=N.MANH
		and D.MAHS = @MAHS and TENNH = @TENNH
end


exec diemTKCNHS '', N''
--tính điểm trung bình học kì của học sinh
