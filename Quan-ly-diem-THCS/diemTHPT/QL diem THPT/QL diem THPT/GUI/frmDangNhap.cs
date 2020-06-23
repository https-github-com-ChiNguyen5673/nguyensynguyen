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
    public partial class frmDangNhap : Form
    {
        public frmDangNhap()
        {
            InitializeComponent();
        }

        public class GetUserAndPassword
        {
            public static string Username;
            public static string Password;
        }

        
        private void btnThoat_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void frmDangNhap_FormClosing(object sender, FormClosingEventArgs e)
        {
            if(MessageBox.Show("Bạn có thực sự muốn thoát khỏi ứng dụng này?", "Thông báo", MessageBoxButtons.OKCancel) != System.Windows.Forms.DialogResult.OK)
            {
                e.Cancel = true;
            }
        }

        

        private void lblQuenMK_Click(object sender, EventArgs e)
        {
            MessageBox.Show("Tên tài khoản: admin\n" +
                "Mật khẩu: " + frmDoiMK.GetNewPassword.NewPassword, "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
        }

        private void label5_Click(object sender, EventArgs e)
        {
            frmDoiMK f = new frmDoiMK();
            this.Hide();
            f.ShowDialog();
            this.Show();
        }

        private void btnDangNhap_Click(object sender, EventArgs e)
        {
            if (tbNhapUser.Text == "" && tbNhapPass.Text == "")
            {
                MessageBox.Show("Tên tài khoản và mật khẩu không thể để trống !", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                tbNhapUser.Focus();
            }
            else if (tbNhapUser.Text == "")
            {
                MessageBox.Show("Tên tài khoản không được bỏ trống !", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                tbNhapUser.Focus();
            }
            else if (tbNhapPass.Text == "")
            {
                MessageBox.Show("Mật khẩu không được bỏ trống !", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                tbNhapPass.Focus();
            }
            else
            {
                if (tbNhapUser.Text == "admin" && tbNhapPass.Text == frmDoiMK.GetNewPassword.NewPassword)
                {
                    GetUserAndPassword.Username = tbNhapUser.Text;
                    GetUserAndPassword.Password = tbNhapPass.Text;
                    frmMain f = new frmMain();
                    this.Hide();
                    f.ShowDialog();

                    this.Close();
                }
                else
                {
                    MessageBox.Show("Bạn vừa nhập sai tên người dùng hoặc mật khẩu, vui lòng nhập lại", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    tbNhapUser.Focus();
                }
            }
        }
    }
}
