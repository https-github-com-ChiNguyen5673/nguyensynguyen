using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QL_diem_THPT.SQLObject
{
    class HocKy
    {
        private string MAHK;
        private string TENHK;
        private string HESO;

        public string MaHK
        {
            get
            {
                return MAHK;
            }
            set
            {
                MAHK = value;
            }
        }

        public string TenHK
        {
            get
            {
                return TENHK;
            }
            set
            {
                TENHK = value;
            }
        }

        public string HeSo
        {
            get
            {
                return HESO;
            }
            set
            {
                HESO = value;
            }
        }

        public HocKy() { }

        public HocKy(string Mahk, string Tenhk, string Heso)
        {
            this.MAHK = Mahk;
            this.TENHK = Tenhk;
            this.HESO = Heso;
        }
    }
}
