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
    public partial class frmXoaDiemMH : Form
    {
        c_Diem cd = new c_Diem();
        public frmXoaDiemMH()
        {
            InitializeComponent();
        }

        private void btnThemDiem_Click(object sender, EventArgs e)
        {
            if(txtMaDiem.Text != "" && txtMaHS.Text != "" && txtMonHoc.Text != "" && txtNamHoc.Text != "" && cbbHocKy.Text != "")
            {
                DiemTKCN d = new DiemTKCN(txtMaDiem.Text, null);
                if (cd.XoadiemTKCNCTHS(d))
                {
                    MessageBox.Show("Xóa thành công");
                }
            }
            else
            {
                MessageBox.Show("Vui lòng nhập đầy đủ thông tin");
            }
        }

        private void btnThoatThem_Click(object sender, EventArgs e)
        {

        }
    }
}
