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
    class cn_Lop : ConnectSQL.CSDL_QLHS_GV
    {
        public DataTable hienthiLop()
        {
            conn.Open();
            string SQL = "SELECT TL.MALOP as'Mã Lớp',TENLOP as'Tên Lớp Học',SYSO as'Sỹ Số', HOHS+' '+TENHS as'Họ Tên Lớp Trưởng',HOGV+' '+TENGV as'Họ Tên GVCN',TENKHOI as'Khối',TEN_CHUYEN as'Chuyên',TENHK as'Học Kỳ',TENNH as'Năm Học' FROM LOP L, TT_LOP TL, HOCSINH H, CHUYEN C, KHOI K, GIAOVIEN G, NAM_HOC NH, HOC_KY HK WHERE NH.MANH=TL.MANH and HK.MAHK=TL.MAHK and TL.MALOP=L.MALOP and TL.MA_LOP_TR = H.MAHS AND TL.MA_GVCN = G.MAGV AND L.MAKHOI = K.MAKHOI AND L.MA_CHUYEN = C.MA_CHUYEN";
            SqlDataAdapter da = new SqlDataAdapter(SQL, conn);
            DataTable dt = new DataTable();

            da.Fill(dt);// đổ dữ liệu từ sql vào
            conn.Close();
            return dt;
        }


        
        public bool themLop(NamHoc n, HocKy h, Lop l)
        {
            try
            {
                conn.Open();

                string SQL = string.Format("exec themLop N'{0}', N'{1}', N'{2}', '{3}', '{4}'", h.TenHK, n.TenNH, l.TenLop, l.Ma_LT, l.Ma_GVCN);

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


        public bool suaLop(NamHoc n, HocKy h, Lop l)
        {
            try
            {
                conn.Open();

                string SQL = string.Format("exec suaLop N'{0}', N'{1}', N'{2}', '{3}', '{4}'", l.TenLop, h.TenHK, n.TenNH, l.Ma_LT, l.Ma_GVCN);

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


        public bool xoaLop(NamHoc n, HocKy h, Lop l)
        {
            try
            {
                conn.Open();

                string SQL = string.Format("exec xoaLop N'{0}', N'{1}', N'{2}'", l.TenLop, n.TenNH, h.TenHK);

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
