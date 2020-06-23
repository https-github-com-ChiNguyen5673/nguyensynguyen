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
    class cn_Diem : ConnectSQL.CSDL_QLHS_GV
    {
        public DataTable hienthiDSDiem(NamHoc nh, HocKy hk, HocSinh hs)
        {
            conn.Open();
            SqlDataAdapter da = new SqlDataAdapter("exec dsDiemMHHS N'"+nh.TenNH+"', N'"+hk.TenHK+"', '"+hs.Mahs+"'", conn);
            DataTable dt = new DataTable();

            da.Fill(dt);// đổ dữ liệu từ sql vào
            conn.Close();
            return dt;
        }

        

        public DataTable hienthiDiemMHCTHS(NamHoc n, HocKy hk, MonHoc m, HocSinh h)
        {
            conn.Open();
            SqlDataAdapter da = new SqlDataAdapter("exec dsDiemMHCTHS  N'"+n.TenNH+"', N'"+hk.TenHK+"', N'"+m.tenMH+"', '"+h.Mahs+"'", conn);
            DataTable dt = new DataTable();

            da.Fill(dt);// đổ dữ liệu từ sql vào
            conn.Close();
            return dt;
        }
        public DataTable hienthiDiemTKHKCTHS(NamHoc n, HocKy hk, HocSinh h)
        {
            conn.Open();
            SqlDataAdapter da = new SqlDataAdapter("exec diemTKHKHS '" + h.Mahs + "', N'" + hk.TenHK + "', N'" + n.TenNH + "'", conn);
            DataTable dt = new DataTable();

            da.Fill(dt);// đổ dữ liệu từ sql vào
            conn.Close();
            return dt;
        }

        public DataTable hienthiDiemTKCNCTHS(NamHoc n, HocSinh h)
        {
            conn.Open();
            SqlDataAdapter da = new SqlDataAdapter("exec diemTKCNHS '" + h.Mahs + "', N'" + n.TenNH + "'", conn);
            DataTable dt = new DataTable();

            da.Fill(dt);// đổ dữ liệu từ sql vào
            conn.Close();
            return dt;
        }

        public bool themdiemMHCTHS_Mieng(Diem d, HocSinh h, NamHoc n, HocKy hk, MonHoc m)
        {
            try
            {
                conn.Open();

                string SQL = string.Format("exec themdiemMHCTHS_Mieng '" + d.MaDiem + "', '" + h.Mahs + "', N'" + n.TenNH + "', N'" + hk.TenHK + "', N'" + m.tenMH + "'");

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

        public bool themdiemMHCTHS_Mieng1(Diem d, HocSinh h, NamHoc n, HocKy hk, MonHoc m)
        {
            try
            {
                conn.Open();

                string SQL = string.Format("exec themdiemMHCTHS_Mieng1 '" + d.MaDiem + "', '" + h.Mahs + "', N'" + n.TenNH + "', N'" + hk.TenHK + "', N'" + m.tenMH + "', '"+d.Mieng1+"'");

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

        public bool themdiemMHCTHS_Mieng2(Diem d, HocSinh h, NamHoc n, HocKy hk, MonHoc m)
        {
            try
            {
                conn.Open();

                string SQL = string.Format("exec themdiemMHCTHS_Mieng2 '" + d.MaDiem + "', '" + h.Mahs + "', N'" + n.TenNH + "', N'" + hk.TenHK + "', N'" + m.tenMH + "', '" + d.Mieng2 + "'");

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

        public bool themdiemMHCTHS_Mieng3(Diem d, HocSinh h, NamHoc n, HocKy hk, MonHoc m)
        {
            try
            {
                conn.Open();

                string SQL = string.Format("exec themdiemMHCTHS_Mieng3 '" + d.MaDiem + "', '" + h.Mahs + "', N'" + n.TenNH + "', N'" + hk.TenHK + "', N'" + m.tenMH + "', '" + d.Mieng3 + "'");

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

        public bool themdiemMHCTHS_Mieng4(Diem d, HocSinh h, NamHoc n, HocKy hk, MonHoc m)
        {
            try
            {
                conn.Open();

                string SQL = string.Format("exec themdiemMHCTHS_Mieng4 '" + d.MaDiem + "', '" + h.Mahs + "', N'" + n.TenNH + "', N'" + hk.TenHK + "', N'" + m.tenMH + "', '" + d.Mieng4 + "'");

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

        public bool themdiemMHCTHS_15Phut1(Diem d, HocSinh h, NamHoc n, HocKy hk, MonHoc m)
        {
            try
            {
                conn.Open();

                string SQL = string.Format("exec themdiemMHCTHS_15Phut1 '" + d.MaDiem + "', '" + h.Mahs + "', N'" + n.TenNH + "', N'" + hk.TenHK + "', N'" + m.tenMH + "', '" + d._15Phut1 + "'");

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

        public bool themdiemMHCTHS_15Phut2(Diem d, HocSinh h, NamHoc n, HocKy hk, MonHoc m)
        {
            try
            {
                conn.Open();

                string SQL = string.Format("exec themdiemMHCTHS_15Phut2 '" + d.MaDiem + "', '" + h.Mahs + "', N'" + n.TenNH + "', N'" + hk.TenHK + "', N'" + m.tenMH + "', '" + d._15Phut2 + "'");

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

        public bool themdiemMHCTHS_15Phut3(Diem d, HocSinh h, NamHoc n, HocKy hk, MonHoc m)
        {
            try
            {
                conn.Open();

                string SQL = string.Format("exec themdiemMHCTHS_15Phut3 '" + d.MaDiem + "', '" + h.Mahs + "', N'" + n.TenNH + "', N'" + hk.TenHK + "', N'" + m.tenMH + "', '" + d._15Phut3 + "'");

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


        public bool themdiemMHCTHS_45Phut1(Diem d, HocSinh h, NamHoc n, HocKy hk, MonHoc m)
        {
            try
            {
                conn.Open();

                string SQL = string.Format("exec themdiemMHCTHS_45Phut1 '" + d.MaDiem + "', '" + h.Mahs + "', N'" + n.TenNH + "', N'" + hk.TenHK + "', N'" + m.tenMH + "', '" + d._45Phut1 + "'");

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

        public bool themdiemMHCTHS_45Phut2(Diem d, HocSinh h, NamHoc n, HocKy hk, MonHoc m)
        {
            try
            {
                conn.Open();

                string SQL = string.Format("exec themdiemMHCTHS_45Phut2 '" + d.MaDiem + "', '" + h.Mahs + "', N'" + n.TenNH + "', N'" + hk.TenHK + "', N'" + m.tenMH + "', '" + d._45Phut2 + "'");

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

        public bool themdiemMHCTHS_CuoiKy(Diem d, HocSinh h, NamHoc n, HocKy hk, MonHoc m)
        {
            try
            {
                conn.Open();

                string SQL = string.Format("exec themdiemMHCTHS_CuoiKy '" + d.MaDiem + "', '" + h.Mahs + "', N'" + n.TenNH + "', N'" + hk.TenHK + "', N'" + m.tenMH + "', '" + d.CuoiKy + "'");

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

        

        public bool themdiemTKHKCTHS(DiemTKHK d, HocSinh h, NamHoc n, HocKy hk)
        {
            try
            {
                conn.Open();

                string SQL = string.Format("exec themdiemTKHKCTHS '" + d.MaDiem + "', '" + h.Mahs + "', N'" + n.TenNH + "', N'" + hk.TenHK + "'");

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


        public bool themdiemTKCNCTHS(DiemTKCN d, HocSinh h, NamHoc n)
        {
            try
            {
                conn.Open();

                string SQL = string.Format("exec themdiemTKCNCTHS '" + d.MaDiem + "', '" + h.Mahs + "', N'" + n.TenNH + "'");

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


        public bool XoadiemTKCNCTHS(DiemTKCN d)
        {
            try
            {
                conn.Open();

                string SQL = string.Format("delete from DIEM_TKCN where MADIEM_TKCN = '"+d.MaDiem+"'");

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
