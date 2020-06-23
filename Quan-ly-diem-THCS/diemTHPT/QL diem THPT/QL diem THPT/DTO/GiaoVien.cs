using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QL_diem_THPT.SQLObject
{
    class GiaoVien
    {
        private string MAGV;
        private string HOGV;
        private string TENGV;
        private DateTime NS;
        private string GT;
        private string DC;
        private string SDT;
        private string MAMH;

        public string maGV
        {
            get
            {
                return MAGV;
            }
            set
            {
                MAGV = value;
            }
        }

        public string hoGV
        {
            get
            {
                return HOGV;
            }
            set
            {
                HOGV = value;
            }
        }

        public string tenGV
        {
            get
            {
                return TENGV;
            }
            set
            {
                TENGV = value;
            }
        }

        public DateTime Ns
        {
            get
            {
                return NS;
            }
            set
            {
                NS = value;
            }
        }

        public string Gt
        {
            get
            {
                return GT;
            }
            set
            {
                GT = value;
            }
        }

        public string Dc
        {
            get
            {
                return DC;
            }
            set
            {
                DC = value;
            }
        }

        public string Sdt
        {
            get
            {
                return SDT;
            }
            set
            {
                SDT = value;
            }
        }

        public string Mamh
        {
            get
            {
                return MAMH;
            }
            set
            {
                MAMH = value;
            }
        }
        
        public GiaoVien() { }

        public GiaoVien(string magv, string hogv, string tengv, DateTime ns, string gt, string dc, string sdt, string mamh)
        {
            this.MAGV = magv;
            this.HOGV = hogv;
            this.TENGV = tengv;
            this.NS = ns;
            this.GT = gt;
            this.DC = dc;
            this.SDT = sdt;
            this.MAMH = mamh;
        }
    }
}
