using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;
using QL_diem_THPT.SQLObject;

namespace QL_diem_THPT.Chuc_nang
{
    class cn_GiaoVien : ConnectSQL.CSDL_QLHS_GV
    {
        
        public DataTable hienthiGiaoVien()
        {
            conn.Open();
            SqlDataAdapter da = new SqlDataAdapter("SELECT MAGV as 'Mã Giáo Viên', HOGV+' '+TENGV as 'Họ Tên Giáo Viên', NS as 'Ngày Sinh', GT as 'Giáo Viên', DC as 'Địa Chỉ', SDT as 'Số Điện Thoại', TEN_MON as 'Môn Giảng Dạy' FROM GIAOVIEN, MONHOC WHERE GIAOVIEN.MAMONHOC=MONHOC.MAMONHOC", conn);
            DataTable dt = new DataTable();

            da.Fill(dt);// đổ dữ liệu từ sql vào
            conn.Close();
            return dt;
        }
        string SQL;
        public bool themGiaoVien(GiaoVien g)
        {
            try
            {
                conn.Open();
                SQL = "insert into GIAOVIEN values ('" + g.maGV + "', N'" + g.hoGV + "', N'" + g.tenGV + "', '" + g.Ns + "', N'" + g.Gt + "', N'"
                    + g.Dc + "', '" + g.Sdt + "', '" + g.Mamh + "')";
                SqlCommand cmd = new SqlCommand(SQL, conn);
                int kq = (int)cmd.ExecuteNonQuery();
                if (kq > 0)
                    return true;
            }
            catch
            {

            }
            finally
            {
                conn.Close();
            }
            return false;
        }

        public bool suaGiaoVien(GiaoVien g)
        {
            try
            {
                conn.Open();
                SQL = "update GIAOVIEN set HOGV = N'" + g.hoGV + "', TENGV = N'" + g.tenGV + "', NS = '" + g.Ns + "', GT = N'" + g.Gt + "', DC = N'" + g.Dc + "', SDT = '" +
                    g.Sdt + "', MAMONHOC = N'" + g.Mamh + "' where MAGV = '" + g.maGV + "'";
                SqlCommand cmd = new SqlCommand(SQL, conn);
                int kq = (int)cmd.ExecuteNonQuery();
                if (kq > 0)
                    return true;
            }
            catch
            {

            }
            finally
            {
                conn.Close();
            }
            return false;
        }


        public bool xoaGiaoVien(GiaoVien g)
        {
            try
            {
                conn.Open();
                SQL = "delete from GIAOVIEN where MAGV = '" + g.maGV + "'";
                SqlCommand cmd = new SqlCommand(SQL, conn);
                int kq = (int)cmd.ExecuteNonQuery();
                if (kq > 0)
                    return true;
            }
            catch
            {

            }
            finally
            {
                conn.Close();
            }
            return false;
        }

        public DataTable timkiemMAGV(GiaoVien g)
        {
            conn.Open();
            string SQL = string.Format(
                "select MAGV as 'Mã Giáo Viên', HOGV+' '+TENGV as 'Họ Tên Giáo Viên', NS as 'Ngày Sinh', GT as 'Giới Tính', DC as 'Địa Chỉ', SDT as 'Số Điện Thoại', TEN_MON as 'Môn Dạy' from GIAOVIEN G, MONHOC M where G.MAMONHOC=M.MAMONHOC and MAGV = '" + g.maGV + "'", conn);
            //SqlCommand cmd = new SqlCommand(SQL, conn);
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(SQL, conn);
            da.Fill(dt);
            conn.Close();
            return dt;
        }

        public DataTable timkiemHTGV(GiaoVien g)
        {
            conn.Open();
            string SQL = string.Format(
                "select MAGV as 'Mã Giáo Viên', HOGV+' '+TENGV as 'Họ Tên Giáo Viên', NS as 'Ngày Sinh', GT as 'Giới Tính', DC as 'Địa Chỉ', SDT as 'Số Điện Thoại', TEN_MON as 'Môn Dạy' from GIAOVIEN G, MONHOC M where G.MAMONHOC=M.MAMONHOC and TENGV LIKE N'%" + g.tenGV+"%'", conn);
            //SqlCommand cmd = new SqlCommand(SQL, conn);
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(SQL, conn);
            da.Fill(dt);
            conn.Close();
            return dt;
        }

        public DataTable timkiemGTGV(GiaoVien g)
        {
            conn.Open();
            string SQL = string.Format(
                "select MAGV as 'Mã Giáo Viên', HOGV+' '+TENGV as 'Họ Tên Giáo Viên', NS as 'Ngày Sinh', GT as 'Giới Tính', DC as 'Địa Chỉ', SDT as 'Số Điện Thoại', TEN_MON as 'Môn Dạy' from GIAOVIEN G, MONHOC M where G.MAMONHOC=M.MAMONHOC and GT LIKE N'%" + g.Gt + "%'", conn);
            //SqlCommand cmd = new SqlCommand(SQL, conn);
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(SQL, conn);
            da.Fill(dt);
            conn.Close();
            return dt;
        }

        public DataTable timkiemDCGV(GiaoVien g)
        {
            conn.Open();
            string SQL = string.Format(
                "select MAGV as 'Mã Giáo Viên', HOGV+' '+TENGV as 'Họ Tên Giáo Viên', NS as 'Ngày Sinh', GT as 'Giới Tính', DC as 'Địa Chỉ', SDT as 'Số Điện Thoại', TEN_MON as 'Môn Dạy' from GIAOVIEN G, MONHOC M where G.MAMONHOC=M.MAMONHOC and DC LIKE N'%" + g.Dc + "%'", conn);
            //SqlCommand cmd = new SqlCommand(SQL, conn);
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(SQL, conn);
            da.Fill(dt);
            conn.Close();
            return dt;
        }

        public DataTable timkiemSDTGV(GiaoVien g)
        {
            conn.Open();
            string SQL = string.Format(
                "select MAGV as 'Mã Giáo Viên', HOGV+' '+TENGV as 'Họ Tên Giáo Viên', NS as 'Ngày Sinh', GT as 'Giới Tính', DC as 'Địa Chỉ', SDT as 'Số Điện Thoại', TEN_MON as 'Môn Dạy' from GIAOVIEN G, MONHOC M where G.MAMONHOC=M.MAMONHOC and SDT = '" + g.Sdt + "'", conn);
            //SqlCommand cmd = new SqlCommand(SQL, conn);
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(SQL, conn);
            da.Fill(dt);
            conn.Close();
            return dt;
        }

        public DataTable timkiemMHGV(MonHoc m)
        {
            conn.Open();
            string SQL = string.Format(
                "select MAGV as 'Mã Giáo Viên', HOGV+' '+TENGV as 'Họ Tên Giáo Viên', NS as 'Ngày Sinh', GT as 'Giới Tính', DC as 'Địa Chỉ', SDT as 'Số Điện Thoại', TEN_MON as 'Môn Dạy' from GIAOVIEN G, MONHOC M where G.MAMONHOC=M.MAMONHOC and TEN_MON LIKE N'%" + m.tenMH + "%'", conn);
            //SqlCommand cmd = new SqlCommand(SQL, conn);
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(SQL, conn);
            da.Fill(dt);
            conn.Close();
            return dt;
        }
    }
}
