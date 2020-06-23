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
    class c_Lop
    {
        cn_Lop cnl = new cn_Lop();
        public DataTable hienthiLop()
        {
            return cnl.hienthiLop();
        }

        public bool themLop(NamHoc n, HocKy h, Lop l)
        {
            return cnl.themLop(n, h, l);
        }

        public bool suaLop(NamHoc n, HocKy h, Lop l)
        {
            return cnl.suaLop(n, h, l);
        }

        public bool xoaLop(NamHoc n, HocKy h, Lop l)
        {
            return cnl.xoaLop(n, h, l);
        }
    }
}
