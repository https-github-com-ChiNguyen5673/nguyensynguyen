using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using QL_diem_THPT.Chuc_nang;
using QL_diem_THPT.SQLObject;

namespace QL_diem_THPT.Chay
{
    class c_MonHoc
    {
        cn_MonHoc m = new cn_MonHoc();

        public DataTable hienthiMonHoc()
        {
            return m.hienthiMonHoc();
        }

        public bool themMonHoc(MonHoc mh)
        {
            return m.themMonHoc(mh);
        }

        public bool suaMonHoc(MonHoc mh)
        {
            return m.suaMonHoc(mh);
        }
        
        public bool xoaMonHoc(MonHoc mh)
        {
            return m.xoaMonHoc(mh);
        }
    }
}
