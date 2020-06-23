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
    public partial class frmXoaHS : Form
    {
        c_HocSinh chs = new c_HocSinh();
        public frmXoaHS()
        {
            InitializeComponent();
        }
        
        private void btnThoatThem_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void btnXoaHS_Click(object sender, EventArgs e)
        {
            if(txtXoaMaHS.Text != "")
            {
                HocSinh hs = new HocSinh(txtXoaMaHS.Text, null, null, DateTime.MinValue, null, null, null, null, null, null, null);
                if (chs.xoaHocSinh(hs))
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
                MessageBox.Show("xin vui lòng nhập đầy đủ mã học sinh cần xóa");
            }
        
        }
    }
}
