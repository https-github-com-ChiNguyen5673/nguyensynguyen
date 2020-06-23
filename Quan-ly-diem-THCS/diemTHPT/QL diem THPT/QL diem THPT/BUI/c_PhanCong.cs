using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using QL_diem_THPT.SQLObject;
using QL_diem_THPT.Chuc_nang;

namespace QL_diem_THPT.Chay
{
    class c_PhanCong
    {
        cn_PhanCong pc = new cn_PhanCong();
        public DataTable hienthiPhanCong()
        {
            return pc.hienthiPhanCong();
        }
        public bool themPhanCong(PhanCong p)
        {
            return pc.themPhanCong(p);
        }

        public bool suaPhanCong(PhanCong p)
        {
            return pc.suaPhanCong(p);
        }

        public bool xoaPhanCong(PhanCong p)
        {
            return pc.xoaPhanCong(p);
        }

    }
}
