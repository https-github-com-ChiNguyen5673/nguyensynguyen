using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using QL_diem_THPT.SQLObject;
using QL_diem_THPT.Chay;

namespace QL_diem_THPT.Main
{
    public partial class frmXoaGV : Form
    {
        c_GiaoVien cgv = new c_GiaoVien();
        public frmXoaGV()
        {
            InitializeComponent();
        }

        private void btnThoat_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void btnXoaGV_Click(object sender, EventArgs e)
        {
            if (txtXoaMaGV.Text != "")
            {
                GiaoVien g = new GiaoVien(txtXoaMaGV.Text, null, null, DateTime.MinValue, null, null, null, null);
                if (cgv.xoaGiaoVien(g))
                {
                    MessageBox.Show("xóa thành công");
                    //frmMain f = new frmMain();
                    //this.Hide();
                    //f.ShowDialog();
                    //f.Close();
                    this.Close();
                }
                else
                {
                    MessageBox.Show("xóa không thành công");
                }
            }
            else
            {
                MessageBox.Show("xin vui lòng nhập đầy đủ mã giáo viên cần xóa");
            }
        }
    }
}
