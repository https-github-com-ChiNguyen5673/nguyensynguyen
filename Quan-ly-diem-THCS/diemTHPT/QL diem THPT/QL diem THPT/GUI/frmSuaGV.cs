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
    public partial class frmSuaGV : Form
    {
        c_GiaoVien cgv = new c_GiaoVien();
        public frmSuaGV()
        {
            InitializeComponent();
        }

        private void btnThoatThem_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void btnThemHS_Click(object sender, EventArgs e)
        {
            if (txtMaGV.Text != "")
            {
                if (txtHoGV.Text != "" && txtTenGV.Text != ""
                && txtDC.Text != "" && txtSDT.Text != "")
                {
                    GiaoVien gv = new GiaoVien(txtMaGV.Text, txtHoGV.Text, txtTenGV.Text, dtpNS.Value,
                        cbbGT.Text, txtDC.Text, txtSDT.Text, txtMaMH.Text);
                    if (cgv.suaGiaoVien(gv))
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
                MessageBox.Show("xin vui lòng nhập mã giáo viên để sủa thông tin");
            }
        }
    }
}
