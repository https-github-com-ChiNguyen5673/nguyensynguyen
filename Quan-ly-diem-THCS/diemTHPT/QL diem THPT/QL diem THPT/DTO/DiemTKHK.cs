using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QL_diem_THPT.SQLObject
{
    class DiemTKHK
    {
        private string MADIEM;
        private string DIEMTK;

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
                return DIEMTK;
            }
            set
            {
                DIEMTK = value;
            }
        }

        public DiemTKHK() { }

        public DiemTKHK(string ma, string diem)
        {
            this.MADIEM = ma;
            this.DIEMTK = diem;
        }
    }
}
