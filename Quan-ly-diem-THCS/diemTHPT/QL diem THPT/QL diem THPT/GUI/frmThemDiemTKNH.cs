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
    public partial class frmThemDiemTKNH : Form
    {
        c_Diem cd = new c_Diem();
        public frmThemDiemTKNH()
        {
            InitializeComponent();
        }

        private void btnThoatThem_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void btnThemDiem_Click(object sender, EventArgs e)
        {
            DiemTKCN d = new DiemTKCN(txtMaDiem.Text, null);
            NamHoc n = new NamHoc(null, txtNamHoc.Text);
            HocSinh h = new HocSinh(txtMaHS.Text, null, null, DateTime.MinValue, null, null, null, null, null, null, null);
            if (txtMaHS.Text != "" && txtNamHoc.Text != "" && txtMaDiem.Text != "")
            {
                if (cd.themdiemTKCNCTHS(d, h, n))
                {
                    MessageBox.Show("Thêm thành công");
                    dgvHienThiCT.DataSource = cd.hienthiDiemTKCNCTHS(n, h);
                }
            }
            else
            {
                MessageBox.Show("vui lòng nhập đầy đủ thông tin");
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            if (txtMaHS.Text != "" && txtNamHoc.Text != "")
            {
                NamHoc n = new NamHoc(null, txtNamHoc.Text);
                HocSinh h = new HocSinh(txtMaHS.Text, null, null, DateTime.MinValue, null, null, null, null, null, null, null);
                dgvHienThiCT.DataSource = cd.hienthiDiemTKCNCTHS(n, h);
            }
            else
            {
                MessageBox.Show("Vui lòng nhập mã học sinh, học kỳ và năm học để kiểm tra");
            }
        }
    }
}
