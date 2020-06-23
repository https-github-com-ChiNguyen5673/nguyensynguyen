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
    public partial class frmXoaHSDSLop : Form
    {
        c_DS_HS_Lop cdh = new c_DS_HS_Lop();
        public frmXoaHSDSLop()
        {
            InitializeComponent();
        }

        private void btnThoatThem_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void btnThemLop_Click(object sender, EventArgs e)
        {
            if (txtNamHoc.Text != "" && cbbHocKi.Text != "")
            {
                if (txtMaHS.Text != "")
                {
                    if (txtTenLop.Text != "")
                    {
                        HocSinh h = new HocSinh(txtMaHS.Text, null, null, DateTime.MinValue, null, null, null, null, null, null, null);
                        NamHoc n = new NamHoc(null, txtNamHoc.Text);
                        HocKy hk = new HocKy(null, cbbHocKi.Text, null);
                        Lop l = new Lop(null, txtTenLop.Text, null, null, null, null, null);
                        if (cdh.xoaDSHSLop(n, hk, h, l))
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
                        MessageBox.Show("xin vui lòng nhập lớp học thay đổi");
                    }
                }
                else
                {
                    MessageBox.Show("xin vui lòng nhập Mã học sinh cần tìm");
                }
            }
            else
            {
                MessageBox.Show("xin vui lòng nhập đủ năm học và học kỳ");
            }
        }
    }
}
