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
    class cn_MonHoc : ConnectSQL.CSDL_QLHS_GV
    {

        public DataTable hienthiMonHoc()
        {
            conn.Open();
            SqlDataAdapter da = new SqlDataAdapter("SELECT MAMONHOC as 'Mã Môn Học', TEN_MON as 'Tên Môn Học', HESO as 'Hệ số' FROM MONHOC", conn);
            DataTable dt = new DataTable();

            da.Fill(dt);// đổ dữ liệu từ sql vào
            conn.Close();
            return dt;
        }

        string SQL;
        public bool themMonHoc(MonHoc mh)
        {
            try
            {
                conn.Open();
                SQL = "insert into MONHOC values('" + mh.maMH + "', N'" + mh.tenMH + "', '" + mh.Heso + "')";

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

        public bool suaMonHoc(MonHoc mh)
        {
            try
            {
                conn.Open();
                SQL = "update MONHOC set TEN_MON = '" + mh.tenMH + "', HESO = '" + mh.Heso + "' where MAMONHOC = '" + mh.maMH + "'";

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

        public bool xoaMonHoc(MonHoc mh)
        {
            try
            {
                conn.Open();
                SQL = "delete from MONHOC where MAMONHOC = '" + mh.maMH + "'";

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
