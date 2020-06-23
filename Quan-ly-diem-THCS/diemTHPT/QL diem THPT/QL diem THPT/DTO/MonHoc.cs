using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QL_diem_THPT.SQLObject
{
    class MonHoc
    {
        private string MAMONHOC;
        private string TEN_MON;
        private string HESO;

        public string maMH
        {
            get
            {
                return MAMONHOC;
            }
            set
            {
                MAMONHOC = value;
            }
        }

        public string tenMH
        {
            get
            {
                return TEN_MON;
            }
            set
            {
                TEN_MON = value;
            }
        }

        public string Heso
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
        public MonHoc() { }

        public MonHoc(string mamh, string tenmh, string heso)
        {
            this.MAMONHOC = mamh;
            this.TEN_MON = tenmh;
            this.HESO = heso;
        }
    }
}
