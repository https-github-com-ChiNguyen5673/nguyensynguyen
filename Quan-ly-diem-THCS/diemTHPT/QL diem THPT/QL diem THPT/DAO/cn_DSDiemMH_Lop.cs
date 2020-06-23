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
    class cn_DSDiemMH_Lop : ConnectSQL.CSDL_QLHS_GV
    {
        public DataTable hienthiDSDiemMH_Lop(NamHoc n, HocKy h, MonHoc m, Lop l)
        {
            string a = "exec hienthidsDiemMHLOP N'" + n.TenNH + "', N'" + h.TenHK + "', N'" + m.tenMH + "', N'" + l.TenLop + "'";
            conn.Open();
            SqlDataAdapter da = new SqlDataAdapter(a, conn);
            DataTable dt = new DataTable();

            da.Fill(dt);// đổ dữ liệu từ sql vào
            conn.Close();
            return dt;
        }
    }
}
