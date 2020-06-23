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
    class c_GiaoVien
    {
        cn_GiaoVien gv = new cn_GiaoVien();

        public DataTable hienthiGiaoVien()
        {
            return gv.hienthiGiaoVien();
        }

        public bool themGiaoVien(GiaoVien g)
        {
            return gv.themGiaoVien(g);
        }

        public bool suaGiaoVien(GiaoVien g)
        {
            return gv.suaGiaoVien(g);
        }


        public bool xoaGiaoVien(GiaoVien g)
        {
            return gv.xoaGiaoVien(g);
        }


        public DataTable timkiemMAGV(GiaoVien g)
        {
            return gv.timkiemMAGV(g);
        }

        public DataTable timkiemHTGV(GiaoVien g)
        {
            return gv.timkiemHTGV(g);
        }

        public DataTable timkiemGTGV(GiaoVien g)
        {
            return gv.timkiemGTGV(g);
        }

        public DataTable timkiemDCGV(GiaoVien g)
        {
            return gv.timkiemDCGV(g);
        }

        public DataTable timkiemSDTGV(GiaoVien g)
        {
            return gv.timkiemSDTGV(g);
        }

        public DataTable timkiemMHGV(MonHoc m)
        {
            return gv.timkiemMHGV(m);
        }


    }
}
