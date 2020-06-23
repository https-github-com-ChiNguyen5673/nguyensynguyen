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
    class cn_HienThiDSHS : ConnectSQL.CSDL_QLHS_GV
    {
        public DataTable hienthiDS_HS(NamHoc nh, HocKy hk, Lop l)
        {
            conn.Open();
            SqlDataAdapter da = new SqlDataAdapter("select H.MAHS as 'Mã Học Sinh', HOHS+' '+TENHS as 'Họ Tên Học Sinh', NS as 'Ngày Sinh', GT as 'Giới Tính', DC as 'Địa Chỉ', SDT as 'Số Điện Thoại' from HOCSINH H, DS_HS_LOP DSL, LOP L, NAM_HOC N, HOC_KY HK where H.MAHS=DSL.MAHS and DSL.MALOP=L.MALOP and DSL.MANH=N.MANH and DSL.MAHK=HK.MAHK and TENNH = N'" + nh.TenNH + "' and TENHK = N'" + hk.TenHK + "' and TENLOP = N'" + l.TenLop + "'", conn);
            DataTable dt = new DataTable();

            da.Fill(dt);// đổ dữ liệu từ sql vào
            conn.Close();
            return dt;
        }
    }
}
