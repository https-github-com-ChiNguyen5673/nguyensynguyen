using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;
using QL_diem_THPT.SQLObject;
using System.Windows.Forms;

namespace QL_diem_THPT.Chuc_nang
{
    class cn_HocSinh:ConnectSQL.CSDL_QLHS_GV
    {

        public DataTable hienthiHocSinh()
        {
            conn.Open();
            SqlDataAdapter da = new SqlDataAdapter("SELECT MAHS as 'Mã Học Sinh', HOHS+' '+TENHS AS 'Họ Tên Học Sinh', NS as 'Ngày Sinh', GT as 'Giới Tính', DC as 'Địa Chỉ', SDT as 'Số Điện Thoại', HOTEN_BO as 'Họ Tên Bố', NN_BO as 'Nghề Nghiệp Bố', HOTEN_ME as 'Họ Tên Mẹ', NN_ME as 'Nghề Nghiệp Mẹ' FROM HOCSINH", conn);

            //SqlDataAdapter da = new SqlDataAdapter("SELECT* FROM HOCSINH", conn);
            DataTable dt = new DataTable();
            
            da.Fill(dt);// đổ dữ liệu từ sql vào
            conn.Close();
            return dt;
        }


        string SQL;
        public bool themHocSinh(HocSinh h)
        {
            try
            {
                conn.Open();
               
                SQL = "insert into HOCSINH values('" + h.Mahs + "', N'" + h.Hohs + "', N'" + h.Tenhs + "', '" + h.Ns +
                    "', N'" + h.Gt+ "', N'" + h.Dc + "', '" + h.Sdt + "', N'" + h.htBo + "', N'" + h.nnBo + "', N'" + h.htMe + 
                    "', N'" + h.nnMe+ "')";

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

        



        public bool suaHocSinh(HocSinh h)
        {
            try
            {
                conn.Open();
                SQL = "update HOCSINH set HOHS = N'" + h.Hohs + "', TENHS = N'" + h.Tenhs + "', NS = '" + h.Ns + "', GT = N'" + h.Gt + "', DC = N'" + h.Dc + "', SDT = '" +
                    h.Sdt + "', HOTEN_BO = N'" + h.htBo + "', NN_BO = N'" + h.nnBo + "', HOTEN_ME = N'" + h.htMe + "', NN_ME = N'" + h.nnMe + "' where MAHS = '" + h.Mahs + "'";
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

        public bool xoaHocSinh(HocSinh h)
        {
            try
            {
                conn.Open();
                SQL = "delete from HOCSINH where MAHS = '" + h.Mahs + "'";
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
        
        

        public DataTable timkiemMAHS(HocSinh h)
        {
            conn.Open();
            string SQL = string.Format(
                "SELECT MAHS as 'Mã Học Sinh', HOHS+' '+TENHS AS 'Họ Tên Học Sinh', NS as 'Ngày Sinh', GT as 'Giới Tính', DC as 'Địa Chỉ', SDT as 'Số Điện Thoại', HOTEN_BO as 'Họ Tên Bố', NN_BO as 'Nghề Nghiệp Bố', HOTEN_ME as 'Họ Tên Mẹ', NN_ME as 'Nghề Nghiệp Mẹ'  FROM HOCSINH where MAHS = '" + h.Mahs+"'", conn);
            //SqlCommand cmd = new SqlCommand(SQL, conn);
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(SQL, conn);
            da.Fill(dt);
            conn.Close();
            return dt;
        }
        public DataTable timkiemHTHS(HocSinh h)
        {
            conn.Open();
            string SQL = string.Format(
                "SELECT MAHS as 'Mã Học Sinh', HOHS+' '+TENHS AS 'Họ Tên Học Sinh', NS as 'Ngày Sinh', GT as 'Giới Tính', DC as 'Địa Chỉ', SDT as 'Số Điện Thoại', HOTEN_BO as 'Họ Tên Bố', NN_BO as 'Nghề Nghiệp Bố', HOTEN_ME as 'Họ Tên Mẹ', NN_ME as 'Nghề Nghiệp Mẹ'  FROM HOCSINH where HOHS LIKE N'%" + h.Hohs + "%' or TENHS LIKE N'%" + h.Tenhs+ "%'", conn);
            //SqlCommand cmd = new SqlCommand(SQL, conn);
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(SQL, conn);
            da.Fill(dt);
            conn.Close();
            return dt;
        }
        
        public DataTable timkiemDCHS(HocSinh h)
        {
            conn.Open();
            string SQL = string.Format(
                "SELECT MAHS as 'Mã Học Sinh', HOHS+' '+TENHS AS 'Họ Tên Học Sinh', NS as 'Ngày Sinh', GT as 'Giới Tính', DC as 'Địa Chỉ', SDT as 'Số Điện Thoại', HOTEN_BO as 'Họ Tên Bố', NN_BO as 'Nghề Nghiệp Bố', HOTEN_ME as 'Họ Tên Mẹ', NN_ME as 'Nghề Nghiệp Mẹ'  FROM HOCSINH where DC LIKE N'%" + h.Dc + "%'", conn);
            //SqlCommand cmd = new SqlCommand(SQL, conn);
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(SQL, conn);
            da.Fill(dt);
            conn.Close();
            return dt;
        }

        public DataTable timkiemGTHS(HocSinh h)
        {
            conn.Open();
            string SQL = string.Format(
                "SELECT MAHS as 'Mã Học Sinh', HOHS+' '+TENHS AS 'Họ Tên Học Sinh', NS as 'Ngày Sinh', GT as 'Giới Tính', DC as 'Địa Chỉ', SDT as 'Số Điện Thoại', HOTEN_BO as 'Họ Tên Bố', NN_BO as 'Nghề Nghiệp Bố', HOTEN_ME as 'Họ Tên Mẹ', NN_ME as 'Nghề Nghiệp Mẹ'  FROM HOCSINH where GT LIKE N'%" + h.Gt + "%'", conn);
            //SqlCommand cmd = new SqlCommand(SQL, conn);
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(SQL, conn);
            da.Fill(dt);
            conn.Close();
            return dt;
        }

        public DataTable timkiemSDTHS(HocSinh h)
        {
            conn.Open();
            string SQL = string.Format(
                "SELECT MAHS as 'Mã Học Sinh', HOHS+' '+TENHS AS 'Họ Tên Học Sinh', NS as 'Ngày Sinh', GT as 'Giới Tính', DC as 'Địa Chỉ', SDT as 'Số Điện Thoại', HOTEN_BO as 'Họ Tên Bố', NN_BO as 'Nghề Nghiệp Bố', HOTEN_ME as 'Họ Tên Mẹ', NN_ME as 'Nghề Nghiệp Mẹ'  FROM HOCSINH where SDT = '" + h.Sdt + "'", conn);
            //SqlCommand cmd = new SqlCommand(SQL, conn);
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(SQL, conn);
            da.Fill(dt);
            conn.Close();
            return dt;
        }

        public DataTable timkiemHTBoHS(HocSinh h)
        {
            conn.Open();
            string SQL = string.Format(
                "SELECT MAHS as 'Mã Học Sinh', HOHS+' '+TENHS AS 'Họ Tên Học Sinh', NS as 'Ngày Sinh', GT as 'Giới Tính', DC as 'Địa Chỉ', SDT as 'Số Điện Thoại', HOTEN_BO as 'Họ Tên Bố', NN_BO as 'Nghề Nghiệp Bố', HOTEN_ME as 'Họ Tên Mẹ', NN_ME as 'Nghề Nghiệp Mẹ'  FROM HOCSINH where HOTEN_BO LIKE N'%" + h.htBo + "%'", conn);
            //SqlCommand cmd = new SqlCommand(SQL, conn);
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(SQL, conn);
            da.Fill(dt);
            conn.Close();
            return dt;
        }

        public DataTable timkiemNNBoHS(HocSinh h)
        {
            conn.Open();
            string SQL = string.Format(
                "SELECT MAHS as 'Mã Học Sinh', HOHS+' '+TENHS AS 'Họ Tên Học Sinh', NS as 'Ngày Sinh', GT as 'Giới Tính', DC as 'Địa Chỉ', SDT as 'Số Điện Thoại', HOTEN_BO as 'Họ Tên Bố', NN_BO as 'Nghề Nghiệp Bố', HOTEN_ME as 'Họ Tên Mẹ', NN_ME as 'Nghề Nghiệp Mẹ'  FROM HOCSINH where NN_BO LIKE N'%" + h.nnBo + "%'", conn);
            //SqlCommand cmd = new SqlCommand(SQL, conn);
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(SQL, conn);
            da.Fill(dt);
            conn.Close();
            return dt;
        }
        public DataTable timkiemHTMeHS(HocSinh h)
        {
            conn.Open();
            string SQL = string.Format(
                "SELECT MAHS as 'Mã Học Sinh', HOHS+' '+TENHS AS 'Họ Tên Học Sinh', NS as 'Ngày Sinh', GT as 'Giới Tính', DC as 'Địa Chỉ', SDT as 'Số Điện Thoại', HOTEN_BO as 'Họ Tên Bố', NN_BO as 'Nghề Nghiệp Bố', HOTEN_ME as 'Họ Tên Mẹ', NN_ME as 'Nghề Nghiệp Mẹ'  FROM HOCSINH where HOTEN_ME LIKE N'%" + h.htMe + "%'", conn);
            //SqlCommand cmd = new SqlCommand(SQL, conn);
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(SQL, conn);
            da.Fill(dt);
            conn.Close();
            return dt;
        }

        public DataTable timkiemNNMeHS(HocSinh h)
        {
            conn.Open();
            string SQL = string.Format(
                "SELECT MAHS as 'Mã Học Sinh', HOHS+' '+TENHS AS 'Họ Tên Học Sinh', NS as 'Ngày Sinh', GT as 'Giới Tính', DC as 'Địa Chỉ', SDT as 'Số Điện Thoại', HOTEN_BO as 'Họ Tên Bố', NN_BO as 'Nghề Nghiệp Bố', HOTEN_ME as 'Họ Tên Mẹ', NN_ME as 'Nghề Nghiệp Mẹ'  FROM HOCSINH where NN_ME LIKE '%" + h.nnMe + "%'", conn);
            //SqlCommand cmd = new SqlCommand(SQL, conn);
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(SQL, conn);
            da.Fill(dt);
            conn.Close();
            return dt;
        }


    }
}
