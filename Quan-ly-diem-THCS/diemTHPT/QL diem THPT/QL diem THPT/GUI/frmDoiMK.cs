using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QL_diem_THPT.Main
{
    public partial class frmDoiMK : Form
    {
        public frmDoiMK()
        {
            InitializeComponent();
        }


        public class GetNewPassword
        {
            public static string NewPassword = "admin";
        }

        
        public bool CheckData()
        {
            if (string.IsNullOrEmpty(tbMKcu.Text))
            {
                MessageBox.Show("Bạn cần điền vào mật khẩu cũ !!!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                tbMKcu.Focus();
                return false;
            }
            else if (string.IsNullOrEmpty(tbMKmoi.Text))
            {
                MessageBox.Show("Bạn cần điền vào mật khẩu mới !!!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                tbMKmoi.Focus();
                return false;
            }
            else if (string.IsNullOrEmpty(tbNhaplaiMKmoi.Text))
            {
                MessageBox.Show("Bạn cần nhập lại mật khẩu mới !!!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                tbNhaplaiMKmoi.Focus();
                return false;
            }
            else
            {
                return true;
            }
        }


        

        private void button1_Click(object sender, EventArgs e)
        {
            if (CheckData())
            {
                if (tbMKcu.Text == GetNewPassword.NewPassword)
                {
                    if (tbMKmoi.Text == tbNhaplaiMKmoi.Text)
                    {
                        if (tbMKmoi.Text.Length < 8)
                        {
                            MessageBox.Show("Mật khẩu phải có ít nhất 8 kí tự, vui lòng nhập lại.!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                        }
                        else
                        {
                            GetNewPassword.NewPassword = tbMKmoi.Text;
                            MessageBox.Show("Đã đổi mật khẩu thành công, mật khẩu mới là " + tbMKmoi.Text, "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);

                            frmDangNhap f = new frmDangNhap();
                            this.Hide();
                            f.ShowDialog();

                            this.Close();
                        }
                    }
                    else
                    {
                        MessageBox.Show("Nhập lại mật khẩu mới", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    }
                }
                else
                {
                    MessageBox.Show("Mật khẩu cũ là: " + GetNewPassword.NewPassword + ", vui lòng nhập lại.!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            frmDangNhap f = new frmDangNhap();
            this.Hide();
            f.ShowDialog();

            this.Close();
        }


    }
}
