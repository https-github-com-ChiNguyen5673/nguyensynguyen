using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QL_diem_THPT.SQLObject
{
    public class HocSinh
    {
        private string MAHS;
        private string HOHS;
        private string TENHS;
        private DateTime NS;
        private string GT;
        private string DC;
        private string SDT;
        private string HTBo;
        private string NNBo;
        private string HTMe;
        private string NNMe;

        public string Mahs
        {
            get
            {
                return MAHS;
            }
            set
            {
                MAHS = value;
            }
        }

        public string Hohs
        {
            get
            {
                return HOHS;
            }
            set
            {
                HOHS = value;
            }
        }

        public string Tenhs
        {
            get
            {
                return TENHS;
            }
            set
            {
                TENHS = value;
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

        public string htBo
        {
            get
            {
                return HTBo;
            }
            set
            {
                HTBo = value;
            }
        }

        public string nnBo
        {
            get
            {
                return NNBo;
            }
            set
            {
                NNBo = value;
            }
        }

        public string htMe
        {
            get
            {
                return HTMe;
            }
            set
            {
                HTMe = value;
            }
        }

        public string nnMe
        {
            get
            {
                return NNMe;
            }
            set
            {
                NNMe = value;
            }
        }

        public HocSinh()
        {

        }

        public HocSinh(string mahs, string hohs, string tenhs,
            DateTime ns, string gt, string dc, string sdt, string htbo,
            string nnbo, string htme, string nnme)
        {
            this.MAHS = mahs;
            this.HOHS = hohs;
            this.TENHS = tenhs;
            this.NS = ns;
            this.GT = gt;
            this.DC = dc;
            this.SDT = sdt;
            this.HTBo = htbo;
            this.NNBo = nnbo;
            this.HTMe = htme;
            this.NNMe = nnme;
        }


    }
}
