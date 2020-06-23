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
    class c_HienThiDSHSLop
    {
        cn_HienThiDSHS ds = new cn_HienThiDSHS();
        public DataTable hienthiDS_HS(NamHoc nh, HocKy hk, Lop l)
        {
            return ds.hienthiDS_HS(nh, hk, l);
        }
        
    }
}
