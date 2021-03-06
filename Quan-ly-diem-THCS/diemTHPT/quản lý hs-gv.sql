
ALTER DATABASE QL_HS_GV SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE QL_HS_GV SET ANSI_NULLS OFF 
GO
ALTER DATABASE QL_HS_GV SET ANSI_PADDING OFF 
GO
ALTER DATABASE QL_HS_GV SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE QL_HS_GV SET ARITHABORT OFF 
GO
ALTER DATABASE QL_HS_GV SET AUTO_CLOSE OFF 
GO
ALTER DATABASE QL_HS_GV SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE QL_HS_GV SET AUTO_SHRINK OFF 
GO
ALTER DATABASE QL_HS_GV SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE QL_HS_GV SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE QL_HS_GV SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE QL_HS_GV SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE QL_HS_GV SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE QL_HS_GV SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE QL_HS_GV SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE QL_HS_GV SET  DISABLE_BROKER 
GO
ALTER DATABASE QL_HS_GV SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE QL_HS_GV SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE QL_HS_GV SET TRUSTWORTHY OFF 
GO
ALTER DATABASE QL_HS_GV SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE QL_HS_GV SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE QL_HS_GV SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE QL_HS_GV SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE QL_HS_GV SET RECOVERY SIMPLE 
GO
ALTER DATABASE QL_HS_GV SET  MULTI_USER 
GO
ALTER DATABASE QL_HS_GV SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE QL_HS_GV SET DB_CHAINING OFF 
GO
ALTER DATABASE QL_HS_GV SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE QL_HS_GV SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE QL_HS_GV
GO
/****** Object:  StoredProcedure [dbo].[dsDiemMHHS]    Script Date: 6/1/2019 11:06:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[dsDiemMHHS](@TENNH nvarchar(50), @TENHK nvarchar(50), @MAHS char(10))
as
begin
			
	select M.MAMONHOC as 'Mã Môn Học', TEN_MON as 'Tên Môn Học', CAST(MIENG1 AS CHAR(10)) + ' '+CAST(MIENG2 AS CHAR(10)) +' ' +CAST(MIENG3 AS CHAR(10)) +' '+ CAST(MIENG4 AS CHAR(10)) AS 'Miệng', CAST([15PHUT1] AS CHAR(10))+' ' +CAST([15PHUT2] AS CHAR(10))+' '+CAST([15PHUT3] AS CHAR(10)) as '15 phút', CAST([45PHUT1] AS CHAR(10))+' '+CAST([45PHUT2] AS CHAR(10)) as '45 phút', CUOIKY as 'Cuối Kỳ', TB as 'Điểm TBHK Môn'
	from  HOCSINH H, NAM_HOC NH, HOC_KY HK,  DIEM_CHITIET D, MONHOC M
	where H.MAHS = D.MAHS AND NH.MANH=D.MANH AND HK.MAHK=D.MAHK AND D.MAMONHOC=M.MAMONHOC and TENNH=@TENNH 
	
	
	and TENHK=@TENHK and H.MAHS=@MAHS
end				
GO
/****** Object:  StoredProcedure [dbo].[dsDiemMHLOP]    Script Date: 6/1/2019 11:06:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[dsDiemMHLOP](@TENNH nvarchar(50), @TENHK nvarchar(50), @TENMON nvarchar(50), @TENLOP nvarchar(50))
as
begin
	select HS.MAHS AS 'Mã Học Sinh', HOHS+' '+TENHS as 'Họ Và tên',MIENG1 + ' '+MIENG2+' ' +MIENG3+' '+MIENG4 AS 'Miệng', [15PHUT1]+' ' +[15PHUT2]+' '+[15PHUT3] as '15 phút', [45PHUT1]+' '+[45PHUT2] as '45 phút', CUOIKY as 'Cuối Kỳ', TB as 'Điểm TB Môn'
	from DIEM_CHITIET D, MONHOC M, HOC_KY H, NAM_HOC N, HOCSINH HS, DS_HS_LOP DS, LOP L
	where HS.MAHS=D.MAHS and D.MAHK=H.MAHK and D.MANH=N.MANH and D.MAMONHOC=M.MAMONHOC
			and DS.MAHS=HS.MAHS and DS.MALOP=L.MALOP and H.MAHK=DS.MAHK and N.MANH=DS.MANH
		--and TEN_MON=N'TOÁN HỌC' and TENHK=N'HỌC KỲ 1' and TENNH=N'2018-2019' and TENLOP=N'LỚP 10A1'
		and TEN_MON=@TENMON and TENHK=@TENHK and TENNH=@TENNH and TENLOP=@TENLOP
end
GO
/****** Object:  StoredProcedure [dbo].[HT_MAHS]    Script Date: 6/1/2019 11:06:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[HT_MAHS](@MAHS char(10))
as
begin
	select MAHS from HOCSINH Where MAHS = @MAHS
end
GO
/****** Object:  StoredProcedure [dbo].[suaHSDSLop]    Script Date: 6/1/2019 11:06:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[suaHSDSLop](@TENNH nvarchar(50), @TENHK nvarchar(50), @MAHS char(10), @TENLOP nvarchar(50))
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
GO
/****** Object:  StoredProcedure [dbo].[suaLop]    Script Date: 6/1/2019 11:06:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[suaLop](@TenLop nvarchar(50), @TenHK nvarchar(50), @TenNH nvarchar(50), @MALT char(10), @MAGVCN char(10))
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
GO
/****** Object:  StoredProcedure [dbo].[THEM_GIAOVIEN]    Script Date: 6/1/2019 11:06:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[THEM_GIAOVIEN]
	@MAGV CHAR(10),
	@HOGV NVARCHAR(50),
	@TENGV NVARCHAR(50),
	@NS DATE,
	@GT NVARCHAR(10),
	@DC NVARCHAR(500),
	@SDT INT,
	@MA_BO_MON CHAR(10)
AS
BEGIN
	INSERT INTO GIAOVIEN(MAGV, HOGV, TENGV, NS, GT, DC, SDT, MA_BO_MON)
	VALUES(@MAGV, @HOGV, @TENGV, @NS, @GT, @DC, @SDT, @MA_BO_MON)
END



GO
/****** Object:  StoredProcedure [dbo].[ThemDSHSLOP]    Script Date: 6/1/2019 11:06:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[ThemDSHSLOP](@TENNH nvarchar(50), @TENHK nvarchar(50), @TENLOP nvarchar(50), @MAHS char(10))
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
GO
/****** Object:  StoredProcedure [dbo].[themLop]    Script Date: 6/1/2019 11:06:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[themLop](@TENHK nvarchar(50),@TENNH nvarchar(50),@TENLOP nvarchar(50),@MALT char(10), @MAGVCN char(10))
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
GO
/****** Object:  StoredProcedure [dbo].[tinhdiemTBHKMon]    Script Date: 6/1/2019 11:06:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[tinhdiemTBHKMon](@TENNH nvarchar(50), @TENHK nvarchar(50))
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
GO
/****** Object:  StoredProcedure [dbo].[xoaHSDSLOP]    Script Date: 6/1/2019 11:06:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[xoaHSDSLOP](@TENNH nvarchar(50), @TENHK nvarchar(50), @MAHS char(10), @TENLOP nvarchar(50))
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
GO
/****** Object:  StoredProcedure [dbo].[xoaLop]    Script Date: 6/1/2019 11:06:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[xoaLop](@TenLop nvarchar(50), @TenNH nvarchar(50), @TenHK nvarchar(50))
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
GO
/****** Object:  Table [dbo].[CHUYEN]    Script Date: 6/1/2019 11:06:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CHUYEN](
	[MA_CHUYEN] [char](10) NOT NULL,
	[TEN_CHUYEN] [nvarchar](50) NULL,
 CONSTRAINT [PK_CHUYEN] PRIMARY KEY CLUSTERED 
(
	[MA_CHUYEN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DIEM_CHITIET]    Script Date: 6/1/2019 11:06:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DIEM_CHITIET](
	[MADIEM] [char](10) NOT NULL,
	[MAHS] [char](10) NULL,
	[MAMONHOC] [char](10) NULL,
	[MAHK] [char](10) NULL,
	[MANH] [char](10) NULL,
	[MIENG1] [char](10) NULL,
	[MIENG2] [char](10) NULL,
	[MIENG3] [char](10) NULL,
	[MIENG4] [char](10) NULL,
	[15PHUT1] [char](10) NULL,
	[15PHUT2] [char](10) NULL,
	[15PHUT3] [char](10) NULL,
	[45PHUT1] [char](10) NULL,
	[45PHUT2] [char](10) NULL,
	[CUOIKY] [char](10) NULL,
	[TB] [float] NULL,
 CONSTRAINT [PK_DIEM_CHITIET_1] PRIMARY KEY CLUSTERED 
(
	[MADIEM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DIEM_TKCN]    Script Date: 6/1/2019 11:06:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DIEM_TKCN](
	[MADIEM_TKCN] [char](10) NOT NULL,
	[MAHS] [char](10) NULL,
	[MANH] [char](10) NULL,
	[DIEM_TKCN] [float] NULL,
 CONSTRAINT [PK_DIEM_TKCN] PRIMARY KEY CLUSTERED 
(
	[MADIEM_TKCN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DIEM_TKHK]    Script Date: 6/1/2019 11:06:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DIEM_TKHK](
	[MADIEM_TKHK] [char](10) NOT NULL,
	[MAHS] [char](10) NULL,
	[MAHK] [char](10) NULL,
	[MANH] [char](10) NULL,
	[DIEMTK] [float] NULL,
 CONSTRAINT [PK_DIEM_TKHK] PRIMARY KEY CLUSTERED 
(
	[MADIEM_TKHK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DS_HS_LOP]    Script Date: 6/1/2019 11:06:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DS_HS_LOP](
	[MAHS] [char](10) NOT NULL,
	[MALOP] [char](10) NOT NULL,
	[MAHK] [char](10) NOT NULL,
	[MANH] [char](10) NOT NULL,
 CONSTRAINT [PK_DS_HS_LOP] PRIMARY KEY CLUSTERED 
(
	[MAHS] ASC,
	[MALOP] ASC,
	[MAHK] ASC,
	[MANH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GIAOVIEN]    Script Date: 6/1/2019 11:06:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GIAOVIEN](
	[MAGV] [char](10) NOT NULL,
	[HOGV] [nvarchar](50) NULL,
	[TENGV] [nvarchar](50) NULL,
	[NS] [date] NULL,
	[GT] [nvarchar](10) NULL,
	[DC] [nvarchar](500) NULL,
	[SDT] [char](10) NULL,
	[MAMONHOC] [char](10) NULL,
 CONSTRAINT [PK_GIAOVIEN] PRIMARY KEY CLUSTERED 
(
	[MAGV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HOC_KY]    Script Date: 6/1/2019 11:06:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HOC_KY](
	[MAHK] [char](10) NOT NULL,
	[TENHK] [nvarchar](50) NULL,
	[HESO] [int] NULL,
 CONSTRAINT [PK_HOC_KY] PRIMARY KEY CLUSTERED 
(
	[MAHK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HOCSINH]    Script Date: 6/1/2019 11:06:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HOCSINH](
	[MAHS] [char](10) NOT NULL,
	[HOHS] [nvarchar](50) NULL,
	[TENHS] [nvarchar](50) NULL,
	[NS] [datetime] NULL,
	[GT] [nvarchar](10) NULL,
	[DC] [nvarchar](500) NULL,
	[SDT] [nchar](10) NULL,
	[HOTEN_BO] [nvarchar](50) NULL,
	[NN_BO] [nvarchar](500) NULL,
	[HOTEN_ME] [nvarchar](50) NULL,
	[NN_ME] [nvarchar](500) NULL,
 CONSTRAINT [PK_HOCSINH] PRIMARY KEY CLUSTERED 
(
	[MAHS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KHOI]    Script Date: 6/1/2019 11:06:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[KHOI](
	[MAKHOI] [char](10) NOT NULL,
	[TENKHOI] [nvarchar](50) NULL,
	[SL_LOP] [int] NULL,
 CONSTRAINT [PK_KHOI] PRIMARY KEY CLUSTERED 
(
	[MAKHOI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LOP]    Script Date: 6/1/2019 11:06:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LOP](
	[MALOP] [char](10) NOT NULL,
	[TENLOP] [nvarchar](50) NULL,
	[MA_CHUYEN] [char](10) NULL,
	[MAKHOI] [char](10) NULL,
 CONSTRAINT [PK_LOP] PRIMARY KEY CLUSTERED 
(
	[MALOP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MONHOC]    Script Date: 6/1/2019 11:06:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MONHOC](
	[MAMONHOC] [char](10) NOT NULL,
	[TEN_MON] [nvarchar](50) NULL,
	[HESO] [int] NULL,
 CONSTRAINT [PK_BOMON] PRIMARY KEY CLUSTERED 
(
	[MAMONHOC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NAM_HOC]    Script Date: 6/1/2019 11:06:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NAM_HOC](
	[MANH] [char](10) NOT NULL,
	[TENNH] [nvarchar](50) NULL,
 CONSTRAINT [PK_NAM_HOC] PRIMARY KEY CLUSTERED 
(
	[MANH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PHAN_CONG]    Script Date: 6/1/2019 11:06:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PHAN_CONG](
	[MAGV] [char](10) NOT NULL,
	[MALOP] [char](10) NOT NULL,
	[TG] [nvarchar](500) NULL,
 CONSTRAINT [PK_PHAN_CONG] PRIMARY KEY CLUSTERED 
(
	[MAGV] ASC,
	[MALOP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TT_LOP]    Script Date: 6/1/2019 11:06:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TT_LOP](
	[MALOP] [char](10) NOT NULL,
	[MA_GVCN] [char](10) NULL,
	[MA_LOP_TR] [char](10) NULL,
	[SYSO] [int] NULL,
	[MAHK] [char](10) NOT NULL,
	[MANH] [char](10) NOT NULL,
 CONSTRAINT [PK_TT_LOP] PRIMARY KEY CLUSTERED 
(
	[MALOP] ASC,
	[MAHK] ASC,
	[MANH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[CHUYEN] ([MA_CHUYEN], [TEN_CHUYEN]) VALUES (N'CK001     ', N'TOÁN-LÝ-ANH')
INSERT [dbo].[CHUYEN] ([MA_CHUYEN], [TEN_CHUYEN]) VALUES (N'CK002     ', N'TOÁN-LÝ-HÓA')
INSERT [dbo].[CHUYEN] ([MA_CHUYEN], [TEN_CHUYEN]) VALUES (N'CK003     ', N'TOÁN-HÓA-SINH')
INSERT [dbo].[CHUYEN] ([MA_CHUYEN], [TEN_CHUYEN]) VALUES (N'CK004     ', N'VĂN-SỬ-ĐỊA')
INSERT [dbo].[CHUYEN] ([MA_CHUYEN], [TEN_CHUYEN]) VALUES (N'CK005     ', N'TOÁN-ANH-VĂN')
INSERT [dbo].[DIEM_CHITIET] ([MADIEM], [MAHS], [MAMONHOC], [MAHK], [MANH], [MIENG1], [MIENG2], [MIENG3], [MIENG4], [15PHUT1], [15PHUT2], [15PHUT3], [45PHUT1], [45PHUT2], [CUOIKY], [TB]) VALUES (N'DHS001001 ', N'HS001     ', N'BM001     ', N'HK001     ', N'NH001     ', N'9         ', N'9         ', N'9         ', N'9         ', N'9         ', N'9         ', N'9         ', N'9         ', N'9         ', N'10        ', 9.2142857142857135)
INSERT [dbo].[DIEM_CHITIET] ([MADIEM], [MAHS], [MAMONHOC], [MAHK], [MANH], [MIENG1], [MIENG2], [MIENG3], [MIENG4], [15PHUT1], [15PHUT2], [15PHUT3], [45PHUT1], [45PHUT2], [CUOIKY], [TB]) VALUES (N'DHS001002 ', N'HS001     ', N'BM002     ', N'HK001     ', N'NH001     ', N'6         ', N'7         ', N'9         ', N'9         ', N'9         ', N'9         ', N'9         ', N'6         ', N'9         ', N'10        ', 8.4285714285714288)
INSERT [dbo].[DIEM_CHITIET] ([MADIEM], [MAHS], [MAMONHOC], [MAHK], [MANH], [MIENG1], [MIENG2], [MIENG3], [MIENG4], [15PHUT1], [15PHUT2], [15PHUT3], [45PHUT1], [45PHUT2], [CUOIKY], [TB]) VALUES (N'DHS001003 ', N'HS001     ', N'BM003     ', N'HK001     ', N'NH001     ', N'5         ', N'5         ', N'9         ', N'9         ', N'9         ', N'9         ', N'9         ', N'10        ', N'9         ', N'10        ', 8.7857142857142865)
INSERT [dbo].[DIEM_CHITIET] ([MADIEM], [MAHS], [MAMONHOC], [MAHK], [MANH], [MIENG1], [MIENG2], [MIENG3], [MIENG4], [15PHUT1], [15PHUT2], [15PHUT3], [45PHUT1], [45PHUT2], [CUOIKY], [TB]) VALUES (N'DHS001004 ', N'HS001     ', N'BM004     ', N'HK001     ', N'NH001     ', N'3         ', N'5         ', N'9         ', N'9         ', N'9         ', N'9         ', N'9         ', N'1         ', N'9         ', N'10        ', 7.3571428571428568)
INSERT [dbo].[DIEM_CHITIET] ([MADIEM], [MAHS], [MAMONHOC], [MAHK], [MANH], [MIENG1], [MIENG2], [MIENG3], [MIENG4], [15PHUT1], [15PHUT2], [15PHUT3], [45PHUT1], [45PHUT2], [CUOIKY], [TB]) VALUES (N'DHS001005 ', N'HS001     ', N'BM005     ', N'HK001     ', N'NH001     ', N'5         ', N'6         ', N'9         ', N'9         ', N'9         ', N'9         ', N'9         ', N'9         ', N'9         ', N'10        ', 8.7142857142857135)
INSERT [dbo].[DIEM_CHITIET] ([MADIEM], [MAHS], [MAMONHOC], [MAHK], [MANH], [MIENG1], [MIENG2], [MIENG3], [MIENG4], [15PHUT1], [15PHUT2], [15PHUT3], [45PHUT1], [45PHUT2], [CUOIKY], [TB]) VALUES (N'DHS001006 ', N'HS001     ', N'BM006     ', N'HK001     ', N'NH001     ', N'2         ', N'5         ', N'9         ', N'9         ', N'9         ', N'9         ', N'9         ', N'9         ', N'9         ', N'10        ', 8.4285714285714288)
INSERT [dbo].[DIEM_CHITIET] ([MADIEM], [MAHS], [MAMONHOC], [MAHK], [MANH], [MIENG1], [MIENG2], [MIENG3], [MIENG4], [15PHUT1], [15PHUT2], [15PHUT3], [45PHUT1], [45PHUT2], [CUOIKY], [TB]) VALUES (N'DHS001007 ', N'HS001     ', N'BM007     ', N'HK001     ', N'NH001     ', N'3         ', N'6         ', N'9         ', N'8         ', N'9         ', N'9         ', N'9         ', N'9         ', N'9         ', N'10        ', 8.5)
INSERT [dbo].[DIEM_CHITIET] ([MADIEM], [MAHS], [MAMONHOC], [MAHK], [MANH], [MIENG1], [MIENG2], [MIENG3], [MIENG4], [15PHUT1], [15PHUT2], [15PHUT3], [45PHUT1], [45PHUT2], [CUOIKY], [TB]) VALUES (N'DHS001008 ', N'HS001     ', N'BM008     ', N'HK001     ', N'NH001     ', N'5         ', N'5         ', N'9         ', N'8         ', N'9         ', N'9         ', N'9         ', N'9         ', N'9         ', N'10        ', 8.5714285714285712)
INSERT [dbo].[DIEM_CHITIET] ([MADIEM], [MAHS], [MAMONHOC], [MAHK], [MANH], [MIENG1], [MIENG2], [MIENG3], [MIENG4], [15PHUT1], [15PHUT2], [15PHUT3], [45PHUT1], [45PHUT2], [CUOIKY], [TB]) VALUES (N'DHS001009 ', N'HS001     ', N'BM009     ', N'HK001     ', N'NH001     ', N'3         ', N'6         ', N'9         ', N'8         ', N'9         ', N'9         ', N'9         ', N'9         ', N'9         ', N'10        ', 8.5)
INSERT [dbo].[DIEM_CHITIET] ([MADIEM], [MAHS], [MAMONHOC], [MAHK], [MANH], [MIENG1], [MIENG2], [MIENG3], [MIENG4], [15PHUT1], [15PHUT2], [15PHUT3], [45PHUT1], [45PHUT2], [CUOIKY], [TB]) VALUES (N'DHS001010 ', N'HS001     ', N'BM010     ', N'HK001     ', N'NH001     ', N'5         ', N'5         ', N'9         ', N'8         ', N'9         ', N'9         ', N'9         ', N'9         ', N'9         ', N'8         ', 8.1428571428571424)
INSERT [dbo].[DIEM_CHITIET] ([MADIEM], [MAHS], [MAMONHOC], [MAHK], [MANH], [MIENG1], [MIENG2], [MIENG3], [MIENG4], [15PHUT1], [15PHUT2], [15PHUT3], [45PHUT1], [45PHUT2], [CUOIKY], [TB]) VALUES (N'DHS001011 ', N'HS001     ', N'BM011     ', N'HK001     ', N'NH001     ', N'3         ', N'6         ', N'9         ', N'7         ', N'9         ', N'9         ', N'9         ', N'9         ', N'9         ', N'8         ', 8)
INSERT [dbo].[DIEM_CHITIET] ([MADIEM], [MAHS], [MAMONHOC], [MAHK], [MANH], [MIENG1], [MIENG2], [MIENG3], [MIENG4], [15PHUT1], [15PHUT2], [15PHUT3], [45PHUT1], [45PHUT2], [CUOIKY], [TB]) VALUES (N'DHS001012 ', N'HS001     ', N'BM012     ', N'HK001     ', N'NH001     ', N'6         ', N'5         ', N'9         ', N'7         ', N'9         ', N'9         ', N'9         ', N'10        ', N'9         ', N'8         ', 8.2857142857142865)
INSERT [dbo].[DIEM_CHITIET] ([MADIEM], [MAHS], [MAMONHOC], [MAHK], [MANH], [MIENG1], [MIENG2], [MIENG3], [MIENG4], [15PHUT1], [15PHUT2], [15PHUT3], [45PHUT1], [45PHUT2], [CUOIKY], [TB]) VALUES (N'DHS001013 ', N'HS001     ', N'BM013     ', N'HK001     ', N'NH001     ', N'2         ', N'6         ', N'9         ', N'7         ', N'9         ', N'9         ', N'9         ', N'10        ', N'9         ', N'8         ', 8.0714285714285712)
INSERT [dbo].[DIEM_CHITIET] ([MADIEM], [MAHS], [MAMONHOC], [MAHK], [MANH], [MIENG1], [MIENG2], [MIENG3], [MIENG4], [15PHUT1], [15PHUT2], [15PHUT3], [45PHUT1], [45PHUT2], [CUOIKY], [TB]) VALUES (N'DHS001014 ', N'HS001     ', N'BM014     ', N'HK001     ', N'NH001     ', N'5         ', N'5         ', N'9         ', N'7         ', N'9         ', N'8         ', N'9         ', N'10        ', N'9         ', N'8         ', 8.1428571428571424)
INSERT [dbo].[DIEM_CHITIET] ([MADIEM], [MAHS], [MAMONHOC], [MAHK], [MANH], [MIENG1], [MIENG2], [MIENG3], [MIENG4], [15PHUT1], [15PHUT2], [15PHUT3], [45PHUT1], [45PHUT2], [CUOIKY], [TB]) VALUES (N'DHS001015 ', N'HS001     ', N'BM001     ', N'HK002     ', N'NH001     ', N'3         ', N'6         ', N'9         ', N'7         ', N'9         ', N'8         ', N'9         ', N'10        ', N'9         ', N'8         ', 8.0714285714285712)
INSERT [dbo].[DIEM_CHITIET] ([MADIEM], [MAHS], [MAMONHOC], [MAHK], [MANH], [MIENG1], [MIENG2], [MIENG3], [MIENG4], [15PHUT1], [15PHUT2], [15PHUT3], [45PHUT1], [45PHUT2], [CUOIKY], [TB]) VALUES (N'DHS001016 ', N'HS001     ', N'BM002     ', N'HK002     ', N'NH001     ', N'9         ', N'5         ', N'9         ', N'7         ', N'9         ', N'8         ', N'9         ', N'10        ', N'9         ', N'8         ', 8.4285714285714288)
INSERT [dbo].[DIEM_CHITIET] ([MADIEM], [MAHS], [MAMONHOC], [MAHK], [MANH], [MIENG1], [MIENG2], [MIENG3], [MIENG4], [15PHUT1], [15PHUT2], [15PHUT3], [45PHUT1], [45PHUT2], [CUOIKY], [TB]) VALUES (N'DHS001017 ', N'HS001     ', N'BM003     ', N'HK002     ', N'NH001     ', N'9         ', N'6         ', N'9         ', N'7         ', N'9         ', N'8         ', N'9         ', N'10        ', N'9         ', N'8         ', 8.5)
INSERT [dbo].[DIEM_CHITIET] ([MADIEM], [MAHS], [MAMONHOC], [MAHK], [MANH], [MIENG1], [MIENG2], [MIENG3], [MIENG4], [15PHUT1], [15PHUT2], [15PHUT3], [45PHUT1], [45PHUT2], [CUOIKY], [TB]) VALUES (N'DHS001018 ', N'HS001     ', N'BM004     ', N'HK002     ', N'NH001     ', N'9         ', N'5         ', N'9         ', N'7         ', N'9         ', N'8         ', N'9         ', N'10        ', N'9         ', N'8         ', 8.4285714285714288)
INSERT [dbo].[DIEM_CHITIET] ([MADIEM], [MAHS], [MAMONHOC], [MAHK], [MANH], [MIENG1], [MIENG2], [MIENG3], [MIENG4], [15PHUT1], [15PHUT2], [15PHUT3], [45PHUT1], [45PHUT2], [CUOIKY], [TB]) VALUES (N'DHS001019 ', N'HS001     ', N'BM005     ', N'HK002     ', N'NH001     ', N'9         ', N'6         ', N'9         ', N'7         ', N'9         ', N'8         ', N'9         ', N'3         ', N'9         ', N'8         ', 7.5)
INSERT [dbo].[DIEM_CHITIET] ([MADIEM], [MAHS], [MAMONHOC], [MAHK], [MANH], [MIENG1], [MIENG2], [MIENG3], [MIENG4], [15PHUT1], [15PHUT2], [15PHUT3], [45PHUT1], [45PHUT2], [CUOIKY], [TB]) VALUES (N'DHS001020 ', N'HS001     ', N'BM006     ', N'HK002     ', N'NH001     ', N'9         ', N'5         ', N'9         ', N'8         ', N'9         ', N'8         ', N'9         ', N'3         ', N'9         ', N'8         ', 7.5)
INSERT [dbo].[DIEM_CHITIET] ([MADIEM], [MAHS], [MAMONHOC], [MAHK], [MANH], [MIENG1], [MIENG2], [MIENG3], [MIENG4], [15PHUT1], [15PHUT2], [15PHUT3], [45PHUT1], [45PHUT2], [CUOIKY], [TB]) VALUES (N'DHS001021 ', N'HS001     ', N'BM007     ', N'HK002     ', N'NH001     ', N'8         ', N'6         ', N'9         ', N'5         ', N'9         ', N'8         ', N'9         ', N'3         ', N'9         ', N'8         ', 7.2857142857142856)
INSERT [dbo].[DIEM_CHITIET] ([MADIEM], [MAHS], [MAMONHOC], [MAHK], [MANH], [MIENG1], [MIENG2], [MIENG3], [MIENG4], [15PHUT1], [15PHUT2], [15PHUT3], [45PHUT1], [45PHUT2], [CUOIKY], [TB]) VALUES (N'DHS001022 ', N'HS001     ', N'BM008     ', N'HK002     ', N'NH001     ', N'8         ', N'5         ', N'8         ', N'5         ', N'9         ', N'6         ', N'9         ', N'3         ', N'9         ', N'8         ', 7)
INSERT [dbo].[DIEM_CHITIET] ([MADIEM], [MAHS], [MAMONHOC], [MAHK], [MANH], [MIENG1], [MIENG2], [MIENG3], [MIENG4], [15PHUT1], [15PHUT2], [15PHUT3], [45PHUT1], [45PHUT2], [CUOIKY], [TB]) VALUES (N'DHS001023 ', N'HS001     ', N'BM009     ', N'HK002     ', N'NH001     ', N'7         ', N'6         ', N'8         ', N'5         ', N'9         ', N'6         ', N'9         ', N'3         ', N'9         ', N'8         ', 7)
INSERT [dbo].[DIEM_CHITIET] ([MADIEM], [MAHS], [MAMONHOC], [MAHK], [MANH], [MIENG1], [MIENG2], [MIENG3], [MIENG4], [15PHUT1], [15PHUT2], [15PHUT3], [45PHUT1], [45PHUT2], [CUOIKY], [TB]) VALUES (N'DHS001024 ', N'HS001     ', N'BM010     ', N'HK002     ', N'NH001     ', N'8         ', N'5         ', N'8         ', N'5         ', N'9         ', N'6         ', N'9         ', N'3         ', N'9         ', N'8         ', 7)
INSERT [dbo].[DIEM_CHITIET] ([MADIEM], [MAHS], [MAMONHOC], [MAHK], [MANH], [MIENG1], [MIENG2], [MIENG3], [MIENG4], [15PHUT1], [15PHUT2], [15PHUT3], [45PHUT1], [45PHUT2], [CUOIKY], [TB]) VALUES (N'DHS001025 ', N'HS001     ', N'BM011     ', N'HK002     ', N'NH001     ', N'7         ', N'6         ', N'8         ', N'5         ', N'9         ', N'6         ', N'7         ', N'3         ', N'9         ', N'8         ', 6.8571428571428568)
INSERT [dbo].[DIEM_CHITIET] ([MADIEM], [MAHS], [MAMONHOC], [MAHK], [MANH], [MIENG1], [MIENG2], [MIENG3], [MIENG4], [15PHUT1], [15PHUT2], [15PHUT3], [45PHUT1], [45PHUT2], [CUOIKY], [TB]) VALUES (N'DHS001026 ', N'HS001     ', N'BM012     ', N'HK002     ', N'NH001     ', N'8         ', N'5         ', N'8         ', N'5         ', N'9         ', N'6         ', N'7         ', N'3         ', N'9         ', N'8         ', 6.8571428571428568)
INSERT [dbo].[DIEM_CHITIET] ([MADIEM], [MAHS], [MAMONHOC], [MAHK], [MANH], [MIENG1], [MIENG2], [MIENG3], [MIENG4], [15PHUT1], [15PHUT2], [15PHUT3], [45PHUT1], [45PHUT2], [CUOIKY], [TB]) VALUES (N'DHS001027 ', N'HS001     ', N'BM013     ', N'HK002     ', N'NH001     ', N'7         ', N'6         ', N'8         ', N'5         ', N'9         ', N'6         ', N'7         ', N'3         ', N'9         ', N'8         ', 6.8571428571428568)
INSERT [dbo].[DIEM_CHITIET] ([MADIEM], [MAHS], [MAMONHOC], [MAHK], [MANH], [MIENG1], [MIENG2], [MIENG3], [MIENG4], [15PHUT1], [15PHUT2], [15PHUT3], [45PHUT1], [45PHUT2], [CUOIKY], [TB]) VALUES (N'DHS001028 ', N'HS001     ', N'BM014     ', N'HK002     ', N'NH001     ', N'8         ', N'5         ', N'8         ', N'6         ', N'9         ', N'6         ', N'7         ', N'3         ', N'9         ', N'8         ', 6.9285714285714288)
INSERT [dbo].[DIEM_CHITIET] ([MADIEM], [MAHS], [MAMONHOC], [MAHK], [MANH], [MIENG1], [MIENG2], [MIENG3], [MIENG4], [15PHUT1], [15PHUT2], [15PHUT3], [45PHUT1], [45PHUT2], [CUOIKY], [TB]) VALUES (N'DHS002001 ', N'HS002     ', N'BM001     ', N'HK001     ', N'NH001     ', N'7         ', N'6         ', N'8         ', N'6         ', N'9         ', N'6         ', N'7         ', N'3         ', N'9         ', N'8         ', 6.9285714285714288)
INSERT [dbo].[DIEM_CHITIET] ([MADIEM], [MAHS], [MAMONHOC], [MAHK], [MANH], [MIENG1], [MIENG2], [MIENG3], [MIENG4], [15PHUT1], [15PHUT2], [15PHUT3], [45PHUT1], [45PHUT2], [CUOIKY], [TB]) VALUES (N'DHS002002 ', N'HS002     ', N'BM002     ', N'HK001     ', N'NH001     ', N'8         ', N'5         ', N'8         ', N'6         ', N'9         ', N'6         ', N'7         ', N'3         ', N'9         ', N'8         ', 6.9285714285714288)
INSERT [dbo].[DIEM_CHITIET] ([MADIEM], [MAHS], [MAMONHOC], [MAHK], [MANH], [MIENG1], [MIENG2], [MIENG3], [MIENG4], [15PHUT1], [15PHUT2], [15PHUT3], [45PHUT1], [45PHUT2], [CUOIKY], [TB]) VALUES (N'DHS002003 ', N'HS002     ', N'BM003     ', N'HK001     ', N'NH001     ', N'7         ', N'9         ', N'8         ', N'6         ', N'9         ', N'6         ', N'7         ', N'3         ', N'9         ', N'8         ', 7.1428571428571432)
INSERT [dbo].[DIEM_CHITIET] ([MADIEM], [MAHS], [MAMONHOC], [MAHK], [MANH], [MIENG1], [MIENG2], [MIENG3], [MIENG4], [15PHUT1], [15PHUT2], [15PHUT3], [45PHUT1], [45PHUT2], [CUOIKY], [TB]) VALUES (N'DHS002004 ', N'HS002     ', N'BM004     ', N'HK001     ', N'NH001     ', N'8         ', N'9         ', N'8         ', N'6         ', N'9         ', N'6         ', N'7         ', N'3         ', N'9         ', N'8         ', 7.2142857142857144)
INSERT [dbo].[DIEM_CHITIET] ([MADIEM], [MAHS], [MAMONHOC], [MAHK], [MANH], [MIENG1], [MIENG2], [MIENG3], [MIENG4], [15PHUT1], [15PHUT2], [15PHUT3], [45PHUT1], [45PHUT2], [CUOIKY], [TB]) VALUES (N'DHS002005 ', N'HS002     ', N'BM005     ', N'HK001     ', N'NH001     ', N'7         ', N'9         ', N'8         ', N'6         ', N'9         ', N'6         ', N'7         ', N'3         ', N'9         ', N'8         ', 7.1428571428571432)
INSERT [dbo].[DIEM_CHITIET] ([MADIEM], [MAHS], [MAMONHOC], [MAHK], [MANH], [MIENG1], [MIENG2], [MIENG3], [MIENG4], [15PHUT1], [15PHUT2], [15PHUT3], [45PHUT1], [45PHUT2], [CUOIKY], [TB]) VALUES (N'DHS002006 ', N'HS002     ', N'BM006     ', N'HK001     ', N'NH001     ', N'8         ', N'9         ', N'8         ', N'6         ', N'9         ', N'5         ', N'7         ', N'3         ', N'9         ', N'8         ', 7.1428571428571432)
INSERT [dbo].[DIEM_CHITIET] ([MADIEM], [MAHS], [MAMONHOC], [MAHK], [MANH], [MIENG1], [MIENG2], [MIENG3], [MIENG4], [15PHUT1], [15PHUT2], [15PHUT3], [45PHUT1], [45PHUT2], [CUOIKY], [TB]) VALUES (N'DHS002007 ', N'HS002     ', N'BM007     ', N'HK001     ', N'NH001     ', N'7         ', N'9         ', N'8         ', N'6         ', N'9         ', N'5         ', N'7         ', N'3         ', N'9         ', N'8         ', 7.0714285714285712)
INSERT [dbo].[DIEM_CHITIET] ([MADIEM], [MAHS], [MAMONHOC], [MAHK], [MANH], [MIENG1], [MIENG2], [MIENG3], [MIENG4], [15PHUT1], [15PHUT2], [15PHUT3], [45PHUT1], [45PHUT2], [CUOIKY], [TB]) VALUES (N'DHS002008 ', N'HS002     ', N'BM008     ', N'HK001     ', N'NH001     ', N'2         ', N'9         ', N'8         ', N'6         ', N'9         ', N'5         ', N'7         ', N'3         ', N'9         ', N'8         ', 6.7142857142857144)
INSERT [dbo].[DIEM_CHITIET] ([MADIEM], [MAHS], [MAMONHOC], [MAHK], [MANH], [MIENG1], [MIENG2], [MIENG3], [MIENG4], [15PHUT1], [15PHUT2], [15PHUT3], [45PHUT1], [45PHUT2], [CUOIKY], [TB]) VALUES (N'DHS002009 ', N'HS002     ', N'BM009     ', N'HK001     ', N'NH001     ', N'2         ', N'9         ', N'7         ', N'6         ', N'9         ', N'5         ', N'7         ', N'3         ', N'9         ', N'8         ', 6.6428571428571432)
INSERT [dbo].[DIEM_CHITIET] ([MADIEM], [MAHS], [MAMONHOC], [MAHK], [MANH], [MIENG1], [MIENG2], [MIENG3], [MIENG4], [15PHUT1], [15PHUT2], [15PHUT3], [45PHUT1], [45PHUT2], [CUOIKY], [TB]) VALUES (N'DHS002010 ', N'HS002     ', N'BM010     ', N'HK001     ', N'NH001     ', N'2         ', N'9         ', N'7         ', N'6         ', N'9         ', N'5         ', N'7         ', N'3         ', N'9         ', N'8         ', 6.6428571428571432)
INSERT [dbo].[DIEM_CHITIET] ([MADIEM], [MAHS], [MAMONHOC], [MAHK], [MANH], [MIENG1], [MIENG2], [MIENG3], [MIENG4], [15PHUT1], [15PHUT2], [15PHUT3], [45PHUT1], [45PHUT2], [CUOIKY], [TB]) VALUES (N'DHS002011 ', N'HS002     ', N'BM011     ', N'HK001     ', N'NH001     ', N'3         ', N'9         ', N'7         ', N'6         ', N'9         ', N'5         ', N'7         ', N'3         ', N'9         ', N'8         ', 6.7142857142857144)
INSERT [dbo].[DIEM_CHITIET] ([MADIEM], [MAHS], [MAMONHOC], [MAHK], [MANH], [MIENG1], [MIENG2], [MIENG3], [MIENG4], [15PHUT1], [15PHUT2], [15PHUT3], [45PHUT1], [45PHUT2], [CUOIKY], [TB]) VALUES (N'DHS002012 ', N'HS002     ', N'BM012     ', N'HK001     ', N'NH001     ', N'6         ', N'8         ', N'7         ', N'6         ', N'9         ', N'5         ', N'7         ', N'6         ', N'9         ', N'8         ', 7.2857142857142856)
INSERT [dbo].[DIEM_CHITIET] ([MADIEM], [MAHS], [MAMONHOC], [MAHK], [MANH], [MIENG1], [MIENG2], [MIENG3], [MIENG4], [15PHUT1], [15PHUT2], [15PHUT3], [45PHUT1], [45PHUT2], [CUOIKY], [TB]) VALUES (N'DHS002013 ', N'HS002     ', N'BM013     ', N'HK001     ', N'NH001     ', N'5         ', N'8         ', N'7         ', N'3         ', N'9         ', N'5         ', N'7         ', N'6         ', N'9         ', N'8         ', 7)
INSERT [dbo].[DIEM_CHITIET] ([MADIEM], [MAHS], [MAMONHOC], [MAHK], [MANH], [MIENG1], [MIENG2], [MIENG3], [MIENG4], [15PHUT1], [15PHUT2], [15PHUT3], [45PHUT1], [45PHUT2], [CUOIKY], [TB]) VALUES (N'DHS002014 ', N'HS002     ', N'BM014     ', N'HK001     ', N'NH001     ', N'8         ', N'8         ', N'7         ', N'3         ', N'9         ', N'5         ', N'7         ', N'6         ', N'9         ', N'8         ', 7.2142857142857144)
INSERT [dbo].[DIEM_CHITIET] ([MADIEM], [MAHS], [MAMONHOC], [MAHK], [MANH], [MIENG1], [MIENG2], [MIENG3], [MIENG4], [15PHUT1], [15PHUT2], [15PHUT3], [45PHUT1], [45PHUT2], [CUOIKY], [TB]) VALUES (N'DHS002015 ', N'HS002     ', N'BM001     ', N'HK002     ', N'NH001     ', N'8         ', N'8         ', N'7         ', N'3         ', N'9         ', N'5         ', N'7         ', N'6         ', N'9         ', N'8         ', 7.2142857142857144)
INSERT [dbo].[DIEM_CHITIET] ([MADIEM], [MAHS], [MAMONHOC], [MAHK], [MANH], [MIENG1], [MIENG2], [MIENG3], [MIENG4], [15PHUT1], [15PHUT2], [15PHUT3], [45PHUT1], [45PHUT2], [CUOIKY], [TB]) VALUES (N'DHS002016 ', N'HS002     ', N'BM002     ', N'HK002     ', N'NH001     ', N'9         ', N'7         ', N'7         ', N'3         ', N'9         ', N'5         ', N'7         ', N'6         ', N'9         ', N'8         ', 7.2142857142857144)
INSERT [dbo].[DIEM_CHITIET] ([MADIEM], [MAHS], [MAMONHOC], [MAHK], [MANH], [MIENG1], [MIENG2], [MIENG3], [MIENG4], [15PHUT1], [15PHUT2], [15PHUT3], [45PHUT1], [45PHUT2], [CUOIKY], [TB]) VALUES (N'DHS002017 ', N'HS002     ', N'BM003     ', N'HK002     ', N'NH001     ', N'8         ', N'7         ', N'7         ', N'3         ', N'9         ', N'5         ', N'7         ', N'6         ', N'9         ', N'8         ', 7.1428571428571432)
INSERT [dbo].[DIEM_CHITIET] ([MADIEM], [MAHS], [MAMONHOC], [MAHK], [MANH], [MIENG1], [MIENG2], [MIENG3], [MIENG4], [15PHUT1], [15PHUT2], [15PHUT3], [45PHUT1], [45PHUT2], [CUOIKY], [TB]) VALUES (N'DHS002018 ', N'HS002     ', N'BM004     ', N'HK002     ', N'NH001     ', N'5         ', N'7         ', N'7         ', N'3         ', N'9         ', N'5         ', N'7         ', N'6         ', N'9         ', N'8         ', 6.9285714285714288)
INSERT [dbo].[DIEM_CHITIET] ([MADIEM], [MAHS], [MAMONHOC], [MAHK], [MANH], [MIENG1], [MIENG2], [MIENG3], [MIENG4], [15PHUT1], [15PHUT2], [15PHUT3], [45PHUT1], [45PHUT2], [CUOIKY], [TB]) VALUES (N'DHS002019 ', N'HS002     ', N'BM005     ', N'HK002     ', N'NH001     ', N'2         ', N'7         ', N'7         ', N'3         ', N'9         ', N'6         ', N'7         ', N'6         ', N'9         ', N'8         ', 6.7857142857142856)
INSERT [dbo].[DIEM_CHITIET] ([MADIEM], [MAHS], [MAMONHOC], [MAHK], [MANH], [MIENG1], [MIENG2], [MIENG3], [MIENG4], [15PHUT1], [15PHUT2], [15PHUT3], [45PHUT1], [45PHUT2], [CUOIKY], [TB]) VALUES (N'DHS002020 ', N'HS002     ', N'BM006     ', N'HK002     ', N'NH001     ', N'5         ', N'7         ', N'7         ', N'3         ', N'9         ', N'6         ', N'7         ', N'6         ', N'9         ', N'8         ', 7)
INSERT [dbo].[DIEM_CHITIET] ([MADIEM], [MAHS], [MAMONHOC], [MAHK], [MANH], [MIENG1], [MIENG2], [MIENG3], [MIENG4], [15PHUT1], [15PHUT2], [15PHUT3], [45PHUT1], [45PHUT2], [CUOIKY], [TB]) VALUES (N'DHS002021 ', N'HS002     ', N'BM007     ', N'HK002     ', N'NH001     ', N'4         ', N'4         ', N'7         ', N'3         ', N'9         ', N'6         ', N'7         ', N'6         ', N'9         ', N'8         ', 6.7142857142857144)
INSERT [dbo].[DIEM_CHITIET] ([MADIEM], [MAHS], [MAMONHOC], [MAHK], [MANH], [MIENG1], [MIENG2], [MIENG3], [MIENG4], [15PHUT1], [15PHUT2], [15PHUT3], [45PHUT1], [45PHUT2], [CUOIKY], [TB]) VALUES (N'DHS002022 ', N'HS002     ', N'BM008     ', N'HK002     ', N'NH001     ', N'8         ', N'4         ', N'7         ', N'3         ', N'9         ', N'6         ', N'7         ', N'6         ', N'9         ', N'8         ', 7)
INSERT [dbo].[DIEM_CHITIET] ([MADIEM], [MAHS], [MAMONHOC], [MAHK], [MANH], [MIENG1], [MIENG2], [MIENG3], [MIENG4], [15PHUT1], [15PHUT2], [15PHUT3], [45PHUT1], [45PHUT2], [CUOIKY], [TB]) VALUES (N'DHS002023 ', N'HS002     ', N'BM009     ', N'HK002     ', N'NH001     ', N'9         ', N'4         ', N'8         ', N'2         ', N'9         ', N'9         ', N'7         ', N'6         ', N'9         ', N'8         ', 7.2857142857142856)
INSERT [dbo].[DIEM_CHITIET] ([MADIEM], [MAHS], [MAMONHOC], [MAHK], [MANH], [MIENG1], [MIENG2], [MIENG3], [MIENG4], [15PHUT1], [15PHUT2], [15PHUT3], [45PHUT1], [45PHUT2], [CUOIKY], [TB]) VALUES (N'DHS002024 ', N'HS002     ', N'BM010     ', N'HK002     ', N'NH001     ', N'6         ', N'4         ', N'8         ', N'2         ', N'9         ', N'9         ', N'7         ', N'6         ', N'9         ', N'8         ', 7.0714285714285712)
INSERT [dbo].[DIEM_CHITIET] ([MADIEM], [MAHS], [MAMONHOC], [MAHK], [MANH], [MIENG1], [MIENG2], [MIENG3], [MIENG4], [15PHUT1], [15PHUT2], [15PHUT3], [45PHUT1], [45PHUT2], [CUOIKY], [TB]) VALUES (N'DHS002025 ', N'HS002     ', N'BM011     ', N'HK002     ', N'NH001     ', N'8         ', N'4         ', N'8         ', N'2         ', N'9         ', N'9         ', N'7         ', N'6         ', N'9         ', N'8         ', 7.2142857142857144)
INSERT [dbo].[DIEM_CHITIET] ([MADIEM], [MAHS], [MAMONHOC], [MAHK], [MANH], [MIENG1], [MIENG2], [MIENG3], [MIENG4], [15PHUT1], [15PHUT2], [15PHUT3], [45PHUT1], [45PHUT2], [CUOIKY], [TB]) VALUES (N'DHS002026 ', N'HS002     ', N'BM012     ', N'HK002     ', N'NH001     ', N'5         ', N'5         ', N'8         ', N'2         ', N'9         ', N'9         ', N'7         ', N'6         ', N'9         ', N'8         ', 7.0714285714285712)
INSERT [dbo].[DIEM_CHITIET] ([MADIEM], [MAHS], [MAMONHOC], [MAHK], [MANH], [MIENG1], [MIENG2], [MIENG3], [MIENG4], [15PHUT1], [15PHUT2], [15PHUT3], [45PHUT1], [45PHUT2], [CUOIKY], [TB]) VALUES (N'DHS002027 ', N'HS002     ', N'BM013     ', N'HK002     ', N'NH001     ', N'9         ', N'5         ', N'8         ', N'2         ', N'9         ', N'9         ', N'7         ', N'6         ', N'9         ', N'8         ', 7.3571428571428568)
INSERT [dbo].[DIEM_CHITIET] ([MADIEM], [MAHS], [MAMONHOC], [MAHK], [MANH], [MIENG1], [MIENG2], [MIENG3], [MIENG4], [15PHUT1], [15PHUT2], [15PHUT3], [45PHUT1], [45PHUT2], [CUOIKY], [TB]) VALUES (N'DHS002028 ', N'HS002     ', N'BM014     ', N'HK002     ', N'NH001     ', N'8         ', N'5         ', N'5         ', N'2         ', N'8         ', N'9         ', N'7         ', N'6         ', N'9         ', N'8         ', 7)
INSERT [dbo].[DIEM_CHITIET] ([MADIEM], [MAHS], [MAMONHOC], [MAHK], [MANH], [MIENG1], [MIENG2], [MIENG3], [MIENG4], [15PHUT1], [15PHUT2], [15PHUT3], [45PHUT1], [45PHUT2], [CUOIKY], [TB]) VALUES (N'DHS003001 ', N'HS003     ', N'BM001     ', N'HK001     ', N'NH001     ', N'5         ', N'6         ', N'5         ', N'9         ', N'8         ', N'9         ', N'7         ', N'6         ', N'9         ', N'8         ', 7.3571428571428568)
INSERT [dbo].[DIEM_CHITIET] ([MADIEM], [MAHS], [MAMONHOC], [MAHK], [MANH], [MIENG1], [MIENG2], [MIENG3], [MIENG4], [15PHUT1], [15PHUT2], [15PHUT3], [45PHUT1], [45PHUT2], [CUOIKY], [TB]) VALUES (N'DHS003002 ', N'HS003     ', N'BM002     ', N'HK001     ', N'NH001     ', N'8         ', N'6         ', N'6         ', N'9         ', N'8         ', N'9         ', N'7         ', N'6         ', N'9         ', N'8         ', 7.6428571428571432)
INSERT [dbo].[DIEM_CHITIET] ([MADIEM], [MAHS], [MAMONHOC], [MAHK], [MANH], [MIENG1], [MIENG2], [MIENG3], [MIENG4], [15PHUT1], [15PHUT2], [15PHUT3], [45PHUT1], [45PHUT2], [CUOIKY], [TB]) VALUES (N'DHS003003 ', N'HS003     ', N'BM003     ', N'HK001     ', N'NH001     ', N'5         ', N'3         ', N'6         ', N'9         ', N'8         ', N'9         ', N'7         ', N'6         ', N'9         ', N'8         ', 7.2142857142857144)
INSERT [dbo].[DIEM_CHITIET] ([MADIEM], [MAHS], [MAMONHOC], [MAHK], [MANH], [MIENG1], [MIENG2], [MIENG3], [MIENG4], [15PHUT1], [15PHUT2], [15PHUT3], [45PHUT1], [45PHUT2], [CUOIKY], [TB]) VALUES (N'DHS003004 ', N'HS003     ', N'BM004     ', N'HK001     ', N'NH001     ', N'9         ', N'3         ', N'6         ', N'9         ', N'8         ', N'9         ', N'7         ', N'6         ', N'9         ', N'8         ', 7.5)
INSERT [dbo].[DIEM_CHITIET] ([MADIEM], [MAHS], [MAMONHOC], [MAHK], [MANH], [MIENG1], [MIENG2], [MIENG3], [MIENG4], [15PHUT1], [15PHUT2], [15PHUT3], [45PHUT1], [45PHUT2], [CUOIKY], [TB]) VALUES (N'DHS003005 ', N'HS003     ', N'BM005     ', N'HK001     ', N'NH001     ', N'5         ', N'3         ', N'6         ', N'9         ', N'7         ', N'9         ', N'7         ', N'6         ', N'9         ', N'8         ', 7.1428571428571432)
INSERT [dbo].[DIEM_CHITIET] ([MADIEM], [MAHS], [MAMONHOC], [MAHK], [MANH], [MIENG1], [MIENG2], [MIENG3], [MIENG4], [15PHUT1], [15PHUT2], [15PHUT3], [45PHUT1], [45PHUT2], [CUOIKY], [TB]) VALUES (N'DHS003006 ', N'HS003     ', N'BM006     ', N'HK001     ', N'NH001     ', N'8         ', N'3         ', N'6         ', N'9         ', N'7         ', N'9         ', N'7         ', N'6         ', N'9         ', N'8         ', 7.3571428571428568)
INSERT [dbo].[DIEM_CHITIET] ([MADIEM], [MAHS], [MAMONHOC], [MAHK], [MANH], [MIENG1], [MIENG2], [MIENG3], [MIENG4], [15PHUT1], [15PHUT2], [15PHUT3], [45PHUT1], [45PHUT2], [CUOIKY], [TB]) VALUES (N'DHS003007 ', N'HS003     ', N'BM007     ', N'HK001     ', N'NH001     ', N'5         ', N'3         ', N'6         ', N'9         ', N'7         ', N'9         ', N'7         ', N'6         ', N'9         ', N'8         ', 7.1428571428571432)
INSERT [dbo].[DIEM_CHITIET] ([MADIEM], [MAHS], [MAMONHOC], [MAHK], [MANH], [MIENG1], [MIENG2], [MIENG3], [MIENG4], [15PHUT1], [15PHUT2], [15PHUT3], [45PHUT1], [45PHUT2], [CUOIKY], [TB]) VALUES (N'DHS003008 ', N'HS003     ', N'BM008     ', N'HK001     ', N'NH001     ', N'8         ', N'3         ', N'6         ', N'9         ', N'7         ', N'9         ', N'7         ', N'5         ', N'9         ', N'8         ', 7.2142857142857144)
INSERT [dbo].[DIEM_CHITIET] ([MADIEM], [MAHS], [MAMONHOC], [MAHK], [MANH], [MIENG1], [MIENG2], [MIENG3], [MIENG4], [15PHUT1], [15PHUT2], [15PHUT3], [45PHUT1], [45PHUT2], [CUOIKY], [TB]) VALUES (N'DHS003009 ', N'HS003     ', N'BM009     ', N'HK001     ', N'NH001     ', N'5         ', N'3         ', N'6         ', N'9         ', N'7         ', N'9         ', N'7         ', N'5         ', N'9         ', N'8         ', 7)
INSERT [dbo].[DIEM_CHITIET] ([MADIEM], [MAHS], [MAMONHOC], [MAHK], [MANH], [MIENG1], [MIENG2], [MIENG3], [MIENG4], [15PHUT1], [15PHUT2], [15PHUT3], [45PHUT1], [45PHUT2], [CUOIKY], [TB]) VALUES (N'DHS003010 ', N'HS003     ', N'BM010     ', N'HK001     ', N'NH001     ', N'8         ', N'2         ', N'5         ', N'8         ', N'7         ', N'9         ', N'5         ', N'5         ', N'9         ', N'8         ', 6.8571428571428568)
INSERT [dbo].[DIEM_CHITIET] ([MADIEM], [MAHS], [MAMONHOC], [MAHK], [MANH], [MIENG1], [MIENG2], [MIENG3], [MIENG4], [15PHUT1], [15PHUT2], [15PHUT3], [45PHUT1], [45PHUT2], [CUOIKY], [TB]) VALUES (N'DHS003011 ', N'HS003     ', N'BM011     ', N'HK001     ', N'NH001     ', N'5         ', N'2         ', N'5         ', N'8         ', N'7         ', N'9         ', N'5         ', N'5         ', N'9         ', N'8         ', 6.6428571428571432)
INSERT [dbo].[DIEM_CHITIET] ([MADIEM], [MAHS], [MAMONHOC], [MAHK], [MANH], [MIENG1], [MIENG2], [MIENG3], [MIENG4], [15PHUT1], [15PHUT2], [15PHUT3], [45PHUT1], [45PHUT2], [CUOIKY], [TB]) VALUES (N'DHS003012 ', N'HS003     ', N'BM012     ', N'HK001     ', N'NH001     ', N'8         ', N'2         ', N'5         ', N'8         ', N'7         ', N'8         ', N'5         ', N'5         ', N'9         ', N'8         ', 6.7857142857142856)
INSERT [dbo].[DIEM_CHITIET] ([MADIEM], [MAHS], [MAMONHOC], [MAHK], [MANH], [MIENG1], [MIENG2], [MIENG3], [MIENG4], [15PHUT1], [15PHUT2], [15PHUT3], [45PHUT1], [45PHUT2], [CUOIKY], [TB]) VALUES (N'DHS003013 ', N'HS003     ', N'BM013     ', N'HK001     ', N'NH001     ', N'5         ', N'2         ', N'5         ', N'8         ', N'7         ', N'8         ', N'5         ', N'5         ', N'9         ', N'8         ', 6.5714285714285712)
INSERT [dbo].[DIEM_CHITIET] ([MADIEM], [MAHS], [MAMONHOC], [MAHK], [MANH], [MIENG1], [MIENG2], [MIENG3], [MIENG4], [15PHUT1], [15PHUT2], [15PHUT3], [45PHUT1], [45PHUT2], [CUOIKY], [TB]) VALUES (N'DHS003014 ', N'HS003     ', N'BM014     ', N'HK001     ', N'NH001     ', N'7         ', N'2         ', N'5         ', N'8         ', N'7         ', N'8         ', N'5         ', N'5         ', N'9         ', N'8         ', 6.7142857142857144)
INSERT [dbo].[DIEM_CHITIET] ([MADIEM], [MAHS], [MAMONHOC], [MAHK], [MANH], [MIENG1], [MIENG2], [MIENG3], [MIENG4], [15PHUT1], [15PHUT2], [15PHUT3], [45PHUT1], [45PHUT2], [CUOIKY], [TB]) VALUES (N'DHS003015 ', N'HS003     ', N'BM001     ', N'HK002     ', N'NH001     ', N'5         ', N'1         ', N'5         ', N'8         ', N'7         ', N'8         ', N'5         ', N'5         ', N'9         ', N'8         ', 6.5)
INSERT [dbo].[DIEM_CHITIET] ([MADIEM], [MAHS], [MAMONHOC], [MAHK], [MANH], [MIENG1], [MIENG2], [MIENG3], [MIENG4], [15PHUT1], [15PHUT2], [15PHUT3], [45PHUT1], [45PHUT2], [CUOIKY], [TB]) VALUES (N'DHS003016 ', N'HS003     ', N'BM002     ', N'HK002     ', N'NH001     ', N'7         ', N'1         ', N'5         ', N'8         ', N'7         ', N'8         ', N'5         ', N'5         ', N'9         ', N'8         ', 6.6428571428571432)
INSERT [dbo].[DIEM_CHITIET] ([MADIEM], [MAHS], [MAMONHOC], [MAHK], [MANH], [MIENG1], [MIENG2], [MIENG3], [MIENG4], [15PHUT1], [15PHUT2], [15PHUT3], [45PHUT1], [45PHUT2], [CUOIKY], [TB]) VALUES (N'DHS003017 ', N'HS003     ', N'BM003     ', N'HK002     ', N'NH001     ', N'3         ', N'1         ', N'5         ', N'7         ', N'7         ', N'8         ', N'5         ', N'5         ', N'9         ', N'8         ', 6.2857142857142856)
INSERT [dbo].[DIEM_CHITIET] ([MADIEM], [MAHS], [MAMONHOC], [MAHK], [MANH], [MIENG1], [MIENG2], [MIENG3], [MIENG4], [15PHUT1], [15PHUT2], [15PHUT3], [45PHUT1], [45PHUT2], [CUOIKY], [TB]) VALUES (N'DHS003018 ', N'HS003     ', N'BM004     ', N'HK002     ', N'NH001     ', N'2         ', N'1         ', N'4         ', N'7         ', N'7         ', N'8         ', N'5         ', N'5         ', N'9         ', N'8         ', 6.1428571428571432)
INSERT [dbo].[DIEM_CHITIET] ([MADIEM], [MAHS], [MAMONHOC], [MAHK], [MANH], [MIENG1], [MIENG2], [MIENG3], [MIENG4], [15PHUT1], [15PHUT2], [15PHUT3], [45PHUT1], [45PHUT2], [CUOIKY], [TB]) VALUES (N'DHS003019 ', N'HS003     ', N'BM005     ', N'HK002     ', N'NH001     ', N'3         ', N'4         ', N'4         ', N'7         ', N'7         ', N'8         ', N'5         ', N'5         ', N'9         ', N'8         ', 6.4285714285714288)
INSERT [dbo].[DIEM_CHITIET] ([MADIEM], [MAHS], [MAMONHOC], [MAHK], [MANH], [MIENG1], [MIENG2], [MIENG3], [MIENG4], [15PHUT1], [15PHUT2], [15PHUT3], [45PHUT1], [45PHUT2], [CUOIKY], [TB]) VALUES (N'DHS003020 ', N'HS003     ', N'BM006     ', N'HK002     ', N'NH001     ', N'2         ', N'4         ', N'4         ', N'7         ', N'7         ', N'8         ', N'5         ', N'5         ', N'9         ', N'8         ', 6.3571428571428568)
INSERT [dbo].[DIEM_CHITIET] ([MADIEM], [MAHS], [MAMONHOC], [MAHK], [MANH], [MIENG1], [MIENG2], [MIENG3], [MIENG4], [15PHUT1], [15PHUT2], [15PHUT3], [45PHUT1], [45PHUT2], [CUOIKY], [TB]) VALUES (N'DHS003021 ', N'HS003     ', N'BM007     ', N'HK002     ', N'NH001     ', N'3         ', N'4         ', N'4         ', N'7         ', N'7         ', N'6         ', N'6         ', N'5         ', N'9         ', N'8         ', 6.3571428571428568)
INSERT [dbo].[DIEM_CHITIET] ([MADIEM], [MAHS], [MAMONHOC], [MAHK], [MANH], [MIENG1], [MIENG2], [MIENG3], [MIENG4], [15PHUT1], [15PHUT2], [15PHUT3], [45PHUT1], [45PHUT2], [CUOIKY], [TB]) VALUES (N'DHS003022 ', N'HS003     ', N'BM008     ', N'HK002     ', N'NH001     ', N'2         ', N'4         ', N'4         ', N'7         ', N'7         ', N'6         ', N'6         ', N'5         ', N'9         ', N'8         ', 6.2857142857142856)
INSERT [dbo].[DIEM_CHITIET] ([MADIEM], [MAHS], [MAMONHOC], [MAHK], [MANH], [MIENG1], [MIENG2], [MIENG3], [MIENG4], [15PHUT1], [15PHUT2], [15PHUT3], [45PHUT1], [45PHUT2], [CUOIKY], [TB]) VALUES (N'DHS003023 ', N'HS003     ', N'BM009     ', N'HK002     ', N'NH001     ', N'3         ', N'5         ', N'4         ', N'7         ', N'7         ', N'6         ', N'6         ', N'5         ', N'9         ', N'8         ', 6.4285714285714288)
INSERT [dbo].[DIEM_CHITIET] ([MADIEM], [MAHS], [MAMONHOC], [MAHK], [MANH], [MIENG1], [MIENG2], [MIENG3], [MIENG4], [15PHUT1], [15PHUT2], [15PHUT3], [45PHUT1], [45PHUT2], [CUOIKY], [TB]) VALUES (N'DHS003024 ', N'HS003     ', N'BM010     ', N'HK002     ', N'NH001     ', N'2         ', N'5         ', N'4         ', N'7         ', N'7         ', N'6         ', N'6         ', N'5         ', N'9         ', N'8         ', 6.3571428571428568)
INSERT [dbo].[DIEM_CHITIET] ([MADIEM], [MAHS], [MAMONHOC], [MAHK], [MANH], [MIENG1], [MIENG2], [MIENG3], [MIENG4], [15PHUT1], [15PHUT2], [15PHUT3], [45PHUT1], [45PHUT2], [CUOIKY], [TB]) VALUES (N'DHS003025 ', N'HS003     ', N'BM011     ', N'HK002     ', N'NH001     ', N'3         ', N'5         ', N'4         ', N'4         ', N'7         ', N'6         ', N'6         ', N'5         ', N'9         ', N'8         ', 6.2142857142857144)
INSERT [dbo].[DIEM_CHITIET] ([MADIEM], [MAHS], [MAMONHOC], [MAHK], [MANH], [MIENG1], [MIENG2], [MIENG3], [MIENG4], [15PHUT1], [15PHUT2], [15PHUT3], [45PHUT1], [45PHUT2], [CUOIKY], [TB]) VALUES (N'DHS003026 ', N'HS003     ', N'BM012     ', N'HK002     ', N'NH001     ', N'2         ', N'5         ', N'4         ', N'4         ', N'7         ', N'6         ', N'6         ', N'5         ', N'9         ', N'8         ', 6.1428571428571432)
INSERT [dbo].[DIEM_CHITIET] ([MADIEM], [MAHS], [MAMONHOC], [MAHK], [MANH], [MIENG1], [MIENG2], [MIENG3], [MIENG4], [15PHUT1], [15PHUT2], [15PHUT3], [45PHUT1], [45PHUT2], [CUOIKY], [TB]) VALUES (N'DHS003027 ', N'HS003     ', N'BM013     ', N'HK002     ', N'NH001     ', N'3         ', N'5         ', N'4         ', N'4         ', N'7         ', N'6         ', N'6         ', N'5         ', N'9         ', N'8         ', 6.2142857142857144)
INSERT [dbo].[DIEM_CHITIET] ([MADIEM], [MAHS], [MAMONHOC], [MAHK], [MANH], [MIENG1], [MIENG2], [MIENG3], [MIENG4], [15PHUT1], [15PHUT2], [15PHUT3], [45PHUT1], [45PHUT2], [CUOIKY], [TB]) VALUES (N'DHS003028 ', N'HS003     ', N'BM014     ', N'HK002     ', N'NH001     ', N'2         ', N'7         ', N'4         ', N'4         ', N'6         ', N'6         ', N'6         ', N'5         ', N'9         ', N'8         ', 6.2142857142857144)
INSERT [dbo].[DIEM_CHITIET] ([MADIEM], [MAHS], [MAMONHOC], [MAHK], [MANH], [MIENG1], [MIENG2], [MIENG3], [MIENG4], [15PHUT1], [15PHUT2], [15PHUT3], [45PHUT1], [45PHUT2], [CUOIKY], [TB]) VALUES (N'DHS004001 ', N'HS004     ', N'BM001     ', N'HK001     ', N'NH001     ', N'3         ', N'7         ', N'4         ', N'4         ', N'6         ', N'6         ', N'6         ', N'5         ', N'9         ', N'8         ', 6.2857142857142856)
INSERT [dbo].[DIEM_CHITIET] ([MADIEM], [MAHS], [MAMONHOC], [MAHK], [MANH], [MIENG1], [MIENG2], [MIENG3], [MIENG4], [15PHUT1], [15PHUT2], [15PHUT3], [45PHUT1], [45PHUT2], [CUOIKY], [TB]) VALUES (N'DHS004002 ', N'HS004     ', N'BM002     ', N'HK001     ', N'NH001     ', N'2         ', N'7         ', N'4         ', N'4         ', N'6         ', N'6         ', N'6         ', N'5         ', N'9         ', N'8         ', 6.2142857142857144)
INSERT [dbo].[DIEM_CHITIET] ([MADIEM], [MAHS], [MAMONHOC], [MAHK], [MANH], [MIENG1], [MIENG2], [MIENG3], [MIENG4], [15PHUT1], [15PHUT2], [15PHUT3], [45PHUT1], [45PHUT2], [CUOIKY], [TB]) VALUES (N'DHS004003 ', N'HS004     ', N'BM003     ', N'HK001     ', N'NH001     ', N'3         ', N'7         ', N'4         ', N'4         ', N'6         ', N'6         ', N'6         ', N'5         ', N'9         ', N'8         ', 6.2857142857142856)
INSERT [dbo].[DIEM_CHITIET] ([MADIEM], [MAHS], [MAMONHOC], [MAHK], [MANH], [MIENG1], [MIENG2], [MIENG3], [MIENG4], [15PHUT1], [15PHUT2], [15PHUT3], [45PHUT1], [45PHUT2], [CUOIKY], [TB]) VALUES (N'DHS004004 ', N'HS004     ', N'BM004     ', N'HK001     ', N'NH001     ', N'2         ', N'7         ', N'4         ', N'4         ', N'6         ', N'3         ', N'6         ', N'5         ', N'9         ', N'8         ', 6)
INSERT [dbo].[DIEM_CHITIET] ([MADIEM], [MAHS], [MAMONHOC], [MAHK], [MANH], [MIENG1], [MIENG2], [MIENG3], [MIENG4], [15PHUT1], [15PHUT2], [15PHUT3], [45PHUT1], [45PHUT2], [CUOIKY], [TB]) VALUES (N'DHS004005 ', N'HS004     ', N'BM005     ', N'HK001     ', N'NH001     ', N'4         ', N'8         ', N'4         ', N'4         ', N'6         ', N'3         ', N'6         ', N'5         ', N'9         ', N'8         ', 6.2142857142857144)
INSERT [dbo].[DIEM_CHITIET] ([MADIEM], [MAHS], [MAMONHOC], [MAHK], [MANH], [MIENG1], [MIENG2], [MIENG3], [MIENG4], [15PHUT1], [15PHUT2], [15PHUT3], [45PHUT1], [45PHUT2], [CUOIKY], [TB]) VALUES (N'DHS004006 ', N'HS004     ', N'BM006     ', N'HK001     ', N'NH001     ', N'2         ', N'8         ', N'2         ', N'4         ', N'6         ', N'3         ', N'6         ', N'5         ', N'9         ', N'8         ', 5.9285714285714288)
INSERT [dbo].[DIEM_CHITIET] ([MADIEM], [MAHS], [MAMONHOC], [MAHK], [MANH], [MIENG1], [MIENG2], [MIENG3], [MIENG4], [15PHUT1], [15PHUT2], [15PHUT3], [45PHUT1], [45PHUT2], [CUOIKY], [TB]) VALUES (N'DHS004007 ', N'HS004     ', N'BM007     ', N'HK001     ', N'NH001     ', N'5         ', N'8         ', N'2         ', N'4         ', N'6         ', N'3         ', N'6         ', N'5         ', N'9         ', N'8         ', 6.1428571428571432)
INSERT [dbo].[DIEM_CHITIET] ([MADIEM], [MAHS], [MAMONHOC], [MAHK], [MANH], [MIENG1], [MIENG2], [MIENG3], [MIENG4], [15PHUT1], [15PHUT2], [15PHUT3], [45PHUT1], [45PHUT2], [CUOIKY], [TB]) VALUES (N'DHS004008 ', N'HS004     ', N'BM008     ', N'HK001     ', N'NH001     ', N'2         ', N'9         ', N'6         ', N'4         ', N'6         ', N'3         ', N'6         ', N'5         ', N'5         ', N'8         ', 5.7142857142857144)
INSERT [dbo].[DIEM_CHITIET] ([MADIEM], [MAHS], [MAMONHOC], [MAHK], [MANH], [MIENG1], [MIENG2], [MIENG3], [MIENG4], [15PHUT1], [15PHUT2], [15PHUT3], [45PHUT1], [45PHUT2], [CUOIKY], [TB]) VALUES (N'DHS004009 ', N'HS004     ', N'BM009     ', N'HK001     ', N'NH001     ', N'6         ', N'9         ', N'6         ', N'4         ', N'6         ', N'3         ', N'6         ', N'5         ', N'5         ', N'8         ', 6)
INSERT [dbo].[DIEM_CHITIET] ([MADIEM], [MAHS], [MAMONHOC], [MAHK], [MANH], [MIENG1], [MIENG2], [MIENG3], [MIENG4], [15PHUT1], [15PHUT2], [15PHUT3], [45PHUT1], [45PHUT2], [CUOIKY], [TB]) VALUES (N'DHS004010 ', N'HS004     ', N'BM010     ', N'HK001     ', N'NH001     ', N'2         ', N'9         ', N'6         ', N'4         ', N'6         ', N'3         ', N'4         ', N'5         ', N'5         ', N'8         ', 5.5714285714285712)
INSERT [dbo].[DIEM_CHITIET] ([MADIEM], [MAHS], [MAMONHOC], [MAHK], [MANH], [MIENG1], [MIENG2], [MIENG3], [MIENG4], [15PHUT1], [15PHUT2], [15PHUT3], [45PHUT1], [45PHUT2], [CUOIKY], [TB]) VALUES (N'DHS004011 ', N'HS004     ', N'BM011     ', N'HK001     ', N'NH001     ', N'3         ', N'8         ', N'6         ', N'4         ', N'6         ', N'3         ', N'4         ', N'5         ', N'5         ', N'8         ', 5.5714285714285712)
INSERT [dbo].[DIEM_CHITIET] ([MADIEM], [MAHS], [MAMONHOC], [MAHK], [MANH], [MIENG1], [MIENG2], [MIENG3], [MIENG4], [15PHUT1], [15PHUT2], [15PHUT3], [45PHUT1], [45PHUT2], [CUOIKY], [TB]) VALUES (N'DHS004012 ', N'HS004     ', N'BM012     ', N'HK001     ', N'NH001     ', N'2         ', N'8         ', N'6         ', N'2         ', N'6         ', N'3         ', N'4         ', N'5         ', N'5         ', N'8         ', 5.3571428571428568)
INSERT [dbo].[DIEM_CHITIET] ([MADIEM], [MAHS], [MAMONHOC], [MAHK], [MANH], [MIENG1], [MIENG2], [MIENG3], [MIENG4], [15PHUT1], [15PHUT2], [15PHUT3], [45PHUT1], [45PHUT2], [CUOIKY], [TB]) VALUES (N'DHS004013 ', N'HS004     ', N'BM013     ', N'HK001     ', N'NH001     ', N'5         ', N'8         ', N'6         ', N'2         ', N'6         ', N'3         ', N'4         ', N'5         ', N'5         ', N'8         ', 5.5714285714285712)
INSERT [dbo].[DIEM_CHITIET] ([MADIEM], [MAHS], [MAMONHOC], [MAHK], [MANH], [MIENG1], [MIENG2], [MIENG3], [MIENG4], [15PHUT1], [15PHUT2], [15PHUT3], [45PHUT1], [45PHUT2], [CUOIKY], [TB]) VALUES (N'DHS004014 ', N'HS004     ', N'BM014     ', N'HK001     ', N'NH001     ', N'2         ', N'9         ', N'6         ', N'2         ', N'6         ', N'3         ', N'4         ', N'5         ', N'5         ', N'8         ', 5.4285714285714288)
INSERT [dbo].[DIEM_CHITIET] ([MADIEM], [MAHS], [MAMONHOC], [MAHK], [MANH], [MIENG1], [MIENG2], [MIENG3], [MIENG4], [15PHUT1], [15PHUT2], [15PHUT3], [45PHUT1], [45PHUT2], [CUOIKY], [TB]) VALUES (N'DHS004015 ', N'HS004     ', N'BM001     ', N'HK002     ', N'NH001     ', N'5         ', N'8         ', N'6         ', N'2         ', N'6         ', N'3         ', N'4         ', N'5         ', N'5         ', N'8         ', 5.5714285714285712)
INSERT [dbo].[DIEM_CHITIET] ([MADIEM], [MAHS], [MAMONHOC], [MAHK], [MANH], [MIENG1], [MIENG2], [MIENG3], [MIENG4], [15PHUT1], [15PHUT2], [15PHUT3], [45PHUT1], [45PHUT2], [CUOIKY], [TB]) VALUES (N'DHS004016 ', N'HS004     ', N'BM002     ', N'HK002     ', N'NH001     ', N'2         ', N'9         ', N'6         ', N'2         ', N'6         ', N'3         ', N'4         ', N'5         ', N'5         ', N'8         ', 5.4285714285714288)
GO
INSERT [dbo].[DIEM_CHITIET] ([MADIEM], [MAHS], [MAMONHOC], [MAHK], [MANH], [MIENG1], [MIENG2], [MIENG3], [MIENG4], [15PHUT1], [15PHUT2], [15PHUT3], [45PHUT1], [45PHUT2], [CUOIKY], [TB]) VALUES (N'DHS004017 ', N'HS004     ', N'BM003     ', N'HK002     ', N'NH001     ', N'6         ', N'8         ', N'6         ', N'2         ', N'6         ', N'3         ', N'4         ', N'5         ', N'5         ', N'8         ', 5.6428571428571432)
INSERT [dbo].[DIEM_CHITIET] ([MADIEM], [MAHS], [MAMONHOC], [MAHK], [MANH], [MIENG1], [MIENG2], [MIENG3], [MIENG4], [15PHUT1], [15PHUT2], [15PHUT3], [45PHUT1], [45PHUT2], [CUOIKY], [TB]) VALUES (N'DHS004018 ', N'HS004     ', N'BM004     ', N'HK002     ', N'NH001     ', N'2         ', N'9         ', N'6         ', N'2         ', N'6         ', N'3         ', N'4         ', N'4         ', N'5         ', N'8         ', 5.2857142857142856)
INSERT [dbo].[DIEM_CHITIET] ([MADIEM], [MAHS], [MAMONHOC], [MAHK], [MANH], [MIENG1], [MIENG2], [MIENG3], [MIENG4], [15PHUT1], [15PHUT2], [15PHUT3], [45PHUT1], [45PHUT2], [CUOIKY], [TB]) VALUES (N'DHS004019 ', N'HS004     ', N'BM005     ', N'HK002     ', N'NH001     ', N'5         ', N'8         ', N'6         ', N'2         ', N'6         ', N'3         ', N'4         ', N'4         ', N'5         ', N'8         ', 5.4285714285714288)
INSERT [dbo].[DIEM_CHITIET] ([MADIEM], [MAHS], [MAMONHOC], [MAHK], [MANH], [MIENG1], [MIENG2], [MIENG3], [MIENG4], [15PHUT1], [15PHUT2], [15PHUT3], [45PHUT1], [45PHUT2], [CUOIKY], [TB]) VALUES (N'DHS004020 ', N'HS004     ', N'BM006     ', N'HK002     ', N'NH001     ', N'2         ', N'9         ', N'6         ', N'2         ', N'6         ', N'2         ', N'4         ', N'4         ', N'5         ', N'8         ', 5.2142857142857144)
INSERT [dbo].[DIEM_CHITIET] ([MADIEM], [MAHS], [MAMONHOC], [MAHK], [MANH], [MIENG1], [MIENG2], [MIENG3], [MIENG4], [15PHUT1], [15PHUT2], [15PHUT3], [45PHUT1], [45PHUT2], [CUOIKY], [TB]) VALUES (N'DHS004021 ', N'HS004     ', N'BM007     ', N'HK002     ', N'NH001     ', N'5         ', N'8         ', N'6         ', N'2         ', N'6         ', N'2         ', N'4         ', N'4         ', N'5         ', N'8         ', 5.3571428571428568)
INSERT [dbo].[DIEM_CHITIET] ([MADIEM], [MAHS], [MAMONHOC], [MAHK], [MANH], [MIENG1], [MIENG2], [MIENG3], [MIENG4], [15PHUT1], [15PHUT2], [15PHUT3], [45PHUT1], [45PHUT2], [CUOIKY], [TB]) VALUES (N'DHS004022 ', N'HS004     ', N'BM008     ', N'HK002     ', N'NH001     ', N'2         ', N'9         ', N'6         ', N'2         ', N'6         ', N'2         ', N'4         ', N'4         ', N'5         ', N'8         ', 5.2142857142857144)
INSERT [dbo].[DIEM_CHITIET] ([MADIEM], [MAHS], [MAMONHOC], [MAHK], [MANH], [MIENG1], [MIENG2], [MIENG3], [MIENG4], [15PHUT1], [15PHUT2], [15PHUT3], [45PHUT1], [45PHUT2], [CUOIKY], [TB]) VALUES (N'DHS004023 ', N'HS004     ', N'BM009     ', N'HK002     ', N'NH001     ', N'6         ', N'8         ', N'6         ', N'2         ', N'6         ', N'2         ', N'4         ', N'4         ', N'5         ', N'8         ', 5.4285714285714288)
INSERT [dbo].[DIEM_CHITIET] ([MADIEM], [MAHS], [MAMONHOC], [MAHK], [MANH], [MIENG1], [MIENG2], [MIENG3], [MIENG4], [15PHUT1], [15PHUT2], [15PHUT3], [45PHUT1], [45PHUT2], [CUOIKY], [TB]) VALUES (N'DHS004024 ', N'HS004     ', N'BM010     ', N'HK002     ', N'NH001     ', N'2         ', N'9         ', N'6         ', N'2         ', N'6         ', N'2         ', N'4         ', N'4         ', N'5         ', N'8         ', 5.2142857142857144)
INSERT [dbo].[DIEM_CHITIET] ([MADIEM], [MAHS], [MAMONHOC], [MAHK], [MANH], [MIENG1], [MIENG2], [MIENG3], [MIENG4], [15PHUT1], [15PHUT2], [15PHUT3], [45PHUT1], [45PHUT2], [CUOIKY], [TB]) VALUES (N'DHS004025 ', N'HS004     ', N'BM011     ', N'HK002     ', N'NH001     ', N'3         ', N'8         ', N'6         ', N'2         ', N'6         ', N'2         ', N'4         ', N'4         ', N'5         ', N'8         ', 5.2142857142857144)
INSERT [dbo].[DIEM_CHITIET] ([MADIEM], [MAHS], [MAMONHOC], [MAHK], [MANH], [MIENG1], [MIENG2], [MIENG3], [MIENG4], [15PHUT1], [15PHUT2], [15PHUT3], [45PHUT1], [45PHUT2], [CUOIKY], [TB]) VALUES (N'DHS004026 ', N'HS004     ', N'BM012     ', N'HK002     ', N'NH001     ', N'2         ', N'9         ', N'6         ', N'2         ', N'6         ', N'2         ', N'4         ', N'4         ', N'5         ', N'8         ', 5.2142857142857144)
INSERT [dbo].[DIEM_CHITIET] ([MADIEM], [MAHS], [MAMONHOC], [MAHK], [MANH], [MIENG1], [MIENG2], [MIENG3], [MIENG4], [15PHUT1], [15PHUT2], [15PHUT3], [45PHUT1], [45PHUT2], [CUOIKY], [TB]) VALUES (N'DHS004027 ', N'HS004     ', N'BM013     ', N'HK002     ', N'NH001     ', N'7         ', N'8         ', N'6         ', N'1         ', N'6         ', N'2         ', N'4         ', N'4         ', N'5         ', N'8         ', 5.4285714285714288)
INSERT [dbo].[DIEM_CHITIET] ([MADIEM], [MAHS], [MAMONHOC], [MAHK], [MANH], [MIENG1], [MIENG2], [MIENG3], [MIENG4], [15PHUT1], [15PHUT2], [15PHUT3], [45PHUT1], [45PHUT2], [CUOIKY], [TB]) VALUES (N'DHS004028 ', N'HS004     ', N'BM014     ', N'HK002     ', N'NH001     ', N'5         ', N'9         ', N'6         ', N'1         ', N'5         ', N'2         ', N'4         ', N'4         ', N'5         ', N'8         ', 5.2857142857142856)
INSERT [dbo].[DIEM_CHITIET] ([MADIEM], [MAHS], [MAMONHOC], [MAHK], [MANH], [MIENG1], [MIENG2], [MIENG3], [MIENG4], [15PHUT1], [15PHUT2], [15PHUT3], [45PHUT1], [45PHUT2], [CUOIKY], [TB]) VALUES (N'DHS005001 ', N'HS005     ', N'BM001     ', N'HK001     ', N'NH001     ', N'5         ', N'8         ', N'8         ', N'1         ', N'5         ', N'2         ', N'2         ', N'4         ', N'5         ', N'5         ', 4.5714285714285712)
INSERT [dbo].[DIEM_CHITIET] ([MADIEM], [MAHS], [MAMONHOC], [MAHK], [MANH], [MIENG1], [MIENG2], [MIENG3], [MIENG4], [15PHUT1], [15PHUT2], [15PHUT3], [45PHUT1], [45PHUT2], [CUOIKY], [TB]) VALUES (N'DHS005002 ', N'HS005     ', N'BM002     ', N'HK001     ', N'NH001     ', N'9         ', N'9         ', N'8         ', N'1         ', N'5         ', N'2         ', N'2         ', N'4         ', N'5         ', N'5         ', 4.9285714285714288)
INSERT [dbo].[DIEM_CHITIET] ([MADIEM], [MAHS], [MAMONHOC], [MAHK], [MANH], [MIENG1], [MIENG2], [MIENG3], [MIENG4], [15PHUT1], [15PHUT2], [15PHUT3], [45PHUT1], [45PHUT2], [CUOIKY], [TB]) VALUES (N'DHS005003 ', N'HS005     ', N'BM003     ', N'HK001     ', N'NH001     ', N'6         ', N'8         ', N'8         ', N'1         ', N'5         ', N'2         ', N'2         ', N'4         ', N'5         ', N'5         ', 4.6428571428571432)
INSERT [dbo].[DIEM_CHITIET] ([MADIEM], [MAHS], [MAMONHOC], [MAHK], [MANH], [MIENG1], [MIENG2], [MIENG3], [MIENG4], [15PHUT1], [15PHUT2], [15PHUT3], [45PHUT1], [45PHUT2], [CUOIKY], [TB]) VALUES (N'DHS005004 ', N'HS005     ', N'BM004     ', N'HK001     ', N'NH001     ', N'6         ', N'7         ', N'8         ', N'1         ', N'5         ', N'2         ', N'2         ', N'2         ', N'5         ', N'5         ', 4.2857142857142856)
INSERT [dbo].[DIEM_CHITIET] ([MADIEM], [MAHS], [MAMONHOC], [MAHK], [MANH], [MIENG1], [MIENG2], [MIENG3], [MIENG4], [15PHUT1], [15PHUT2], [15PHUT3], [45PHUT1], [45PHUT2], [CUOIKY], [TB]) VALUES (N'DHS005005 ', N'HS005     ', N'BM005     ', N'HK001     ', N'NH001     ', N'6         ', N'7         ', N'8         ', N'1         ', N'5         ', N'2         ', N'2         ', N'2         ', N'5         ', N'5         ', 4.2857142857142856)
INSERT [dbo].[DIEM_CHITIET] ([MADIEM], [MAHS], [MAMONHOC], [MAHK], [MANH], [MIENG1], [MIENG2], [MIENG3], [MIENG4], [15PHUT1], [15PHUT2], [15PHUT3], [45PHUT1], [45PHUT2], [CUOIKY], [TB]) VALUES (N'DHS005006 ', N'HS005     ', N'BM006     ', N'HK001     ', N'NH001     ', N'6         ', N'7         ', N'8         ', N'1         ', N'5         ', N'2         ', N'2         ', N'2         ', N'5         ', N'5         ', 4.2857142857142856)
INSERT [dbo].[DIEM_CHITIET] ([MADIEM], [MAHS], [MAMONHOC], [MAHK], [MANH], [MIENG1], [MIENG2], [MIENG3], [MIENG4], [15PHUT1], [15PHUT2], [15PHUT3], [45PHUT1], [45PHUT2], [CUOIKY], [TB]) VALUES (N'DHS005007 ', N'HS005     ', N'BM007     ', N'HK001     ', N'NH001     ', N'8         ', N'7         ', N'8         ', N'3         ', N'5         ', N'2         ', N'2         ', N'2         ', N'5         ', N'5         ', 4.5714285714285712)
INSERT [dbo].[DIEM_CHITIET] ([MADIEM], [MAHS], [MAMONHOC], [MAHK], [MANH], [MIENG1], [MIENG2], [MIENG3], [MIENG4], [15PHUT1], [15PHUT2], [15PHUT3], [45PHUT1], [45PHUT2], [CUOIKY], [TB]) VALUES (N'DHS005008 ', N'HS005     ', N'BM008     ', N'HK001     ', N'NH001     ', N'8         ', N'5         ', N'7         ', N'3         ', N'5         ', N'2         ', N'2         ', N'2         ', N'5         ', N'5         ', 4.3571428571428568)
INSERT [dbo].[DIEM_CHITIET] ([MADIEM], [MAHS], [MAMONHOC], [MAHK], [MANH], [MIENG1], [MIENG2], [MIENG3], [MIENG4], [15PHUT1], [15PHUT2], [15PHUT3], [45PHUT1], [45PHUT2], [CUOIKY], [TB]) VALUES (N'DHS005009 ', N'HS005     ', N'BM009     ', N'HK001     ', N'NH001     ', N'8         ', N'2         ', N'7         ', N'3         ', N'4         ', N'2         ', N'2         ', N'3         ', N'5         ', N'5         ', 4.2142857142857144)
INSERT [dbo].[DIEM_CHITIET] ([MADIEM], [MAHS], [MAMONHOC], [MAHK], [MANH], [MIENG1], [MIENG2], [MIENG3], [MIENG4], [15PHUT1], [15PHUT2], [15PHUT3], [45PHUT1], [45PHUT2], [CUOIKY], [TB]) VALUES (N'DHS005010 ', N'HS005     ', N'BM010     ', N'HK001     ', N'NH001     ', N'8         ', N'2         ', N'7         ', N'3         ', N'4         ', N'2         ', N'2         ', N'3         ', N'5         ', N'2         ', 3.5714285714285716)
INSERT [dbo].[DIEM_CHITIET] ([MADIEM], [MAHS], [MAMONHOC], [MAHK], [MANH], [MIENG1], [MIENG2], [MIENG3], [MIENG4], [15PHUT1], [15PHUT2], [15PHUT3], [45PHUT1], [45PHUT2], [CUOIKY], [TB]) VALUES (N'DHS005011 ', N'HS005     ', N'BM011     ', N'HK001     ', N'NH001     ', N'8         ', N'2         ', N'7         ', N'3         ', N'4         ', N'2         ', N'2         ', N'3         ', N'5         ', N'2         ', 3.5714285714285716)
INSERT [dbo].[DIEM_CHITIET] ([MADIEM], [MAHS], [MAMONHOC], [MAHK], [MANH], [MIENG1], [MIENG2], [MIENG3], [MIENG4], [15PHUT1], [15PHUT2], [15PHUT3], [45PHUT1], [45PHUT2], [CUOIKY], [TB]) VALUES (N'DHS005012 ', N'HS005     ', N'BM012     ', N'HK001     ', N'NH001     ', N'8         ', N'1         ', N'4         ', N'3         ', N'4         ', N'2         ', N'2         ', N'3         ', N'5         ', N'2         ', 3.2857142857142856)
INSERT [dbo].[DIEM_CHITIET] ([MADIEM], [MAHS], [MAMONHOC], [MAHK], [MANH], [MIENG1], [MIENG2], [MIENG3], [MIENG4], [15PHUT1], [15PHUT2], [15PHUT3], [45PHUT1], [45PHUT2], [CUOIKY], [TB]) VALUES (N'DHS005013 ', N'HS005     ', N'BM013     ', N'HK001     ', N'NH001     ', N'7         ', N'1         ', N'4         ', N'3         ', N'4         ', N'2         ', N'1         ', N'3         ', N'5         ', N'2         ', 3.1428571428571428)
INSERT [dbo].[DIEM_CHITIET] ([MADIEM], [MAHS], [MAMONHOC], [MAHK], [MANH], [MIENG1], [MIENG2], [MIENG3], [MIENG4], [15PHUT1], [15PHUT2], [15PHUT3], [45PHUT1], [45PHUT2], [CUOIKY], [TB]) VALUES (N'DHS005014 ', N'HS005     ', N'BM014     ', N'HK001     ', N'NH001     ', N'7         ', N'1         ', N'4         ', N'3         ', N'4         ', N'1         ', N'1         ', N'3         ', N'5         ', N'2         ', 3.0714285714285716)
INSERT [dbo].[DIEM_CHITIET] ([MADIEM], [MAHS], [MAMONHOC], [MAHK], [MANH], [MIENG1], [MIENG2], [MIENG3], [MIENG4], [15PHUT1], [15PHUT2], [15PHUT3], [45PHUT1], [45PHUT2], [CUOIKY], [TB]) VALUES (N'DHS005015 ', N'HS005     ', N'BM001     ', N'HK002     ', N'NH001     ', N'9         ', N'1         ', N'4         ', N'3         ', N'4         ', N'1         ', N'1         ', N'3         ', N'5         ', N'2         ', 3.2142857142857144)
INSERT [dbo].[DIEM_CHITIET] ([MADIEM], [MAHS], [MAMONHOC], [MAHK], [MANH], [MIENG1], [MIENG2], [MIENG3], [MIENG4], [15PHUT1], [15PHUT2], [15PHUT3], [45PHUT1], [45PHUT2], [CUOIKY], [TB]) VALUES (N'DHS005016 ', N'HS005     ', N'BM002     ', N'HK002     ', N'NH001     ', N'9         ', N'1         ', N'1         ', N'3         ', N'4         ', N'1         ', N'1         ', N'3         ', N'5         ', N'2         ', 3)
INSERT [dbo].[DIEM_CHITIET] ([MADIEM], [MAHS], [MAMONHOC], [MAHK], [MANH], [MIENG1], [MIENG2], [MIENG3], [MIENG4], [15PHUT1], [15PHUT2], [15PHUT3], [45PHUT1], [45PHUT2], [CUOIKY], [TB]) VALUES (N'DHS005017 ', N'HS005     ', N'BM003     ', N'HK002     ', N'NH001     ', N'9         ', N'1         ', N'1         ', N'3         ', N'4         ', N'1         ', N'1         ', N'3         ', N'5         ', N'2         ', 3)
INSERT [dbo].[DIEM_CHITIET] ([MADIEM], [MAHS], [MAMONHOC], [MAHK], [MANH], [MIENG1], [MIENG2], [MIENG3], [MIENG4], [15PHUT1], [15PHUT2], [15PHUT3], [45PHUT1], [45PHUT2], [CUOIKY], [TB]) VALUES (N'DHS005018 ', N'HS005     ', N'BM004     ', N'HK002     ', N'NH001     ', N'8         ', N'1         ', N'1         ', N'3         ', N'4         ', N'1         ', N'1         ', N'3         ', N'1         ', N'2         ', 2.3571428571428572)
INSERT [dbo].[DIEM_CHITIET] ([MADIEM], [MAHS], [MAMONHOC], [MAHK], [MANH], [MIENG1], [MIENG2], [MIENG3], [MIENG4], [15PHUT1], [15PHUT2], [15PHUT3], [45PHUT1], [45PHUT2], [CUOIKY], [TB]) VALUES (N'DHS005019 ', N'HS005     ', N'BM005     ', N'HK002     ', N'NH001     ', N'5         ', N'1         ', N'1         ', N'3         ', N'4         ', N'1         ', N'1         ', N'3         ', N'1         ', N'2         ', 2.1428571428571428)
INSERT [dbo].[DIEM_CHITIET] ([MADIEM], [MAHS], [MAMONHOC], [MAHK], [MANH], [MIENG1], [MIENG2], [MIENG3], [MIENG4], [15PHUT1], [15PHUT2], [15PHUT3], [45PHUT1], [45PHUT2], [CUOIKY], [TB]) VALUES (N'DHS005020 ', N'HS005     ', N'BM006     ', N'HK002     ', N'NH001     ', N'8         ', N'1         ', N'1         ', N'3         ', N'4         ', N'1         ', N'1         ', N'3         ', N'1         ', N'2         ', 2.3571428571428572)
INSERT [dbo].[DIEM_CHITIET] ([MADIEM], [MAHS], [MAMONHOC], [MAHK], [MANH], [MIENG1], [MIENG2], [MIENG3], [MIENG4], [15PHUT1], [15PHUT2], [15PHUT3], [45PHUT1], [45PHUT2], [CUOIKY], [TB]) VALUES (N'DHS005021 ', N'HS005     ', N'BM007     ', N'HK002     ', N'NH001     ', N'5         ', N'1         ', N'1         ', N'3         ', N'4         ', N'1         ', N'1         ', N'3         ', N'1         ', N'2         ', 2.1428571428571428)
INSERT [dbo].[DIEM_CHITIET] ([MADIEM], [MAHS], [MAMONHOC], [MAHK], [MANH], [MIENG1], [MIENG2], [MIENG3], [MIENG4], [15PHUT1], [15PHUT2], [15PHUT3], [45PHUT1], [45PHUT2], [CUOIKY], [TB]) VALUES (N'DHS005022 ', N'HS005     ', N'BM008     ', N'HK002     ', N'NH001     ', N'5         ', N'1         ', N'1         ', N'3         ', N'4         ', N'1         ', N'1         ', N'3         ', N'1         ', N'2         ', 2.1428571428571428)
INSERT [dbo].[DIEM_CHITIET] ([MADIEM], [MAHS], [MAMONHOC], [MAHK], [MANH], [MIENG1], [MIENG2], [MIENG3], [MIENG4], [15PHUT1], [15PHUT2], [15PHUT3], [45PHUT1], [45PHUT2], [CUOIKY], [TB]) VALUES (N'DHS005023 ', N'HS005     ', N'BM009     ', N'HK002     ', N'NH001     ', N'2         ', N'1         ', N'1         ', N'3         ', N'4         ', N'1         ', N'1         ', N'3         ', N'1         ', N'2         ', 1.9285714285714286)
INSERT [dbo].[DIEM_CHITIET] ([MADIEM], [MAHS], [MAMONHOC], [MAHK], [MANH], [MIENG1], [MIENG2], [MIENG3], [MIENG4], [15PHUT1], [15PHUT2], [15PHUT3], [45PHUT1], [45PHUT2], [CUOIKY], [TB]) VALUES (N'DHS005024 ', N'HS005     ', N'BM010     ', N'HK002     ', N'NH001     ', N'6         ', N'1         ', N'1         ', N'2         ', N'4         ', N'1         ', N'1         ', N'3         ', N'1         ', N'2         ', 2.1428571428571428)
INSERT [dbo].[DIEM_CHITIET] ([MADIEM], [MAHS], [MAMONHOC], [MAHK], [MANH], [MIENG1], [MIENG2], [MIENG3], [MIENG4], [15PHUT1], [15PHUT2], [15PHUT3], [45PHUT1], [45PHUT2], [CUOIKY], [TB]) VALUES (N'DHS005025 ', N'HS005     ', N'BM011     ', N'HK002     ', N'NH001     ', N'7         ', N'1         ', N'1         ', N'2         ', N'4         ', N'1         ', N'1         ', N'3         ', N'1         ', N'2         ', 2.2142857142857144)
INSERT [dbo].[DIEM_CHITIET] ([MADIEM], [MAHS], [MAMONHOC], [MAHK], [MANH], [MIENG1], [MIENG2], [MIENG3], [MIENG4], [15PHUT1], [15PHUT2], [15PHUT3], [45PHUT1], [45PHUT2], [CUOIKY], [TB]) VALUES (N'DHS005026 ', N'HS005     ', N'BM012     ', N'HK002     ', N'NH001     ', N'2         ', N'1         ', N'1         ', N'2         ', N'4         ', N'1         ', N'1         ', N'3         ', N'1         ', N'2         ', 1.8571428571428572)
INSERT [dbo].[DIEM_CHITIET] ([MADIEM], [MAHS], [MAMONHOC], [MAHK], [MANH], [MIENG1], [MIENG2], [MIENG3], [MIENG4], [15PHUT1], [15PHUT2], [15PHUT3], [45PHUT1], [45PHUT2], [CUOIKY], [TB]) VALUES (N'DHS005027 ', N'HS005     ', N'BM013     ', N'HK002     ', N'NH001     ', N'3         ', N'1         ', N'1         ', N'2         ', N'4         ', N'1         ', N'1         ', N'3         ', N'1         ', N'2         ', 1.9285714285714286)
INSERT [dbo].[DIEM_CHITIET] ([MADIEM], [MAHS], [MAMONHOC], [MAHK], [MANH], [MIENG1], [MIENG2], [MIENG3], [MIENG4], [15PHUT1], [15PHUT2], [15PHUT3], [45PHUT1], [45PHUT2], [CUOIKY], [TB]) VALUES (N'DHS005028 ', N'HS005     ', N'BM014     ', N'HK002     ', N'NH001     ', N'6         ', N'1         ', N'1         ', N'2         ', N'4         ', N'1         ', N'1         ', N'3         ', N'1         ', N'2         ', 2.1428571428571428)
INSERT [dbo].[DIEM_TKCN] ([MADIEM_TKCN], [MAHS], [MANH], [DIEM_TKCN]) VALUES (N'DTKHS00101', N'HS001     ', N'NH001     ', NULL)
INSERT [dbo].[DIEM_TKCN] ([MADIEM_TKCN], [MAHS], [MANH], [DIEM_TKCN]) VALUES (N'DTKHS00201', N'HS002     ', N'NH001     ', NULL)
INSERT [dbo].[DIEM_TKCN] ([MADIEM_TKCN], [MAHS], [MANH], [DIEM_TKCN]) VALUES (N'DTKHS00301', N'HS003     ', N'NH001     ', NULL)
INSERT [dbo].[DIEM_TKCN] ([MADIEM_TKCN], [MAHS], [MANH], [DIEM_TKCN]) VALUES (N'DTKHS00401', N'HS004     ', N'NH001     ', NULL)
INSERT [dbo].[DIEM_TKCN] ([MADIEM_TKCN], [MAHS], [MANH], [DIEM_TKCN]) VALUES (N'DTKHS00501', N'HS005     ', N'NH001     ', NULL)
INSERT [dbo].[DIEM_TKHK] ([MADIEM_TKHK], [MAHS], [MAHK], [MANH], [DIEMTK]) VALUES (N'DHS001001 ', N'HS001     ', N'HK001     ', N'NH001     ', NULL)
INSERT [dbo].[DIEM_TKHK] ([MADIEM_TKHK], [MAHS], [MAHK], [MANH], [DIEMTK]) VALUES (N'DHS001002 ', N'HS001     ', N'HK002     ', N'NH001     ', NULL)
INSERT [dbo].[DIEM_TKHK] ([MADIEM_TKHK], [MAHS], [MAHK], [MANH], [DIEMTK]) VALUES (N'DHS002001 ', N'HS002     ', N'HK001     ', N'NH001     ', NULL)
INSERT [dbo].[DIEM_TKHK] ([MADIEM_TKHK], [MAHS], [MAHK], [MANH], [DIEMTK]) VALUES (N'DHS002002 ', N'HS002     ', N'HK002     ', N'NH001     ', NULL)
INSERT [dbo].[DIEM_TKHK] ([MADIEM_TKHK], [MAHS], [MAHK], [MANH], [DIEMTK]) VALUES (N'DHS003001 ', N'HS003     ', N'HK001     ', N'NH001     ', NULL)
INSERT [dbo].[DIEM_TKHK] ([MADIEM_TKHK], [MAHS], [MAHK], [MANH], [DIEMTK]) VALUES (N'DHS003002 ', N'HS003     ', N'HK002     ', N'NH001     ', NULL)
INSERT [dbo].[DIEM_TKHK] ([MADIEM_TKHK], [MAHS], [MAHK], [MANH], [DIEMTK]) VALUES (N'DHS004001 ', N'HS004     ', N'HK001     ', N'NH001     ', NULL)
INSERT [dbo].[DIEM_TKHK] ([MADIEM_TKHK], [MAHS], [MAHK], [MANH], [DIEMTK]) VALUES (N'DHS004002 ', N'HS004     ', N'HK002     ', N'NH001     ', NULL)
INSERT [dbo].[DIEM_TKHK] ([MADIEM_TKHK], [MAHS], [MAHK], [MANH], [DIEMTK]) VALUES (N'DHS005001 ', N'HS005     ', N'HK001     ', N'NH001     ', NULL)
INSERT [dbo].[DIEM_TKHK] ([MADIEM_TKHK], [MAHS], [MAHK], [MANH], [DIEMTK]) VALUES (N'DHS005002 ', N'HS005     ', N'HK002     ', N'NH001     ', NULL)
INSERT [dbo].[DS_HS_LOP] ([MAHS], [MALOP], [MAHK], [MANH]) VALUES (N'HS001     ', N'L010A01   ', N'HK001     ', N'NH001     ')
INSERT [dbo].[DS_HS_LOP] ([MAHS], [MALOP], [MAHK], [MANH]) VALUES (N'HS001     ', N'L010A01   ', N'HK002     ', N'NH001     ')
INSERT [dbo].[DS_HS_LOP] ([MAHS], [MALOP], [MAHK], [MANH]) VALUES (N'HS002     ', N'L010A01   ', N'HK001     ', N'NH001     ')
INSERT [dbo].[DS_HS_LOP] ([MAHS], [MALOP], [MAHK], [MANH]) VALUES (N'HS002     ', N'L010A01   ', N'HK002     ', N'NH001     ')
INSERT [dbo].[DS_HS_LOP] ([MAHS], [MALOP], [MAHK], [MANH]) VALUES (N'HS003     ', N'L010A01   ', N'HK001     ', N'NH001     ')
INSERT [dbo].[DS_HS_LOP] ([MAHS], [MALOP], [MAHK], [MANH]) VALUES (N'HS003     ', N'L010A01   ', N'HK002     ', N'NH001     ')
INSERT [dbo].[DS_HS_LOP] ([MAHS], [MALOP], [MAHK], [MANH]) VALUES (N'HS004     ', N'L010A01   ', N'HK001     ', N'NH001     ')
INSERT [dbo].[DS_HS_LOP] ([MAHS], [MALOP], [MAHK], [MANH]) VALUES (N'HS004     ', N'L010A01   ', N'HK002     ', N'NH001     ')
INSERT [dbo].[DS_HS_LOP] ([MAHS], [MALOP], [MAHK], [MANH]) VALUES (N'HS005     ', N'L010A01   ', N'HK001     ', N'NH001     ')
INSERT [dbo].[DS_HS_LOP] ([MAHS], [MALOP], [MAHK], [MANH]) VALUES (N'HS005     ', N'L010A01   ', N'HK002     ', N'NH001     ')
INSERT [dbo].[DS_HS_LOP] ([MAHS], [MALOP], [MAHK], [MANH]) VALUES (N'HS006     ', N'L010A02   ', N'HK001     ', N'NH001     ')
INSERT [dbo].[DS_HS_LOP] ([MAHS], [MALOP], [MAHK], [MANH]) VALUES (N'HS006     ', N'L010A02   ', N'HK002     ', N'NH001     ')
INSERT [dbo].[DS_HS_LOP] ([MAHS], [MALOP], [MAHK], [MANH]) VALUES (N'HS007     ', N'L010A02   ', N'HK001     ', N'NH001     ')
INSERT [dbo].[DS_HS_LOP] ([MAHS], [MALOP], [MAHK], [MANH]) VALUES (N'HS007     ', N'L010A02   ', N'HK002     ', N'NH001     ')
INSERT [dbo].[DS_HS_LOP] ([MAHS], [MALOP], [MAHK], [MANH]) VALUES (N'HS008     ', N'L010A02   ', N'HK001     ', N'NH001     ')
INSERT [dbo].[DS_HS_LOP] ([MAHS], [MALOP], [MAHK], [MANH]) VALUES (N'HS008     ', N'L010A02   ', N'HK002     ', N'NH001     ')
INSERT [dbo].[DS_HS_LOP] ([MAHS], [MALOP], [MAHK], [MANH]) VALUES (N'HS009     ', N'L010A02   ', N'HK001     ', N'NH001     ')
INSERT [dbo].[DS_HS_LOP] ([MAHS], [MALOP], [MAHK], [MANH]) VALUES (N'HS009     ', N'L010A02   ', N'HK002     ', N'NH001     ')
INSERT [dbo].[DS_HS_LOP] ([MAHS], [MALOP], [MAHK], [MANH]) VALUES (N'HS010     ', N'L010A02   ', N'HK001     ', N'NH001     ')
INSERT [dbo].[DS_HS_LOP] ([MAHS], [MALOP], [MAHK], [MANH]) VALUES (N'HS010     ', N'L010A02   ', N'HK002     ', N'NH001     ')
INSERT [dbo].[DS_HS_LOP] ([MAHS], [MALOP], [MAHK], [MANH]) VALUES (N'HS011     ', N'L010A02   ', N'HK001     ', N'NH001     ')
INSERT [dbo].[DS_HS_LOP] ([MAHS], [MALOP], [MAHK], [MANH]) VALUES (N'HS011     ', N'L010A02   ', N'HK002     ', N'NH001     ')
INSERT [dbo].[DS_HS_LOP] ([MAHS], [MALOP], [MAHK], [MANH]) VALUES (N'HS012     ', N'L010A03   ', N'HK001     ', N'NH001     ')
INSERT [dbo].[DS_HS_LOP] ([MAHS], [MALOP], [MAHK], [MANH]) VALUES (N'HS012     ', N'L010A03   ', N'HK002     ', N'NH001     ')
INSERT [dbo].[DS_HS_LOP] ([MAHS], [MALOP], [MAHK], [MANH]) VALUES (N'HS013     ', N'L010A03   ', N'HK001     ', N'NH001     ')
INSERT [dbo].[DS_HS_LOP] ([MAHS], [MALOP], [MAHK], [MANH]) VALUES (N'HS013     ', N'L010A03   ', N'HK002     ', N'NH001     ')
INSERT [dbo].[DS_HS_LOP] ([MAHS], [MALOP], [MAHK], [MANH]) VALUES (N'HS014     ', N'L010A03   ', N'HK001     ', N'NH001     ')
INSERT [dbo].[DS_HS_LOP] ([MAHS], [MALOP], [MAHK], [MANH]) VALUES (N'HS014     ', N'L010A03   ', N'HK002     ', N'NH001     ')
INSERT [dbo].[DS_HS_LOP] ([MAHS], [MALOP], [MAHK], [MANH]) VALUES (N'HS015     ', N'L010A03   ', N'HK001     ', N'NH001     ')
INSERT [dbo].[DS_HS_LOP] ([MAHS], [MALOP], [MAHK], [MANH]) VALUES (N'HS015     ', N'L010A03   ', N'HK002     ', N'NH001     ')
INSERT [dbo].[GIAOVIEN] ([MAGV], [HOGV], [TENGV], [NS], [GT], [DC], [SDT], [MAMONHOC]) VALUES (N'GV00001   ', N'HOÀNG THÁI', N'THỊNH', CAST(0xCE080B00 AS Date), N'NAM', N'HÀ NỘI', N'0454958900', N'BM001     ')
INSERT [dbo].[GIAOVIEN] ([MAGV], [HOGV], [TENGV], [NS], [GT], [DC], [SDT], [MAMONHOC]) VALUES (N'GV00002   ', N'TRẦN NINH', N'NHẤT', CAST(0x6EFD0A00 AS Date), N'NAM', N'HÀ NỘI', N'0923748924', N'BM001     ')
INSERT [dbo].[GIAOVIEN] ([MAGV], [HOGV], [TENGV], [NS], [GT], [DC], [SDT], [MAMONHOC]) VALUES (N'GV00003   ', N'NGUYỄN VĂN', N'PHONG', CAST(0x6EFD0A00 AS Date), N'NAM', N'HÀ NỘI', N'0923748924', N'BM001     ')
INSERT [dbo].[GIAOVIEN] ([MAGV], [HOGV], [TENGV], [NS], [GT], [DC], [SDT], [MAMONHOC]) VALUES (N'GV00004   ', N'Lê Nguyễn Mai ', N'Anh', CAST(0x6EFD0A00 AS Date), N'Nữ', N'HÀ NỘI', N'0923748924', N'BM002     ')
INSERT [dbo].[GIAOVIEN] ([MAGV], [HOGV], [TENGV], [NS], [GT], [DC], [SDT], [MAMONHOC]) VALUES (N'GV00005   ', N'Nguyễn Đỗ Minh ', N'Anh', CAST(0x6EFD0A00 AS Date), N'Nữ', N'HÀ NỘI', N'0923748924', N'BM002     ')
INSERT [dbo].[GIAOVIEN] ([MAGV], [HOGV], [TENGV], [NS], [GT], [DC], [SDT], [MAMONHOC]) VALUES (N'GV00006   ', N'Võ Thanh ', N'Bình', CAST(0x6EFD0A00 AS Date), N'Nam', N'HÀ NỘI', N'0923748924', N'BM002     ')
INSERT [dbo].[GIAOVIEN] ([MAGV], [HOGV], [TENGV], [NS], [GT], [DC], [SDT], [MAMONHOC]) VALUES (N'GV00007   ', N'Phùng Minh ', N'Châu', CAST(0x6EFD0A00 AS Date), N'Nữ', N'HÀ NỘI', N'0923748924', N'BM003     ')
INSERT [dbo].[GIAOVIEN] ([MAGV], [HOGV], [TENGV], [NS], [GT], [DC], [SDT], [MAMONHOC]) VALUES (N'GV00008   ', N'Đinh Thành ', N'Chung', CAST(0x6EFD0A00 AS Date), N'Nam', N'HÀ NỘI', N'0923748924', N'BM003     ')
INSERT [dbo].[GIAOVIEN] ([MAGV], [HOGV], [TENGV], [NS], [GT], [DC], [SDT], [MAMONHOC]) VALUES (N'GV00009   ', N'Nguyễn Thủy Tâm ', N'Đan', CAST(0x6EFD0A00 AS Date), N'Nữ', N'HÀ NỘI', N'0923748924', N'BM003     ')
INSERT [dbo].[GIAOVIEN] ([MAGV], [HOGV], [TENGV], [NS], [GT], [DC], [SDT], [MAMONHOC]) VALUES (N'GV00010   ', N'Lê Thiện ', N'Đức', CAST(0x6EFD0A00 AS Date), N'Nam', N'HÀ NỘI', N'0923748924', N'BM004     ')
INSERT [dbo].[GIAOVIEN] ([MAGV], [HOGV], [TENGV], [NS], [GT], [DC], [SDT], [MAMONHOC]) VALUES (N'GV00011   ', N'Đinh Tiến ', N'Dũng', CAST(0x6EFD0A00 AS Date), N'Nam', N'HÀ NỘI', N'0923748924', N'BM004     ')
INSERT [dbo].[GIAOVIEN] ([MAGV], [HOGV], [TENGV], [NS], [GT], [DC], [SDT], [MAMONHOC]) VALUES (N'GV00012   ', N'Đặng Hoài ', N'Dương', CAST(0x6EFD0A00 AS Date), N'Nam', N'HÀ NỘI', N'0923748924', N'BM004     ')
INSERT [dbo].[GIAOVIEN] ([MAGV], [HOGV], [TENGV], [NS], [GT], [DC], [SDT], [MAMONHOC]) VALUES (N'GV00013   ', N'Nguyễn Lê Thế ', N'Hiếu', CAST(0x6EFD0A00 AS Date), N'Nam', N'HÀ NỘI', N'0923748924', N'BM005     ')
INSERT [dbo].[GIAOVIEN] ([MAGV], [HOGV], [TENGV], [NS], [GT], [DC], [SDT], [MAMONHOC]) VALUES (N'GV00014   ', N'Bùi Trung ', N'Hiếu', CAST(0x6EFD0A00 AS Date), N'Nam', N'HÀ NỘI', N'0923748924', N'BM005     ')
INSERT [dbo].[GIAOVIEN] ([MAGV], [HOGV], [TENGV], [NS], [GT], [DC], [SDT], [MAMONHOC]) VALUES (N'GV00015   ', N'Vũ Bách ', N'Hợp', CAST(0x6EFD0A00 AS Date), N'Nữ', N'HÀ NỘI', N'0923748924', N'BM005     ')
INSERT [dbo].[GIAOVIEN] ([MAGV], [HOGV], [TENGV], [NS], [GT], [DC], [SDT], [MAMONHOC]) VALUES (N'GV00016   ', N'Nguyễn Lê ', N'Huy', CAST(0x6EFD0A00 AS Date), N'Nam', N'HÀ NỘI', N'0923748924', N'BM006     ')
INSERT [dbo].[GIAOVIEN] ([MAGV], [HOGV], [TENGV], [NS], [GT], [DC], [SDT], [MAMONHOC]) VALUES (N'GV00017   ', N'Võ Duy ', N'Huy', CAST(0x6EFD0A00 AS Date), N'Nam', N'HÀ NỘI', N'0923748924', N'BM006     ')
INSERT [dbo].[GIAOVIEN] ([MAGV], [HOGV], [TENGV], [NS], [GT], [DC], [SDT], [MAMONHOC]) VALUES (N'GV00018   ', N'Lê Huỳnh Thục ', N'Khuê', CAST(0x6EFD0A00 AS Date), N'Nữ', N'HÀ NỘI', N'0923748924', N'BM006     ')
INSERT [dbo].[GIAOVIEN] ([MAGV], [HOGV], [TENGV], [NS], [GT], [DC], [SDT], [MAMONHOC]) VALUES (N'GV00019   ', N'Lê Ngô Hoàng ', N'Long', CAST(0x6EFD0A00 AS Date), N'Nam', N'HÀ NỘI', N'0923748924', N'BM007     ')
INSERT [dbo].[GIAOVIEN] ([MAGV], [HOGV], [TENGV], [NS], [GT], [DC], [SDT], [MAMONHOC]) VALUES (N'GV00020   ', N'Nguyễn Trần Phương ', N'Mai', CAST(0x6EFD0A00 AS Date), N'Nữ', N'HÀ NỘI', N'0923748924', N'BM007     ')
INSERT [dbo].[GIAOVIEN] ([MAGV], [HOGV], [TENGV], [NS], [GT], [DC], [SDT], [MAMONHOC]) VALUES (N'GV00021   ', N'Nguyễn Thái ', N'Minh', CAST(0x6EFD0A00 AS Date), N'Nữ', N'HÀ NỘI', N'0923748924', N'BM007     ')
INSERT [dbo].[GIAOVIEN] ([MAGV], [HOGV], [TENGV], [NS], [GT], [DC], [SDT], [MAMONHOC]) VALUES (N'GV00022   ', N'Vũ Hoàng ', N'Minh', CAST(0x6EFD0A00 AS Date), N'Nam', N'HÀ NỘI', N'0923748924', N'BM008     ')
INSERT [dbo].[GIAOVIEN] ([MAGV], [HOGV], [TENGV], [NS], [GT], [DC], [SDT], [MAMONHOC]) VALUES (N'GV00023   ', N'Lê Thị Trà ', N'My', CAST(0x6EFD0A00 AS Date), N'Nữ', N'HÀ NỘI', N'0923748924', N'BM008     ')
INSERT [dbo].[GIAOVIEN] ([MAGV], [HOGV], [TENGV], [NS], [GT], [DC], [SDT], [MAMONHOC]) VALUES (N'GV00024   ', N'Trần Thiện ', N'Mỹ', CAST(0x6EFD0A00 AS Date), N'Nữ', N'HÀ NỘI', N'0923748924', N'BM008     ')
INSERT [dbo].[GIAOVIEN] ([MAGV], [HOGV], [TENGV], [NS], [GT], [DC], [SDT], [MAMONHOC]) VALUES (N'GV00025   ', N'Lê Đỗ Tố ', N'Nga', CAST(0x6EFD0A00 AS Date), N'Nữ', N'HÀ NỘI', N'0923748924', N'BM009     ')
INSERT [dbo].[GIAOVIEN] ([MAGV], [HOGV], [TENGV], [NS], [GT], [DC], [SDT], [MAMONHOC]) VALUES (N'GV00026   ', N'Võ Hiếu ', N'Nghĩa', CAST(0x6EFD0A00 AS Date), N'Nam', N'HÀ NỘI', N'0923748924', N'BM010     ')
INSERT [dbo].[GIAOVIEN] ([MAGV], [HOGV], [TENGV], [NS], [GT], [DC], [SDT], [MAMONHOC]) VALUES (N'GV00027   ', N'Trần Bảo ', N'Ngọc', CAST(0x6EFD0A00 AS Date), N'Nữ', N'HÀ NỘI', N'0923748924', N'BM011     ')
INSERT [dbo].[GIAOVIEN] ([MAGV], [HOGV], [TENGV], [NS], [GT], [DC], [SDT], [MAMONHOC]) VALUES (N'GV00028   ', N'Trịnh Thoại ', N'Như', CAST(0x6EFD0A00 AS Date), N'Nữ', N'HÀ NỘI', N'0923748924', N'BM012     ')
INSERT [dbo].[GIAOVIEN] ([MAGV], [HOGV], [TENGV], [NS], [GT], [DC], [SDT], [MAMONHOC]) VALUES (N'GV00029   ', N'Nguyễn Hồ Thành ', N'Phát', CAST(0x6EFD0A00 AS Date), N'Nam', N'HÀ NỘI', N'0923748924', N'BM013     ')
INSERT [dbo].[GIAOVIEN] ([MAGV], [HOGV], [TENGV], [NS], [GT], [DC], [SDT], [MAMONHOC]) VALUES (N'GV00030   ', N'Nguyễn Minh ', N'Phương', CAST(0x6EFD0A00 AS Date), N'Nữ', N'HÀ NỘI', N'0923748924', N'BM014     ')
INSERT [dbo].[HOC_KY] ([MAHK], [TENHK], [HESO]) VALUES (N'HK001     ', N'HỌC KỲ 1', NULL)
INSERT [dbo].[HOC_KY] ([MAHK], [TENHK], [HESO]) VALUES (N'HK002     ', N'HỌC KỲ 2', NULL)
INSERT [dbo].[HOCSINH] ([MAHS], [HOHS], [TENHS], [NS], [GT], [DC], [SDT], [HOTEN_BO], [NN_BO], [HOTEN_ME], [NN_ME]) VALUES (N'HS001     ', N'NGUYỄN TRẪN', N'LONG', CAST(0x000091B100000000 AS DateTime), N'NAM', N'HÀ NỘI', N'0349293489', N'NGUYỄN HẢI BẢO', N'BÁC SĨ', N'LƯU THỊ THU', N'GIÁO VIÊN')
INSERT [dbo].[HOCSINH] ([MAHS], [HOHS], [TENHS], [NS], [GT], [DC], [SDT], [HOTEN_BO], [NN_BO], [HOTEN_ME], [NN_ME]) VALUES (N'HS002     ', N'TRẦN VIỆT', N'PHƯƠNG', CAST(0x0000950E0182AD74 AS DateTime), N'Nam', N'HÀ NỘI', N'0930982948', N'TRẦN NHẬT NAM', N'GIÁM ĐỐC CÔNG TY CNHH NHẬT THẮNG', N'HOÀNG THỊ THU', N'NỘI TRỢ GIA ĐÌNH')
INSERT [dbo].[HOCSINH] ([MAHS], [HOHS], [TENHS], [NS], [GT], [DC], [SDT], [HOTEN_BO], [NN_BO], [HOTEN_ME], [NN_ME]) VALUES (N'HS003     ', N'Nguyễn Văn Việt ', N'Bảo', CAST(0x0000950E0182AD74 AS DateTime), N'Nam', N'HÀ NỘI', N'0930982948', NULL, NULL, NULL, NULL)
INSERT [dbo].[HOCSINH] ([MAHS], [HOHS], [TENHS], [NS], [GT], [DC], [SDT], [HOTEN_BO], [NN_BO], [HOTEN_ME], [NN_ME]) VALUES (N'HS004     ', N'Đỗ Hoàng Gia ', N'Chi', CAST(0x0000950E0182AD74 AS DateTime), N'Nam', N'HÀ NỘI', N'0930982948', NULL, NULL, NULL, NULL)
INSERT [dbo].[HOCSINH] ([MAHS], [HOHS], [TENHS], [NS], [GT], [DC], [SDT], [HOTEN_BO], [NN_BO], [HOTEN_ME], [NN_ME]) VALUES (N'HS005     ', N'Nguyễn Thị Kim ', N'Chiến', CAST(0x0000950E0182AD74 AS DateTime), N'Nữ', N'HÀ NỘI', N'0930982948', NULL, NULL, NULL, NULL)
INSERT [dbo].[HOCSINH] ([MAHS], [HOHS], [TENHS], [NS], [GT], [DC], [SDT], [HOTEN_BO], [NN_BO], [HOTEN_ME], [NN_ME]) VALUES (N'HS006     ', N'Nguyễn Huỳnh ', N'Chương', CAST(0x0000950E0182AD74 AS DateTime), N'Nam', N'HÀ NỘI', N'0930982948', NULL, NULL, NULL, NULL)
INSERT [dbo].[HOCSINH] ([MAHS], [HOHS], [TENHS], [NS], [GT], [DC], [SDT], [HOTEN_BO], [NN_BO], [HOTEN_ME], [NN_ME]) VALUES (N'HS007     ', N'Đỗ Quốc ', N'Dũng', CAST(0x0000950E0182AD74 AS DateTime), N'Nam', N'HÀ NỘI', N'0930982948', NULL, NULL, NULL, NULL)
INSERT [dbo].[HOCSINH] ([MAHS], [HOHS], [TENHS], [NS], [GT], [DC], [SDT], [HOTEN_BO], [NN_BO], [HOTEN_ME], [NN_ME]) VALUES (N'HS008     ', N'Trần Văn Trung ', N'Dương', CAST(0x0000950E0182AD74 AS DateTime), N'Nam', N'HÀ NỘI', N'0930982948', NULL, NULL, NULL, NULL)
INSERT [dbo].[HOCSINH] ([MAHS], [HOHS], [TENHS], [NS], [GT], [DC], [SDT], [HOTEN_BO], [NN_BO], [HOTEN_ME], [NN_ME]) VALUES (N'HS009     ', N'Nguyễn Thái ', N'Dương', CAST(0x0000950E0182AD74 AS DateTime), N'Nam', N'HÀ NỘI', N'0930982948', NULL, NULL, NULL, NULL)
INSERT [dbo].[HOCSINH] ([MAHS], [HOHS], [TENHS], [NS], [GT], [DC], [SDT], [HOTEN_BO], [NN_BO], [HOTEN_ME], [NN_ME]) VALUES (N'HS010     ', N'Đỗ Thái ', N'Hào', CAST(0x0000950E0182AD74 AS DateTime), N'Nam', N'HÀ NỘI', N'0930982948', NULL, NULL, NULL, NULL)
INSERT [dbo].[HOCSINH] ([MAHS], [HOHS], [TENHS], [NS], [GT], [DC], [SDT], [HOTEN_BO], [NN_BO], [HOTEN_ME], [NN_ME]) VALUES (N'HS011     ', N'Nguyễn Phan Anh ', N'Hiền', CAST(0x0000950E0182AD74 AS DateTime), N'Nam', N'HÀ NỘI', N'0930982948', NULL, NULL, NULL, NULL)
INSERT [dbo].[HOCSINH] ([MAHS], [HOHS], [TENHS], [NS], [GT], [DC], [SDT], [HOTEN_BO], [NN_BO], [HOTEN_ME], [NN_ME]) VALUES (N'HS012     ', N'Trần Thị Thu ', N'Hiếu', CAST(0x0000950E0182AD74 AS DateTime), N'Nữ', N'HÀ NỘI', N'0930982948', NULL, NULL, NULL, NULL)
INSERT [dbo].[HOCSINH] ([MAHS], [HOHS], [TENHS], [NS], [GT], [DC], [SDT], [HOTEN_BO], [NN_BO], [HOTEN_ME], [NN_ME]) VALUES (N'HS013     ', N'Nguyễn Minh ', N'Huế', CAST(0x0000950E0182AD74 AS DateTime), N'Nam', N'HÀ NỘI', N'0930982948', NULL, NULL, NULL, NULL)
INSERT [dbo].[HOCSINH] ([MAHS], [HOHS], [TENHS], [NS], [GT], [DC], [SDT], [HOTEN_BO], [NN_BO], [HOTEN_ME], [NN_ME]) VALUES (N'HS014     ', N'Vương Hồng ', N'Hưng', CAST(0x0000950E0182AD74 AS DateTime), N'Nữ', N'HÀ NỘI', N'0930982948', NULL, NULL, NULL, NULL)
INSERT [dbo].[HOCSINH] ([MAHS], [HOHS], [TENHS], [NS], [GT], [DC], [SDT], [HOTEN_BO], [NN_BO], [HOTEN_ME], [NN_ME]) VALUES (N'HS015     ', N'Phan Đại ', N'Huy', CAST(0x0000950E0182AD74 AS DateTime), N'Nam', N'HÀ NỘI', N'0930982948', NULL, NULL, NULL, NULL)
INSERT [dbo].[KHOI] ([MAKHOI], [TENKHOI], [SL_LOP]) VALUES (N'MK001     ', N'10', 10)
INSERT [dbo].[KHOI] ([MAKHOI], [TENKHOI], [SL_LOP]) VALUES (N'MK002     ', N'11', 10)
INSERT [dbo].[KHOI] ([MAKHOI], [TENKHOI], [SL_LOP]) VALUES (N'MK003     ', N'12', 10)
INSERT [dbo].[LOP] ([MALOP], [TENLOP], [MA_CHUYEN], [MAKHOI]) VALUES (N'L010A01   ', N'LỚP 10A1', N'CK001     ', N'MK001     ')
INSERT [dbo].[LOP] ([MALOP], [TENLOP], [MA_CHUYEN], [MAKHOI]) VALUES (N'L010A02   ', N'LỚP 10A2', N'CK002     ', N'MK001     ')
INSERT [dbo].[LOP] ([MALOP], [TENLOP], [MA_CHUYEN], [MAKHOI]) VALUES (N'L010A03   ', N'LỚP 10A3', N'CK002     ', N'MK001     ')
INSERT [dbo].[LOP] ([MALOP], [TENLOP], [MA_CHUYEN], [MAKHOI]) VALUES (N'L010A04   ', N'LỚP 10A4', N'CK002     ', N'MK001     ')
INSERT [dbo].[LOP] ([MALOP], [TENLOP], [MA_CHUYEN], [MAKHOI]) VALUES (N'L010A05   ', N'LỚP 10A5', N'CK003     ', N'MK001     ')
INSERT [dbo].[LOP] ([MALOP], [TENLOP], [MA_CHUYEN], [MAKHOI]) VALUES (N'L010A06   ', N'LỚP 10A6', N'CK003     ', N'MK001     ')
INSERT [dbo].[LOP] ([MALOP], [TENLOP], [MA_CHUYEN], [MAKHOI]) VALUES (N'L010A07   ', N'LỚP 10A7', N'CK003     ', N'MK001     ')
INSERT [dbo].[LOP] ([MALOP], [TENLOP], [MA_CHUYEN], [MAKHOI]) VALUES (N'L010A08   ', N'LỚP 10A8', N'CK004     ', N'MK001     ')
INSERT [dbo].[LOP] ([MALOP], [TENLOP], [MA_CHUYEN], [MAKHOI]) VALUES (N'L010A09   ', N'LỚP 10A9', N'CK004     ', N'MK001     ')
INSERT [dbo].[LOP] ([MALOP], [TENLOP], [MA_CHUYEN], [MAKHOI]) VALUES (N'L010A10   ', N'LỚP 10A10', N'CK005     ', N'MK001     ')
INSERT [dbo].[LOP] ([MALOP], [TENLOP], [MA_CHUYEN], [MAKHOI]) VALUES (N'L011A01   ', N'LỚP 11A1', N'CK001     ', N'MK002     ')
INSERT [dbo].[LOP] ([MALOP], [TENLOP], [MA_CHUYEN], [MAKHOI]) VALUES (N'L011A02   ', N'LỚP 11A2', N'CK002     ', N'MK002     ')
INSERT [dbo].[LOP] ([MALOP], [TENLOP], [MA_CHUYEN], [MAKHOI]) VALUES (N'L011A03   ', N'LỚP 11A3', N'CK002     ', N'MK002     ')
INSERT [dbo].[LOP] ([MALOP], [TENLOP], [MA_CHUYEN], [MAKHOI]) VALUES (N'L011A04   ', N'LỚP 11A4', N'CK002     ', N'MK002     ')
INSERT [dbo].[LOP] ([MALOP], [TENLOP], [MA_CHUYEN], [MAKHOI]) VALUES (N'L011A05   ', N'LỚP 11A5', N'CK002     ', N'MK002     ')
INSERT [dbo].[LOP] ([MALOP], [TENLOP], [MA_CHUYEN], [MAKHOI]) VALUES (N'L011A06   ', N'LỚP 11A6', N'CK003     ', N'MK002     ')
INSERT [dbo].[LOP] ([MALOP], [TENLOP], [MA_CHUYEN], [MAKHOI]) VALUES (N'L011A07   ', N'LỚP 11A7', N'CK003     ', N'MK002     ')
INSERT [dbo].[LOP] ([MALOP], [TENLOP], [MA_CHUYEN], [MAKHOI]) VALUES (N'L011A08   ', N'LỚP 11A8', N'CK003     ', N'MK002     ')
INSERT [dbo].[LOP] ([MALOP], [TENLOP], [MA_CHUYEN], [MAKHOI]) VALUES (N'L011A09   ', N'LỚP 11A9', N'CK004     ', N'MK002     ')
INSERT [dbo].[LOP] ([MALOP], [TENLOP], [MA_CHUYEN], [MAKHOI]) VALUES (N'L011A10   ', N'LỚP 11A10', N'CK004     ', N'MK002     ')
INSERT [dbo].[LOP] ([MALOP], [TENLOP], [MA_CHUYEN], [MAKHOI]) VALUES (N'L011A11   ', N'LỚP 11A11', N'CK005     ', N'MK002     ')
INSERT [dbo].[LOP] ([MALOP], [TENLOP], [MA_CHUYEN], [MAKHOI]) VALUES (N'L012A01   ', N'LỚP 12A1', N'CK001     ', N'MK003     ')
INSERT [dbo].[LOP] ([MALOP], [TENLOP], [MA_CHUYEN], [MAKHOI]) VALUES (N'L012A02   ', N'LỚP 12A2', N'CK002     ', N'MK003     ')
INSERT [dbo].[LOP] ([MALOP], [TENLOP], [MA_CHUYEN], [MAKHOI]) VALUES (N'L012A03   ', N'LỚP 12A3', N'CK002     ', N'MK003     ')
INSERT [dbo].[LOP] ([MALOP], [TENLOP], [MA_CHUYEN], [MAKHOI]) VALUES (N'L012A04   ', N'LỚP 12A4', N'CK002     ', N'MK003     ')
INSERT [dbo].[LOP] ([MALOP], [TENLOP], [MA_CHUYEN], [MAKHOI]) VALUES (N'L012A05   ', N'LỚP 12A5', N'CK003     ', N'MK003     ')
INSERT [dbo].[LOP] ([MALOP], [TENLOP], [MA_CHUYEN], [MAKHOI]) VALUES (N'L012A06   ', N'LỚP 12A6', N'CK003     ', N'MK003     ')
INSERT [dbo].[LOP] ([MALOP], [TENLOP], [MA_CHUYEN], [MAKHOI]) VALUES (N'L012A07   ', N'LỚP 12A7', N'CK003     ', N'MK003     ')
INSERT [dbo].[LOP] ([MALOP], [TENLOP], [MA_CHUYEN], [MAKHOI]) VALUES (N'L012A08   ', N'LỚP 12A8', N'CK004     ', N'MK003     ')
INSERT [dbo].[LOP] ([MALOP], [TENLOP], [MA_CHUYEN], [MAKHOI]) VALUES (N'L012A09   ', N'LỚP 12A9', N'CK004     ', N'MK003     ')
INSERT [dbo].[MONHOC] ([MAMONHOC], [TEN_MON], [HESO]) VALUES (N'BM001     ', N'TOÁN HỌC', 2)
INSERT [dbo].[MONHOC] ([MAMONHOC], [TEN_MON], [HESO]) VALUES (N'BM002     ', N'NGỮ VĂN', 2)
INSERT [dbo].[MONHOC] ([MAMONHOC], [TEN_MON], [HESO]) VALUES (N'BM003     ', N'SINH HỌC', 1)
INSERT [dbo].[MONHOC] ([MAMONHOC], [TEN_MON], [HESO]) VALUES (N'BM004     ', N'VẬT LÝ', 1)
INSERT [dbo].[MONHOC] ([MAMONHOC], [TEN_MON], [HESO]) VALUES (N'BM005     ', N'HÓA HỌC', 1)
INSERT [dbo].[MONHOC] ([MAMONHOC], [TEN_MON], [HESO]) VALUES (N'BM006     ', N'LỊCH SỬ', 1)
INSERT [dbo].[MONHOC] ([MAMONHOC], [TEN_MON], [HESO]) VALUES (N'BM007     ', N'ĐỊA LÝ', 1)
INSERT [dbo].[MONHOC] ([MAMONHOC], [TEN_MON], [HESO]) VALUES (N'BM008     ', N'NGOẠI NGỮ', 1)
INSERT [dbo].[MONHOC] ([MAMONHOC], [TEN_MON], [HESO]) VALUES (N'BM009     ', N'GIÁO DỤC CÔNG DÂN', 1)
INSERT [dbo].[MONHOC] ([MAMONHOC], [TEN_MON], [HESO]) VALUES (N'BM010     ', N'GIÁO DỤC QUỐC PHÒNG - AN NINH', 1)
INSERT [dbo].[MONHOC] ([MAMONHOC], [TEN_MON], [HESO]) VALUES (N'BM011     ', N'THỂ DỤC', 1)
INSERT [dbo].[MONHOC] ([MAMONHOC], [TEN_MON], [HESO]) VALUES (N'BM012     ', N'CÔNG NGHỆ', 1)
INSERT [dbo].[MONHOC] ([MAMONHOC], [TEN_MON], [HESO]) VALUES (N'BM013     ', N'TIN HỌC', 1)
INSERT [dbo].[MONHOC] ([MAMONHOC], [TEN_MON], [HESO]) VALUES (N'BM014     ', N'MÔN TỰ CHỌN', 1)
INSERT [dbo].[NAM_HOC] ([MANH], [TENNH]) VALUES (N'NH001     ', N'2018-2019')
INSERT [dbo].[PHAN_CONG] ([MAGV], [MALOP], [TG]) VALUES (N'GV00001   ', N'L010A01   ', NULL)
INSERT [dbo].[PHAN_CONG] ([MAGV], [MALOP], [TG]) VALUES (N'GV00004   ', N'L010A01   ', NULL)
INSERT [dbo].[PHAN_CONG] ([MAGV], [MALOP], [TG]) VALUES (N'GV00007   ', N'L010A01   ', NULL)
INSERT [dbo].[PHAN_CONG] ([MAGV], [MALOP], [TG]) VALUES (N'GV00010   ', N'L010A01   ', NULL)
INSERT [dbo].[PHAN_CONG] ([MAGV], [MALOP], [TG]) VALUES (N'GV00013   ', N'L010A01   ', NULL)
INSERT [dbo].[PHAN_CONG] ([MAGV], [MALOP], [TG]) VALUES (N'GV00016   ', N'L010A01   ', NULL)
INSERT [dbo].[PHAN_CONG] ([MAGV], [MALOP], [TG]) VALUES (N'GV00019   ', N'L010A01   ', NULL)
INSERT [dbo].[PHAN_CONG] ([MAGV], [MALOP], [TG]) VALUES (N'GV00022   ', N'L010A01   ', NULL)
INSERT [dbo].[PHAN_CONG] ([MAGV], [MALOP], [TG]) VALUES (N'GV00025   ', N'L010A01   ', NULL)
INSERT [dbo].[PHAN_CONG] ([MAGV], [MALOP], [TG]) VALUES (N'GV00026   ', N'L010A01   ', NULL)
INSERT [dbo].[PHAN_CONG] ([MAGV], [MALOP], [TG]) VALUES (N'GV00027   ', N'L010A01   ', NULL)
INSERT [dbo].[PHAN_CONG] ([MAGV], [MALOP], [TG]) VALUES (N'GV00028   ', N'L010A01   ', NULL)
INSERT [dbo].[PHAN_CONG] ([MAGV], [MALOP], [TG]) VALUES (N'GV00029   ', N'L010A01   ', NULL)
INSERT [dbo].[PHAN_CONG] ([MAGV], [MALOP], [TG]) VALUES (N'GV00030   ', N'L010A01   ', NULL)
INSERT [dbo].[TT_LOP] ([MALOP], [MA_GVCN], [MA_LOP_TR], [SYSO], [MAHK], [MANH]) VALUES (N'L010A01   ', N'GV00001   ', N'HS001     ', NULL, N'HK001     ', N'NH001     ')
INSERT [dbo].[TT_LOP] ([MALOP], [MA_GVCN], [MA_LOP_TR], [SYSO], [MAHK], [MANH]) VALUES (N'L010A01   ', N'GV00001   ', N'HS001     ', NULL, N'HK002     ', N'NH001     ')
INSERT [dbo].[TT_LOP] ([MALOP], [MA_GVCN], [MA_LOP_TR], [SYSO], [MAHK], [MANH]) VALUES (N'L010A02   ', N'GV00002   ', N'HS010     ', NULL, N'HK001     ', N'NH001     ')
INSERT [dbo].[TT_LOP] ([MALOP], [MA_GVCN], [MA_LOP_TR], [SYSO], [MAHK], [MANH]) VALUES (N'L010A02   ', N'GV00002   ', N'HS011     ', NULL, N'HK002     ', N'NH001     ')
ALTER TABLE [dbo].[DIEM_CHITIET]  WITH CHECK ADD  CONSTRAINT [FK_DIEM_CHITIET_HOC_KY] FOREIGN KEY([MAHK])
REFERENCES [dbo].[HOC_KY] ([MAHK])
GO
ALTER TABLE [dbo].[DIEM_CHITIET] CHECK CONSTRAINT [FK_DIEM_CHITIET_HOC_KY]
GO
ALTER TABLE [dbo].[DIEM_CHITIET]  WITH CHECK ADD  CONSTRAINT [FK_DIEM_CHITIET_HOCSINH] FOREIGN KEY([MAHS])
REFERENCES [dbo].[HOCSINH] ([MAHS])
GO
ALTER TABLE [dbo].[DIEM_CHITIET] CHECK CONSTRAINT [FK_DIEM_CHITIET_HOCSINH]
GO
ALTER TABLE [dbo].[DIEM_CHITIET]  WITH CHECK ADD  CONSTRAINT [FK_DIEM_CHITIET_MONHOC1] FOREIGN KEY([MAMONHOC])
REFERENCES [dbo].[MONHOC] ([MAMONHOC])
GO
ALTER TABLE [dbo].[DIEM_CHITIET] CHECK CONSTRAINT [FK_DIEM_CHITIET_MONHOC1]
GO
ALTER TABLE [dbo].[DIEM_CHITIET]  WITH CHECK ADD  CONSTRAINT [FK_DIEM_CHITIET_NAM_HOC] FOREIGN KEY([MANH])
REFERENCES [dbo].[NAM_HOC] ([MANH])
GO
ALTER TABLE [dbo].[DIEM_CHITIET] CHECK CONSTRAINT [FK_DIEM_CHITIET_NAM_HOC]
GO
ALTER TABLE [dbo].[DIEM_TKCN]  WITH CHECK ADD  CONSTRAINT [FK_DIEM_TKCN_HOCSINH] FOREIGN KEY([MAHS])
REFERENCES [dbo].[HOCSINH] ([MAHS])
GO
ALTER TABLE [dbo].[DIEM_TKCN] CHECK CONSTRAINT [FK_DIEM_TKCN_HOCSINH]
GO
ALTER TABLE [dbo].[DIEM_TKCN]  WITH CHECK ADD  CONSTRAINT [FK_DIEM_TKCN_NAM_HOC] FOREIGN KEY([MANH])
REFERENCES [dbo].[NAM_HOC] ([MANH])
GO
ALTER TABLE [dbo].[DIEM_TKCN] CHECK CONSTRAINT [FK_DIEM_TKCN_NAM_HOC]
GO
ALTER TABLE [dbo].[DIEM_TKHK]  WITH CHECK ADD  CONSTRAINT [FK_DIEM_TKHK_HOC_KY] FOREIGN KEY([MAHK])
REFERENCES [dbo].[HOC_KY] ([MAHK])
GO
ALTER TABLE [dbo].[DIEM_TKHK] CHECK CONSTRAINT [FK_DIEM_TKHK_HOC_KY]
GO
ALTER TABLE [dbo].[DIEM_TKHK]  WITH CHECK ADD  CONSTRAINT [FK_DIEM_TKHK_HOCSINH] FOREIGN KEY([MAHS])
REFERENCES [dbo].[HOCSINH] ([MAHS])
GO
ALTER TABLE [dbo].[DIEM_TKHK] CHECK CONSTRAINT [FK_DIEM_TKHK_HOCSINH]
GO
ALTER TABLE [dbo].[DIEM_TKHK]  WITH CHECK ADD  CONSTRAINT [FK_DIEM_TKHK_NAM_HOC] FOREIGN KEY([MANH])
REFERENCES [dbo].[NAM_HOC] ([MANH])
GO
ALTER TABLE [dbo].[DIEM_TKHK] CHECK CONSTRAINT [FK_DIEM_TKHK_NAM_HOC]
GO
ALTER TABLE [dbo].[DS_HS_LOP]  WITH CHECK ADD  CONSTRAINT [FK_DS_HS_LOP_HOC_KY] FOREIGN KEY([MAHK])
REFERENCES [dbo].[HOC_KY] ([MAHK])
GO
ALTER TABLE [dbo].[DS_HS_LOP] CHECK CONSTRAINT [FK_DS_HS_LOP_HOC_KY]
GO
ALTER TABLE [dbo].[DS_HS_LOP]  WITH CHECK ADD  CONSTRAINT [FK_DS_HS_LOP_HOCSINH] FOREIGN KEY([MAHS])
REFERENCES [dbo].[HOCSINH] ([MAHS])
GO
ALTER TABLE [dbo].[DS_HS_LOP] CHECK CONSTRAINT [FK_DS_HS_LOP_HOCSINH]
GO
ALTER TABLE [dbo].[DS_HS_LOP]  WITH CHECK ADD  CONSTRAINT [FK_DS_HS_LOP_LOP] FOREIGN KEY([MALOP])
REFERENCES [dbo].[LOP] ([MALOP])
GO
ALTER TABLE [dbo].[DS_HS_LOP] CHECK CONSTRAINT [FK_DS_HS_LOP_LOP]
GO
ALTER TABLE [dbo].[DS_HS_LOP]  WITH CHECK ADD  CONSTRAINT [FK_DS_HS_LOP_NAM_HOC] FOREIGN KEY([MANH])
REFERENCES [dbo].[NAM_HOC] ([MANH])
GO
ALTER TABLE [dbo].[DS_HS_LOP] CHECK CONSTRAINT [FK_DS_HS_LOP_NAM_HOC]
GO
ALTER TABLE [dbo].[GIAOVIEN]  WITH CHECK ADD  CONSTRAINT [FK_GIAOVIEN_BOMON] FOREIGN KEY([MAMONHOC])
REFERENCES [dbo].[MONHOC] ([MAMONHOC])
GO
ALTER TABLE [dbo].[GIAOVIEN] CHECK CONSTRAINT [FK_GIAOVIEN_BOMON]
GO
ALTER TABLE [dbo].[LOP]  WITH CHECK ADD  CONSTRAINT [FK_LOP_CHUYEN] FOREIGN KEY([MA_CHUYEN])
REFERENCES [dbo].[CHUYEN] ([MA_CHUYEN])
GO
ALTER TABLE [dbo].[LOP] CHECK CONSTRAINT [FK_LOP_CHUYEN]
GO
ALTER TABLE [dbo].[LOP]  WITH CHECK ADD  CONSTRAINT [FK_LOP_KHOI] FOREIGN KEY([MAKHOI])
REFERENCES [dbo].[KHOI] ([MAKHOI])
GO
ALTER TABLE [dbo].[LOP] CHECK CONSTRAINT [FK_LOP_KHOI]
GO
ALTER TABLE [dbo].[PHAN_CONG]  WITH CHECK ADD  CONSTRAINT [FK_PHAN_CONG_GIAOVIEN1] FOREIGN KEY([MAGV])
REFERENCES [dbo].[GIAOVIEN] ([MAGV])
GO
ALTER TABLE [dbo].[PHAN_CONG] CHECK CONSTRAINT [FK_PHAN_CONG_GIAOVIEN1]
GO
ALTER TABLE [dbo].[PHAN_CONG]  WITH CHECK ADD  CONSTRAINT [FK_PHAN_CONG_LOP] FOREIGN KEY([MALOP])
REFERENCES [dbo].[LOP] ([MALOP])
GO
ALTER TABLE [dbo].[PHAN_CONG] CHECK CONSTRAINT [FK_PHAN_CONG_LOP]
GO
ALTER TABLE [dbo].[TT_LOP]  WITH CHECK ADD  CONSTRAINT [FK_CHITIET_LOP_HOC_KY] FOREIGN KEY([MAHK])
REFERENCES [dbo].[HOC_KY] ([MAHK])
GO
ALTER TABLE [dbo].[TT_LOP] CHECK CONSTRAINT [FK_CHITIET_LOP_HOC_KY]
GO
ALTER TABLE [dbo].[TT_LOP]  WITH CHECK ADD  CONSTRAINT [FK_CHITIET_LOP_LOP] FOREIGN KEY([MALOP])
REFERENCES [dbo].[LOP] ([MALOP])
GO
ALTER TABLE [dbo].[TT_LOP] CHECK CONSTRAINT [FK_CHITIET_LOP_LOP]
GO
ALTER TABLE [dbo].[TT_LOP]  WITH CHECK ADD  CONSTRAINT [FK_CHITIET_LOP_NAM_HOC] FOREIGN KEY([MANH])
REFERENCES [dbo].[NAM_HOC] ([MANH])
GO
ALTER TABLE [dbo].[TT_LOP] CHECK CONSTRAINT [FK_CHITIET_LOP_NAM_HOC]
GO
USE [master]
GO
ALTER DATABASE QL_HS_GV SET  READ_WRITE 
GO
