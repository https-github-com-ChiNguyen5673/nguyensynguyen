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
    public partial class frmSuaLop : Form
    {
        c_Lop cl = new c_Lop();
        public frmSuaLop()
        {
            InitializeComponent();
        }

        private void btnThoatThem_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void btnSuaLop_Click(object sender, EventArgs e)
        {
            if (txtNH.Text != "" && cbbHK.Text != "")
            {
                if (txtTenLop.Text != "" && txtMaLT.Text != "" && txtMaGVCN.Text != "")
                {
                    NamHoc n = new NamHoc(null, txtNH.Text);
                    HocKy h = new HocKy(null, cbbHK.Text, null);
                    Lop l = new Lop(null, txtTenLop.Text, null, txtMaLT.Text, txtMaGVCN.Text, null, null);

                    if (cl.suaLop(n, h, l))
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
                MessageBox.Show("xin vui lòng nhập đầy đủ năm học và học kỳ");
            }
        }
    }
}
