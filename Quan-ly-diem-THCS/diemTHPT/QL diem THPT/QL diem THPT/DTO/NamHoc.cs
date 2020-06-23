using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QL_diem_THPT.SQLObject
{
    class NamHoc
    {
        private string MANH;
        private string TENNH;

        public string MaNH
        {
            get
            {
                return MANH;
            }
            set
            {
                MANH = value;
            }
        }

        public string TenNH
        {
            get
            {
                return TENNH;
            }
            set
            {
                TENNH = value;
            }
        }

        public NamHoc() { }

        public NamHoc(string Manh, string Tennh)
        {
            this.MANH = Manh;
            this.TENNH = Tennh;
        }
    }
}
