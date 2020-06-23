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
    public partial class frmThemDiemMH : Form
    {
        c_Diem cd = new c_Diem();
        public frmThemDiemMH()
        {
            InitializeComponent();
        }

        private void btnThemHS_Click(object sender, EventArgs e)
        {
            Diem d = new Diem(txtMaDiem.Text, txtDiem.Text, txtDiem.Text, txtDiem.Text, txtDiem.Text, txtDiem.Text, txtDiem.Text, txtDiem.Text, txtDiem.Text, txtDiem.Text, txtDiem.Text);
            HocSinh h = new HocSinh(txtMaHS.Text, null, null, DateTime.MinValue, null, null, null, null, null, null, null);
            NamHoc n = new NamHoc(null, txtNamHoc.Text);
            HocKy hk = new HocKy(null, cbbHocKy.Text, null);
            MonHoc m = new MonHoc(null, txtMonHoc.Text, null);
            if(txtDiem.Text == "")
            {
                if(txtMaDiem.Text != "" && txtMaHS.Text != "" && txtNamHoc.Text != "" && cbbHocKy.Text != "" && txtMonHoc.Text != "")
                {
                    if(cd.themdiemMHCTHS_Mieng(d, h, n, hk, m))
                    {
                        MessageBox.Show("Khởi tạo thành công");
                        dgvHienThiCT.DataSource = cd.hienthiDiemMHCTHS(n, hk, m, h);
                    }
                    else
                    {
                        MessageBox.Show("Thêm không thành công! Đã tồn tại");
                    }
                }
                else
                {
                    MessageBox.Show("vui lòng nhập mã điểm, mã học sinh, năm học, học kỳ và môn học để khỏi tạo điểm");
                }
            }
            else
            {
                if (txtMaDiem.Text != "" && txtMaHS.Text != "" && txtNamHoc.Text != "" && cbbHocKy.Text != "" && txtMonHoc.Text != "")
                {
                    if(cbbLuaChon.Text == "Miệng lần 1")
                    {
                        if (cd.themdiemMHCTHS_Mieng1(d, h, n, hk, m))
                        {
                            MessageBox.Show("Thêm thành công");
                            dgvHienThiCT.DataSource = cd.hienthiDiemMHCTHS(n, hk, m, h);
                        }
                        else
                        {
                            MessageBox.Show("Thêm không thành công");
                        }
                    }
                    else if (cbbLuaChon.Text == "Miệng lần 2")
                    {
                        if (cd.themdiemMHCTHS_Mieng2(d, h, n, hk, m))
                        {
                            MessageBox.Show("Thêm thành công");
                            dgvHienThiCT.DataSource = cd.hienthiDiemMHCTHS(n, hk, m, h);
                        }
                        else
                        {
                            MessageBox.Show("Thêm không thành công");
                        }
                    }
                    else if (cbbLuaChon.Text == "Miệng lần 3")
                    {
                        if (cd.themdiemMHCTHS_Mieng3(d, h, n, hk, m))
                        {
                            MessageBox.Show("Thêm thành công");
                            dgvHienThiCT.DataSource = cd.hienthiDiemMHCTHS(n, hk, m, h);
                        }
                        else
                        {
                            MessageBox.Show("Thêm không thành công");
                        }
                    }
                    else if (cbbLuaChon.Text == "Miệng lần 4")
                    {
                        if (cd.themdiemMHCTHS_Mieng4(d, h, n, hk, m))
                        {
                            MessageBox.Show("Thêm thành công");
                            dgvHienThiCT.DataSource = cd.hienthiDiemMHCTHS(n, hk, m, h);
                        }
                        else
                        {
                            MessageBox.Show("Thêm không thành công");
                        }
                    }
                    else if(cbbLuaChon.Text == "15 phút lần 1")
                    {
                        if (cd.themdiemMHCTHS_15Phut1(d, h, n, hk, m))
                        {
                            MessageBox.Show("Thêm thành công");
                            dgvHienThiCT.DataSource = cd.hienthiDiemMHCTHS(n, hk, m, h);
                        }
                        else
                        {
                            MessageBox.Show("Thêm không thành công");
                        }
                    }
                    else if (cbbLuaChon.Text == "15 phút lần 2")
                    {
                        if (cd.themdiemMHCTHS_15Phut2(d, h, n, hk, m))
                        {
                            MessageBox.Show("Thêm thành công");
                            dgvHienThiCT.DataSource = cd.hienthiDiemMHCTHS(n, hk, m, h);
                        }
                        else
                        {
                            MessageBox.Show("Thêm không thành công");
                        }
                    }
                    else if (cbbLuaChon.Text == "15 phút lần 3")
                    {
                        if (cd.themdiemMHCTHS_15Phut3(d, h, n, hk, m))
                        {
                            MessageBox.Show("Thêm thành công");
                            dgvHienThiCT.DataSource = cd.hienthiDiemMHCTHS(n, hk, m, h);
                        }
                        else
                        {
                            MessageBox.Show("Thêm không thành công");
                        }
                    }
                    else if (cbbLuaChon.Text == "45 phút lần 1")
                    {
                        if (cd.themdiemMHCTHS_45Phut1(d, h, n, hk, m))
                        {
                            MessageBox.Show("Thêm thành công");
                            dgvHienThiCT.DataSource = cd.hienthiDiemMHCTHS(n, hk, m, h);
                        }
                        else
                        {
                            MessageBox.Show("Thêm không thành công");
                        }
                    }
                    else if (cbbLuaChon.Text == "45 phút lần 2")
                    {
                        if (cd.themdiemMHCTHS_45Phut2(d, h, n, hk, m))
                        {
                            MessageBox.Show("Thêm thành công");
                            dgvHienThiCT.DataSource = cd.hienthiDiemMHCTHS(n, hk, m, h);
                        }
                        else
                        {
                            MessageBox.Show("Thêm không thành công");
                        }
                    }
                    else if (cbbLuaChon.Text == "Cuối kỳ")
                    {
                        if (cd.themdiemMHCTHS_CuoiKy(d, h, n, hk, m))
                        {
                            MessageBox.Show("Thêm thành công");
                            dgvHienThiCT.DataSource = cd.hienthiDiemMHCTHS(n, hk, m, h);
                        }
                        else
                        {
                            MessageBox.Show("Thêm không thành công");
                        }
                    }
                }
            }
        }

        private void dgvHienThiCT_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            NamHoc n = new NamHoc(null, txtNamHoc.Text);
            HocKy hk = new HocKy(null, cbbHocKy.Text, null);
            MonHoc m = new MonHoc(null, txtMonHoc.Text, null);
            HocSinh h = new HocSinh(txtMaHS.Text, null, null, DateTime.MinValue, null, null, null, null, null, null, null);
            dgvHienThiCT.DataSource = cd.hienthiDiemMHCTHS(n, hk, m, h);
        }

        private void btnThoatThem_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            NamHoc n = new NamHoc(null, txtNamHoc.Text);
            HocKy hk = new HocKy(null, cbbHocKy.Text, null);
            MonHoc m = new MonHoc(null, txtMonHoc.Text, null);
            HocSinh h = new HocSinh(txtMaHS.Text, null, null, DateTime.MinValue, null, null, null, null, null, null, null);
            dgvHienThiCT.DataSource = cd.hienthiDiemMHCTHS(n, hk, m, h);
        }
    }
}
