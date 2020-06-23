using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using QL_diem_THPT.Chay;
using QL_diem_THPT.SQLObject;

namespace QL_diem_THPT.Main
{
    public partial class frmSuaHS : Form
    {
        c_HocSinh chs = new c_HocSinh();
        public frmSuaHS()
        {
            InitializeComponent();
        }
        private void btnThoatThem_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void btnThemHS_Click(object sender, EventArgs e)
        {
            if (txtMaHS.Text != "" )
            {
                if (txtHoHS.Text != "" && txtTenHS.Text != ""
                && txtHTBo.Text != "" && txtHTMe.Text != "" && txtDC.Text != "" && txtSDT.Text != "")
                {
                    HocSinh hs = new HocSinh(txtMaHS.Text, txtHoHS.Text, txtTenHS.Text, dtpNS.Value,
                        cbbGT.Text, txtDC.Text, txtSDT.Text, txtHTBo.Text, txtNNBo.Text, txtHTMe.Text, txtNNMe.Text);
                    if (chs.suaHocSinh(hs))
                    {
                        MessageBox.Show("sửa thành công");
                        //frmMain f = new frmMain();
                        //this.Hide();
                        //f.ShowDialog();
                        //f.Close();
                        this.Close();
                    }
                    else
                    {
                        MessageBox.Show("sửa không thành công");
                    }
                }
                else
                {
                    MessageBox.Show("xin vui lòng nhập đủ thông tin");
                }
            }
            else
            {
                MessageBox.Show("xin vui lòng nhập mã học sinh để sủa thông tin");
            }
        }
    }
}
