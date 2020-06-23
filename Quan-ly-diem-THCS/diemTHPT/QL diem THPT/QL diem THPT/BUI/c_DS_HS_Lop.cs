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
    class c_DS_HS_Lop
    {
        cn_DS_HS_Lop cn = new cn_DS_HS_Lop();
        public bool themDSHSLop(NamHoc n, HocKy hk, HocSinh h, Lop l)
        {
            return cn.themDSHSLop(n, hk, h, l);
        }

        public bool suaDSHSLop(NamHoc n, HocKy hk, HocSinh h, Lop l)
        {
            return cn.suaDSHSLop(n, hk, h, l);
        }

        public bool xoaDSHSLop(NamHoc n, HocKy hk, HocSinh h, Lop l)
        {
            return cn.xoaDSHSLop(n, hk, h, l);
        }
    }
}
