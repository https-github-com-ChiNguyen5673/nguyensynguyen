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
    public partial class frmXoaMH : Form
    {
        c_MonHoc cmh = new c_MonHoc();
        public frmXoaMH()
        {
            InitializeComponent();
        }

        private void btnThoat_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void btnXoaMH_Click(object sender, EventArgs e)
        {
            if (txtXoaMaMH.Text != "")
            {
                 MonHoc mh = new MonHoc(txtXoaMaMH.Text, null,null);
                if (cmh.xoaMonHoc(mh))
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
                MessageBox.Show("xin vui lòng nhập đầy đủ mã môn học");
            }
        }
    }
}
