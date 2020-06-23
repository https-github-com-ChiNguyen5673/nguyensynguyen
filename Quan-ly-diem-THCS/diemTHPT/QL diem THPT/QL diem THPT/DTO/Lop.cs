using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QL_diem_THPT.SQLObject
{
    class Lop
    {
        private string MALOP;
        private string TENLOP;
        private string SYSO;
        private string MA_LOP_TR;
        private string MA_GVCN;
        private string MACHUYEN;
        private string MAKHOI;

        public string MaLop
        {
            get
            {
                return MALOP;
            }
            set
            {
                MALOP = value;
            }
        }

        public string TenLop
        {
            get
            {
                return TENLOP;
            }
            set
            {
                TENLOP = value;
            }
        }

        public string SySo
        {
            get
            {
                return SYSO;
            }
            set
            {
                SYSO = value;
            }
        }

        public string Ma_LT
        {
            get
            {
                return MA_LOP_TR;
            }
            set
            {
                MA_LOP_TR = value;
            }
        }

        public string Ma_GVCN
        {
            get
            {
                return MA_GVCN;
            }
            set
            {
                MA_GVCN = value;
            }
        }

        public string MaChuyen
        {
            get
            {
                return MACHUYEN;
            }
            set
            {
                MACHUYEN = value;
            }
        }

        public string MaKhoi
        {
            get
            {
                return MAKHOI;
            }
            set
            {
                MAKHOI = value;
            }
        }

        public Lop() { }

        public Lop(string Malop, string Tenlop, string Syso, string Ma_lt, string Ma_gvcn, string Machuyen, string Makhoi)
        {
            this.MALOP = Malop;
            this.TENLOP = Tenlop;
            this.SYSO = Syso;
            this.MA_LOP_TR = Ma_lt;
            this.MA_GVCN = Ma_gvcn;
            this.MACHUYEN = Machuyen;
            this.MAKHOI = Makhoi;
        }


    }
}
