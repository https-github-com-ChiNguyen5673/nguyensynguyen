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
    public partial class frmPhanCong : Form
    {
        c_PhanCong pc = new c_PhanCong();
        public frmPhanCong()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            frmMain f = new frmMain();
            this.Hide();
            f.ShowDialog();
            this.Close();
        }
        private void frmPhanCong_Load(object sender, EventArgs e)
        {
            dgvDSPhanCong.DataSource = pc.hienthiPhanCong();
        }

        private void btnThemGV_Click(object sender, EventArgs e)
        {
            if(txtMaGV.Text != "")
            {
                if(txtMaLop.Text != "")
                {
                    PhanCong p = new PhanCong(txtMaGV.Text, txtMaLop.Text, txtTG.Text);
                    if (pc.themPhanCong(p))
                    {
                        MessageBox.Show("Thêm thành công");
                        dgvDSPhanCong.DataSource = pc.hienthiPhanCong();
                    }
                    else
                    {
                        MessageBox.Show("Thêm không thành công");
                    }
                }
                MessageBox.Show("vui lòng nhập Mã lớp");
            }
            else
            {
                MessageBox.Show("vui lòng nhập Mã giáo viên");
            }
        }

        private void btnSuaGV_Click(object sender, EventArgs e)
        {
            if (txtMaGV.Text != "")
            {
                if (txtMaLop.Text != "")
                {
                    PhanCong p = new PhanCong(txtMaGV.Text, txtMaLop.Text, txtTG.Text);
                    if (pc.suaPhanCong(p))
                    {
                        MessageBox.Show("Sửa thành công");
                        dgvDSPhanCong.DataSource = pc.hienthiPhanCong();
                    }
                    else
                    {
                        MessageBox.Show("Sửa không thành công");
                    }
                }
                MessageBox.Show("vui lòng nhập Mã lớp");
            }
            else
            {
                MessageBox.Show("vui lòng nhập Mã giáo viên");
            }
        }

        private void btnXoaGV_Click(object sender, EventArgs e)
        {
            if (txtMaGV.Text != "")
            {
                if (txtMaLop.Text != "")
                {
                    PhanCong p = new PhanCong(txtMaGV.Text, txtMaLop.Text, txtTG.Text);
                    if (pc.xoaPhanCong(p))
                    {
                        MessageBox.Show("Xóa thành công");
                    }
                    else
                    {
                        MessageBox.Show("xóa không thành công");
                        dgvDSPhanCong.DataSource = pc.hienthiPhanCong();
                    }
                }
                MessageBox.Show("vui lòng nhập Mã lớp");
            }
            else
            {
                MessageBox.Show("vui lòng nhập Mã giáo viên");
            }
        }
    }
}
