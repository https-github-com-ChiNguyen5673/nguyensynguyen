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
    class cn_DS_HS_Lop : ConnectSQL.CSDL_QLHS_GV
    {
        public bool themDSHSLop(NamHoc n, HocKy hk, HocSinh h, Lop l)
        {
            try
            {
                conn.Open();
                string sql = string.Format("exec ThemDSHSLop N'{0}', N'{1}', N'{2}', '{3}'", n.TenNH, hk.TenHK, l.TenLop, h.Mahs);

                SqlCommand cmd = new SqlCommand(sql, conn);
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

        public bool suaDSHSLop(NamHoc n, HocKy hk, HocSinh h, Lop l)
        {
            try
            {
                conn.Open();
                string sql = string.Format("exec suaHSDSLop N'{0}', N'{1}', N'{2}', '{3}'", n.TenNH, hk.TenHK, h.Mahs, l.TenLop);

                SqlCommand cmd = new SqlCommand(sql, conn);
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

        public bool xoaDSHSLop(NamHoc n, HocKy hk, HocSinh h, Lop l)
        {
            try
            {
                conn.Open();
                string sql = string.Format("exec xoaHSDSLOP N'{0}', N'{1}', N'{2}', '{3}'", n.TenNH, hk.TenHK, h.Mahs, l.TenLop);

                SqlCommand cmd = new SqlCommand(sql, conn);
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
