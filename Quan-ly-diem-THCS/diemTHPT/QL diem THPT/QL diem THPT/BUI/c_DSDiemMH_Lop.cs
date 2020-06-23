using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using QL_diem_THPT.SQLObject;
using QL_diem_THPT.Chuc_nang;
using System.Data;

namespace QL_diem_THPT.Chay
{
    class c_DSDiemMH_Lop
    {
        cn_DSDiemMH_Lop cnds = new cn_DSDiemMH_Lop();
        public DataTable hienthiDSDiemMH_Lop(NamHoc n, HocKy h, MonHoc m, Lop l)
        {
            return cnds.hienthiDSDiemMH_Lop(n, h, m, l);
        }
    }
}
