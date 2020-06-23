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
    public partial class frmXoaLop : Form
    {
        c_Lop cl = new c_Lop();
        public frmXoaLop()
        {
            InitializeComponent();
        }

        private void btnThoat_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void btnXoaLop_Click(object sender, EventArgs e)
        {
            if(txtNH.Text != "" && cbbHK.Text != "")
            {
                if (txtTenLop.Text != "")
                {
                    Lop l = new Lop(null, txtTenLop.Text, null, null, null, null, null);
                    NamHoc n = new NamHoc(null, txtNH.Text);
                    HocKy h = new HocKy(null, cbbHK.Text, null);
                    if (cl.xoaLop(n, h, l))
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
                    MessageBox.Show("xin vui lòng nhập đầy đủ tên lớp cần xóa");
                }
            }
            else
            {
                MessageBox.Show("xin vui lòng nhập đầy đủ năm học và học kỳ để tìm lớp cần xóa");
            }
        }
    }
}
