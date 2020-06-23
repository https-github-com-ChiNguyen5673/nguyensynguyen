using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;
using QL_diem_THPT.SQLObject;
using QL_diem_THPT.Chay;

namespace QL_diem_THPT.Main
{
    public partial class frmHienThiDSHSLop : Form
    {
        c_HienThiDSHSLop cds = new c_HienThiDSHSLop();
        public frmHienThiDSHSLop()
        {
            InitializeComponent();
        }

        private void labHienThiTTHS_Click(object sender, EventArgs e)
        {
            if(txtNamHoc.Text != "")
            {
                if(cbbHocKi.Text != "")
                {
                    if(txtTenLop.Text != "")
                    {
                        NamHoc n = new NamHoc(null, txtNamHoc.Text);
                        HocKy h = new HocKy(null, cbbHocKi.Text, null);
                        Lop l = new Lop(null, txtTenLop.Text, null, null, null, null, null);
                            dgvDSHSLop.DataSource = cds.hienthiDS_HS(n, h, l);
                    }
                    else
                    {
                        MessageBox.Show("vui long nhập lớp");
                    }
                }
                else
                {
                    MessageBox.Show("vui long nhập học kỳ");
                }
            }
            else
            {
                MessageBox.Show("vui long nhập năm học");
            }
        }

        private void label5_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
