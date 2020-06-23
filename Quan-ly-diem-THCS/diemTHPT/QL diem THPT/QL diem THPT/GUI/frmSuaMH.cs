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
    public partial class frmSuaMH : Form
    {
        c_MonHoc cmh = new c_MonHoc();
        public frmSuaMH()
        {
            InitializeComponent();
        }
        
        private void btnThoat_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void btnSuaMH_Click(object sender, EventArgs e)
        {
            if (txtMaMH.Text != "")
            {
                if (txtTenMH.Text != "" )
                {
                    MonHoc mh = new MonHoc(txtMaMH.Text, txtTenMH.Text, cbbHeSo.Text);
                    if (cmh.suaMonHoc(mh))
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
                MessageBox.Show("xin vui lòng nhập mã môn học cần sủa thông tin");
            }
        }
    }
}
