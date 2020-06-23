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
    public partial class frmMain : Form
    {

        c_HocSinh ch = new c_HocSinh();
        c_MonHoc mh = new c_MonHoc();
        c_GiaoVien gv = new c_GiaoVien();
        c_Lop cl = new c_Lop();
        c_Diem cd = new c_Diem();
        public frmMain()
        {
            InitializeComponent();
        }
        
        private void frmMain_Load(object sender, EventArgs e)
        {
            dgvDShocsinh.DataSource = ch.hienthiHocSinh();
            dgvDSMonHoc.DataSource = mh.hienthiMonHoc();
            dgvDSGiaoVien.DataSource = gv.hienthiGiaoVien();
            dgvDSLop.DataSource = cl.hienthiLop();
           
        }

        private void dgvDShocsinh_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            int i;
            i = dgvDShocsinh.CurrentRow.Index;
            labMa_HS.Text = dgvDShocsinh.Rows[i].Cells[0].Value.ToString();
            labTen_HS.Text = dgvDShocsinh.Rows[i].Cells[1].Value.ToString();
            labGT.Text = dgvDShocsinh.Rows[i].Cells[2].Value.ToString();
            labNS.Text = dgvDShocsinh.Rows[i].Cells[3].Value.ToString();
            labHTBo.Text = dgvDShocsinh.Rows[i].Cells[6].Value.ToString();
            labNNBo.Text = dgvDShocsinh.Rows[i].Cells[7].Value.ToString();
            labHTMe.Text = dgvDShocsinh.Rows[i].Cells[8].Value.ToString();
            labNNMe.Text = dgvDShocsinh.Rows[i].Cells[9].Value.ToString();
            labDC.Text = dgvDShocsinh.Rows[i].Cells[4].Value.ToString();
            labSDT.Text = dgvDShocsinh.Rows[i].Cells[5].Value.ToString();
        }

        private void btnThemHS_Click(object sender, EventArgs e)
        {
            frmThemHS f = new frmThemHS();
            //this.Hide();
            f.Show();
            //this.Close();
        }
        private void button2_Click(object sender, EventArgs e)
        {
            frmSuaHS f = new frmSuaHS();
            f.Show();

        }

        private void btnXoaHS_Click(object sender, EventArgs e)
        {
            frmXoaHS f = new frmXoaHS();
            f.Show();
        }

        private void btnThoatMain_Click_1(object sender, EventArgs e)
        {
            frmDangNhap f = new frmDangNhap();
            this.Hide();
            f.Show();
            this.Close();
        }

        

        private void btnThemGV_Click(object sender, EventArgs e)
        {
            frmThemGV f = new frmThemGV();
            f.Show();
        }

        private void btnSuaGV_Click(object sender, EventArgs e)
        {
            frmSuaGV f = new frmSuaGV();
            f.Show();
        }

        private void btnXoaGV_Click(object sender, EventArgs e)
        {
            frmXoaGV f = new frmXoaGV();
            f.Show();
        }

        private void btnThemLop_Click(object sender, EventArgs e)
        {
            frmThemLop f = new frmThemLop();
            f.Show();
        }

        private void btnSualop_Click(object sender, EventArgs e)
        {
            frmSuaLop f = new frmSuaLop();
            f.Show();
        }

        private void btnXoaLop_Click(object sender, EventArgs e)
        {
            frmXoaLop f = new frmXoaLop();
            f.Show();
        }

        private void btnThemMH_Click(object sender, EventArgs e)
        {
            frmThemMH f = new frmThemMH();
            f.Show();
        }

        private void btnSuaMH_Click(object sender, EventArgs e)
        {
            frmSuaMH f = new frmSuaMH();
            f.Show();
        }

        private void btnXoaMH_Click(object sender, EventArgs e)
        {
            frmXoaMH f = new frmXoaMH();
            f.Show();
        }
        private void btnThoatMain_Click_2(object sender, EventArgs e)
        {
            //frmDangNhap f = new frmDangNhap();
            //f.Show();
            Application.Exit();
        }

        private void ptb1_Click(object sender, EventArgs e)
        {
            ptb1.Image = QL_diem_THPT.Properties.Resources.books_521812297;
        }

        private void pictureBox1_Click(object sender, EventArgs e)
        {
            ptb2.Image = QL_diem_THPT.Properties.Resources.truong;
        }

        private void label3_Click(object sender, EventArgs e)
        {
            frmPhanCong f = new frmPhanCong();
            f.Show();
        }

        private void label4_Click(object sender, EventArgs e)
        {
            frmHienThiDSHSLop f = new frmHienThiDSHSLop();
            f.Show();
        }

        private void btnTimKiem_Click(object sender, EventArgs e)
        {
            
        }

        private void cbbTimKiem_SelectedIndexChanged(object sender, EventArgs e)
        {
            HocSinh h = new HocSinh(txtTimKiem.Text, txtTimKiem.Text, txtTimKiem.Text, DateTime.MinValue, txtTimKiem.Text, txtTimKiem.Text, txtTimKiem.Text, txtTimKiem.Text, txtTimKiem.Text, txtTimKiem.Text, txtTimKiem.Text);
            
            if (txtTimKiem.Text != "")
            {
                if (cbbTimKiem.Text == "Mã Học Sinh")
                {
                    dgvDShocsinh.DataSource = ch.timkiemMaHS(h);
                }
                else if(cbbTimKiem.Text == "Họ Tên Học Sinh")
                {
                    dgvDShocsinh.DataSource = ch.timkiemHTHS(h);
                }
                else if (cbbTimKiem.Text == "Giới Tính")
                {
                    dgvDShocsinh.DataSource = ch.timkiemGTHS(h);
                }
                else if (cbbTimKiem.Text == "Địa Chỉ")
                {
                    dgvDShocsinh.DataSource = ch.timkiemDCHS(h);
                }
                else if (cbbTimKiem.Text == "Số Điện Thoại")
                {
                    dgvDShocsinh.DataSource = ch.timkiemSDTHS(h);
                }
                else if (cbbTimKiem.Text == "Họ Tên Bố")
                {
                    dgvDShocsinh.DataSource = ch.timkiemHTBoHS(h);
                }
                else if (cbbTimKiem.Text == "Nghề Nghiệp Bố")
                {
                    dgvDShocsinh.DataSource = ch.timkiemNNBoHS(h);
                }
                else if (cbbTimKiem.Text == "Họ Tên Mẹ")
                {
                    dgvDShocsinh.DataSource = ch.timkiemHTMeHS(h);
                }
                else if (cbbTimKiem.Text == "Nghề Nghiệp")
                {
                    dgvDShocsinh.DataSource = ch.timkiemNNMeHS(h);
                }
                else
                {
                    MessageBox.Show("vui lòng lựa chọn Tìm Kiếm");
                }
            }
            else
            {
                MessageBox.Show("vui lòng nhập từ khóa tìm kiếm");
            }
        }

        private void panel10_Paint(object sender, PaintEventArgs e)
        {
            int i;
            i = dgvDShocsinh.CurrentRow.Index;
            labMa_HS.Text = dgvDShocsinh.Rows[i].Cells[0].Value.ToString();
            labTen_HS.Text = dgvDShocsinh.Rows[i].Cells[1].Value.ToString();
            labGT.Text = dgvDShocsinh.Rows[i].Cells[2].Value.ToString();
            labNS.Text = dgvDShocsinh.Rows[i].Cells[3].Value.ToString();
            labHTBo.Text = dgvDShocsinh.Rows[i].Cells[6].Value.ToString();
            labNNBo.Text = dgvDShocsinh.Rows[i].Cells[7].Value.ToString();
            labHTMe.Text = dgvDShocsinh.Rows[i].Cells[8].Value.ToString();
            labNNMe.Text = dgvDShocsinh.Rows[i].Cells[9].Value.ToString();
            labDC.Text = dgvDShocsinh.Rows[i].Cells[4].Value.ToString();
            labSDT.Text = dgvDShocsinh.Rows[i].Cells[5].Value.ToString();
        }

        private void pictureBox1_Click_1(object sender, EventArgs e)
        {
            dgvDShocsinh.DataSource = ch.hienthiHocSinh();
        }

        private void cbbGiaoVien_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (txtTimKiemGV.Text != "")
            {
                GiaoVien g = new GiaoVien(txtTimKiemGV.Text, txtTimKiemGV.Text,
                    txtTimKiemGV.Text,DateTime.MinValue, txtTimKiemGV.Text,
                    txtTimKiemGV.Text, txtTimKiemGV.Text, txtTimKiemGV.Text);
                MonHoc m = new MonHoc(null, txtTimKiemGV.Text, null);
                if (cbbGiaoVien.Text == "Mã Giáo Viên")
                {
                    dgvDSGiaoVien.DataSource = gv.timkiemMAGV(g);
                }
                else if (cbbGiaoVien.Text == "Họ Tên Giáo Viên")
                {
                    dgvDSGiaoVien.DataSource = gv.timkiemHTGV(g);
                }
                else if (cbbGiaoVien.Text == "Giới Tính")
                {
                    dgvDSGiaoVien.DataSource = gv.timkiemGTGV(g);
                }
                else if (cbbGiaoVien.Text == "Địa Chỉ")
                {
                    dgvDSGiaoVien.DataSource = gv.timkiemDCGV(g);
                }
                else if (cbbGiaoVien.Text == "Số Điện Thoại")
                {
                    dgvDSGiaoVien.DataSource = gv.timkiemSDTGV(g);
                }
                else if (cbbGiaoVien.Text == "Môn Giảng Dạy")
                {
                    dgvDSGiaoVien.DataSource = gv.timkiemMHGV(m);
                }
                else
                {
                    MessageBox.Show("vui lòng lựa chọn Tìm Kiếm");
                }
            }
            else
            {
                MessageBox.Show("vui lòng nhập từ khóa tìm kiếm");
            }
        }

        private void pictureBox2_Click(object sender, EventArgs e)
        {
            dgvDSGiaoVien.DataSource = gv.hienthiGiaoVien();
        }

        private void btnHienThi_Click(object sender, EventArgs e)
        {
            if(cbbLuaChon.Text == "Điểm chi tiết của học sinh")
            {
                if (txtNH.Text != "" && cbbHK.Text != "")
                {
                    if (txtMaHS.Text != "")
                    {
                        HocSinh h = new HocSinh(txtMaHS.Text, null, null, DateTime.MinValue, null, null, null, null, null, null, null);
                        NamHoc n = new NamHoc(null, txtNH.Text);
                        HocKy hk = new HocKy(null, cbbHK.Text, null);
                        dgvHTDiem.DataSource = cd.hienthiDSDiemMHHS(n, hk, h);

                    }
                    else
                    {
                        MessageBox.Show("vui lòng nhập mã học sinh");
                    }

                }
                else
                {
                    MessageBox.Show("vui lòng nhập đầy đủ năm học và học kỳ cần hiển thị");
                }
            }
            else if(cbbLuaChon.Text == "Điểm chi tiết của môn theo lớp")
            {
                if (txtNH.Text != "" && cbbHK.Text != "")
                {
                    if (txtTenMH.Text != "")
                    {
                        if(txtTenLop.Text != "")
                        {
                            c_DSDiemMH_Lop cds = new c_DSDiemMH_Lop();
                            NamHoc n = new NamHoc(null, txtTenMH.Text);
                            HocKy h = new HocKy(null, cbbHK.Text, null);
                            MonHoc m = new MonHoc(null, txtTenMH.Text, null);
                            Lop l = new Lop(null, txtTenLop.Text, null, null, null, null, null);
                            
                            dgvHTDiem.DataSource = cds.hienthiDSDiemMH_Lop(n, h, m, l);
                        }
                        else
                        {
                            MessageBox.Show("vui lòng nhập đầy đủ môn học cần hiển thị");
                        }
                    }
                    else
                    {
                        MessageBox.Show("vui lòng nhập Môn học cần hiển thị");
                    }

                }
                else
                {
                    MessageBox.Show("vui lòng nhập đầy đủ năm học và học kỳ cần hiển thị");
                }
            }
            else
            {
                MessageBox.Show("vui lòng lựa chọn lại");
            }
        }

        private void cbbSapXepHSLop_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(cbbSapXepHSLop.Text == "Thêm học sinh vào một lớp bất kỳ")
            {
                frmThemHSDSLop f = new frmThemHSDSLop();
                //this.Hide();
                //f.Show();
                f.Show();
            }
            else if(cbbSapXepHSLop.Text == "Thay đổi thông tin của học sinh trong lớp")
            {
                frmSuaDSHSLop f = new frmSuaDSHSLop();
                f.Show();
            }
            else if(cbbSapXepHSLop.Text == "Xóa học sinh trong lớp")
            {
                frmXoaHSDSLop f = new frmXoaHSDSLop();
                f.Show();
            }
            else
            {
                MessageBox.Show("Lỗi");
            }
        }

        

        private void btnThem_Click(object sender, EventArgs e)
        {
            if(cbbLuaChonQLDiem.Text == "Điểm môn học")
            {
                frmThemDiemMH f = new frmThemDiemMH();
                f.Show();
            }
            else if(cbbLuaChonQLDiem.Text == "Điểm tổng kết học kì")
            {
                frmThemDiemTKHK f = new frmThemDiemTKHK();
                f.Show();
            }
            else if(cbbLuaChonQLDiem.Text == "Điểm tổng kết cả năm")
            {
                frmThemDiemTKNH f = new frmThemDiemTKNH();
                f.Show();
            }
            else
            {
                MessageBox.Show("Vui lòng lựa chọn Thêm theo mục gì");
            }
        }

        private void btnXoa_Click(object sender, EventArgs e)
        {
            if (cbbLuaChonQLDiem.Text == "Điểm môn học")
            {
                frmXoaDiemMH f = new frmXoaDiemMH();
                f.Show();
            }
            else if (cbbLuaChonQLDiem.Text == "Điểm tổng kết học kì")
            {
                frmXoaDiemTKHK f = new frmXoaDiemTKHK();
                f.Show();
            }
            else if (cbbLuaChonQLDiem.Text == "Điểm tổng kết cả năm")
            {
                frmXoaDiemTKNH f = new frmXoaDiemTKNH();
                f.Show();
            }
            else
            {
                MessageBox.Show("Vui lòng lựa chọn Xóa theo mục gì");
            }
        }

        private void btnSua_Click(object sender, EventArgs e)
        {
            if (cbbLuaChonQLDiem.Text == "Điểm môn học")
            {
                frmSuaDiemMH f = new frmSuaDiemMH();
                f.Show();
            }
            else if (cbbLuaChonQLDiem.Text == "Điểm tổng kết học kì")
            {
                frmSuaDiemTKHK f = new frmSuaDiemTKHK();
                f.Show();
            }
            else if (cbbLuaChonQLDiem.Text == "Điểm tổng kết cả năm")
            {
                frmSuaDiemTKNH f = new frmSuaDiemTKNH();
                f.Show();
            }
            else
            {
                MessageBox.Show("Vui lòng lựa chọn Sửa theo mục gì");
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            dgvDSMonHoc.DataSource = mh.hienthiMonHoc();
        }
    }
}
