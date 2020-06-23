using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QL_diem_THPT.SQLObject
{
    class Diem
    {
        private string MADIEM;
        private string MIENG1;
        private string MIENG2;
        private string MIENG3;
        private string MIENG4;
        private string _15PHUT1;
        private string _15PHUT2;
        private string _15PHUT3;
        private string _45PHUT1;
        private string _45PHUT2;
        private string CUOIKY;

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

        public string Mieng1
        {
            get
            {
                return MIENG1;
            }
            set
            {
                MIENG1 = value;
            }
        }

        public string Mieng2
        {
            get
            {
                return MIENG2;
            }
            set
            {
                MIENG2 = value;
            }
        }

        public string Mieng3
        {
            get
            {
                return MIENG3;
            }
            set
            {
                MIENG3 = value;
            }
        }

        public string Mieng4
        {
            get
            {
                return MIENG4;
            }
            set
            {
                MIENG4 = value;
            }
        }

        public string _15Phut1
        {
            get
            {
                return _15PHUT1;
            }
            set
            {
                _15PHUT1 = value;
            }
        }

        public string _15Phut2
        {
            get
            {
                return _15PHUT2;
            }
            set
            {
                _15PHUT2 = value;
            }
        }

        public string _15Phut3
        {
            get
            {
                return _15PHUT3;
            }
            set
            {
                _15PHUT3 = value;
            }
        }

        public string _45Phut1
        {
            get
            {
                return _45PHUT1;
            }
            set
            {
                _45PHUT1 = value;
            }
        }

        public string _45Phut2
        {
            get
            {
                return _45PHUT2;
            }
            set
            {
                _45PHUT2 = value;
            }
        }

        public string CuoiKy
        {
            get
            {
                return CUOIKY;
            }
            set
            {
                CUOIKY = value;
            }
        }

        public Diem() { }

        public Diem(string madiem, string mieng1, 
            string mieng2, string mieng3, string mieng4,
            string _15phut1, string _15phut2, string _15phut3, 
            string _45phut1, string _45phut2, string cuoiky)
        {
            this.MADIEM = madiem;
            this.MIENG1 = mieng1;
            this.MIENG2 = mieng2;
            this.MIENG3 = mieng3;
            this.MIENG4 = mieng4;
            this._15PHUT1 = _15phut1;
            this._15PHUT2 = _15phut2;
            this._15PHUT3 = _15phut3;
            this._45PHUT1 = _45phut1;
            this._45PHUT2 = _45phut2;
            this.CUOIKY = cuoiky;
        }
    }
}
