using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QL_diem_THPT.SQLObject
{
    class DiemTKCN
    {
        private string MADIEM;
        private string DIEMTKCN;

        public string MaDiem
        {
            get
            {
                return MADIEM;
            }
            set
            {
                MADIEM = value;
            }
        }
        public string DiemTK
        {
            get
            {
                return DIEMTKCN;
            }
            set
            {
                DIEMTKCN = value;
            }
        }

        public DiemTKCN() { }

        public DiemTKCN(string ma, string diem)
        {
            this.MADIEM = ma;
            this.DIEMTKCN = diem;
        }
    }
}
