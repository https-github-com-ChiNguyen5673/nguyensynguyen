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
    class cn_PhanCong : ConnectSQL.CSDL_QLHS_GV
    {
        public DataTable hienthiPhanCong()
        {
            conn.Open();
            SqlDataAdapter da = new SqlDataAdapter("SELECT HOGV+' '+TENGV as 'Họ Tên GV', TENLOP as 'Tên Lớp', TG as 'Thời Gian' FROM GIAOVIEN G, LOP L, PHAN_CONG P WHERE G.MAGV=P.MAGV AND P.MALOP=L.MALOP", conn);
            DataTable dt = new DataTable();

            da.Fill(dt);// đổ dữ liệu từ sql vào
            conn.Close();
            return dt;
        }

        public bool themPhanCong(PhanCong p)
        {
            try
            {
                conn.Open();
                string SQL = string.Format(
                    "insert into PHANCONG value({0}, {1}, {2}", p.Magv, p.Malop, p.Tg);
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

        public bool suaPhanCong(PhanCong p)
        {
            try
            {
                conn.Open();
                string SQL = string.Format(
                    "update PHANCONG set MALOP = {1}, TG = {2} where MAGV = {0}", p.Magv, p.Malop, p.Tg);
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

        public bool xoaPhanCong(PhanCong p)
        {
            try
            {
                conn.Open();
                string SQL = string.Format(
                    "delete from PHANCONG where MAGV = {0} and MALOP = {1}", p.Magv, p.Malop);
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
    }
}
