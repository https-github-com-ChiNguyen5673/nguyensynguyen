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
    public class c_HocSinh
    {
        cn_HocSinh cn = new cn_HocSinh();

        public DataTable hienthiHocSinh()
        {
            return cn.hienthiHocSinh();
        }

        public bool themHocSinh(HocSinh h)
        {
            return cn.themHocSinh(h);
        }

        public bool suaHocSinh(HocSinh h)
        {
            return cn.suaHocSinh(h);
        }

        public bool xoaHocSinh(HocSinh h)
        {
            return cn.xoaHocSinh(h);
        }
        
        public DataTable timkiemMaHS(HocSinh h)
        {
            return cn.timkiemMAHS(h);
        }

        public DataTable timkiemHTHS(HocSinh h)
        {
            return cn.timkiemHTHS(h);
        }
        
        public DataTable timkiemGTHS(HocSinh h)
        {
            return cn.timkiemGTHS(h);
        }

        public DataTable timkiemDCHS(HocSinh h)
        {
            return cn.timkiemDCHS(h);
        }

        public DataTable timkiemSDTHS(HocSinh h)
        {
            return cn.timkiemSDTHS(h);
        }
        public DataTable timkiemHTBoHS(HocSinh h)
        {
            return cn.timkiemHTBoHS(h);
        }
        public DataTable timkiemNNBoHS(HocSinh h)
        {
            return cn.timkiemNNBoHS(h);
        }
        public DataTable timkiemHTMeHS(HocSinh h)
        {
            return cn.timkiemHTMeHS(h);
        }
        public DataTable timkiemNNMeHS(HocSinh h)
        {
            return cn.timkiemNNMeHS(h);
        }




    }
}
