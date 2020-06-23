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
    class c_Diem
    {
        cn_Diem cnd = new cn_Diem();

        public DataTable hienthiDSDiemMHHS(NamHoc nh, HocKy hk, HocSinh hs)
        {
            return cnd.hienthiDSDiem(nh, hk, hs);
        }
        
        public DataTable hienthiDiemMHCTHS(NamHoc n, HocKy hk, MonHoc m, HocSinh h)
        {
            return cnd.hienthiDiemMHCTHS(n, hk, m, h);
        }

        public bool themdiemMHCTHS_Mieng(Diem d, HocSinh h, NamHoc n, HocKy hk, MonHoc m)
        {
            return cnd.themdiemMHCTHS_Mieng(d, h, n, hk, m);
        }

        public bool themdiemMHCTHS_Mieng1(Diem d, HocSinh h, NamHoc n, HocKy hk, MonHoc m)
        {
            return cnd.themdiemMHCTHS_Mieng1(d, h, n, hk, m);
        }
        public bool themdiemMHCTHS_Mieng2(Diem d, HocSinh h, NamHoc n, HocKy hk, MonHoc m)
        {
            return cnd.themdiemMHCTHS_Mieng2(d, h, n, hk, m);
        }
        public bool themdiemMHCTHS_Mieng3(Diem d, HocSinh h, NamHoc n, HocKy hk, MonHoc m)
        {
            return cnd.themdiemMHCTHS_Mieng3(d, h, n, hk, m);
        }
        public bool themdiemMHCTHS_Mieng4(Diem d, HocSinh h, NamHoc n, HocKy hk, MonHoc m)
        {
            return cnd.themdiemMHCTHS_Mieng4(d, h, n, hk, m);
        }

        public bool themdiemMHCTHS_15Phut1(Diem d, HocSinh h, NamHoc n, HocKy hk, MonHoc m)
        {
            return cnd.themdiemMHCTHS_15Phut1(d, h, n, hk, m);
        }
        public bool themdiemMHCTHS_15Phut2(Diem d, HocSinh h, NamHoc n, HocKy hk, MonHoc m)
        {
            return cnd.themdiemMHCTHS_15Phut2(d, h, n, hk, m);
        }
        public bool themdiemMHCTHS_15Phut3(Diem d, HocSinh h, NamHoc n, HocKy hk, MonHoc m)
        {
            return cnd.themdiemMHCTHS_15Phut3(d, h, n, hk, m);
        }

        
        public bool themdiemMHCTHS_45Phut1(Diem d, HocSinh h, NamHoc n, HocKy hk, MonHoc m)
        {
            return cnd.themdiemMHCTHS_45Phut1(d, h, n, hk, m);
        }
        public bool themdiemMHCTHS_45Phut2(Diem d, HocSinh h, NamHoc n, HocKy hk, MonHoc m)
        {
            return cnd.themdiemMHCTHS_45Phut2(d, h, n, hk, m);
        }

        public bool themdiemMHCTHS_CuoiKy(Diem d, HocSinh h, NamHoc n, HocKy hk, MonHoc m)
        {
            return cnd.themdiemMHCTHS_CuoiKy(d, h, n, hk, m);
        }

        public DataTable hienthiDiemTKHKCTHS(NamHoc n, HocKy hk, HocSinh h)
        {
            return cnd.hienthiDiemTKHKCTHS(n, hk, h);
        }

        public bool themdiemTKHKCTHS(DiemTKHK d, HocSinh h, NamHoc n, HocKy hk)
        {
            return cnd.themdiemTKHKCTHS(d, h, n, hk);
        }

        public DataTable hienthiDiemTKCNCTHS(NamHoc n, HocSinh h)
        {
            return cnd.hienthiDiemTKCNCTHS(n, h);
        }

        public bool themdiemTKCNCTHS(DiemTKCN d, HocSinh h, NamHoc n)
        {
            return cnd.themdiemTKCNCTHS(d, h, n);
        }

        public bool XoadiemTKCNCTHS(DiemTKCN d)
        {
            return cnd.XoadiemTKCNCTHS(d);
        }
    }
}
