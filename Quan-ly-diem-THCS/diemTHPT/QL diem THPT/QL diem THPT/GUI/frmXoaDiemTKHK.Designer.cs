namespace QL_diem_THPT.Main
{
    partial class frmXoaDiemTKHK
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.panel1 = new System.Windows.Forms.Panel();
            this.panel2 = new System.Windows.Forms.Panel();
            this.cbbHocKy = new System.Windows.Forms.ComboBox();
            this.btnThoatThem = new System.Windows.Forms.Button();
            this.btnThemDiem = new System.Windows.Forms.Button();
            this.txtMaDiem = new System.Windows.Forms.TextBox();
            this.label4 = new System.Windows.Forms.Label();
            this.txtNamHoc = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.txtMaHS = new System.Windows.Forms.TextBox();
            this.label21 = new System.Windows.Forms.Label();
            this.panel1.SuspendLayout();
            this.panel2.SuspendLayout();
            this.SuspendLayout();
            // 
            // panel1
            // 
            this.panel1.BackColor = System.Drawing.Color.Silver;
            this.panel1.Controls.Add(this.panel2);
            this.panel1.Location = new System.Drawing.Point(12, 12);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(993, 248);
            this.panel1.TabIndex = 2;
            // 
            // panel2
            // 
            this.panel2.BackColor = System.Drawing.Color.White;
            this.panel2.Controls.Add(this.cbbHocKy);
            this.panel2.Controls.Add(this.btnThoatThem);
            this.panel2.Controls.Add(this.btnThemDiem);
            this.panel2.Controls.Add(this.txtMaDiem);
            this.panel2.Controls.Add(this.label4);
            this.panel2.Controls.Add(this.txtNamHoc);
            this.panel2.Controls.Add(this.label2);
            this.panel2.Controls.Add(this.label1);
            this.panel2.Controls.Add(this.txtMaHS);
            this.panel2.Controls.Add(this.label21);
            this.panel2.Location = new System.Drawing.Point(35, 24);
            this.panel2.Name = "panel2";
            this.panel2.Size = new System.Drawing.Size(922, 201);
            this.panel2.TabIndex = 0;
            // 
            // cbbHocKy
            // 
            this.cbbHocKy.Font = new System.Drawing.Font("Times New Roman", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cbbHocKy.FormattingEnabled = true;
            this.cbbHocKy.Items.AddRange(new object[] {
            "Học Kỳ 1",
            "Học Kỳ 2"});
            this.cbbHocKy.Location = new System.Drawing.Point(633, 21);
            this.cbbHocKy.Name = "cbbHocKy";
            this.cbbHocKy.Size = new System.Drawing.Size(240, 30);
            this.cbbHocKy.TabIndex = 64;
            this.cbbHocKy.Text = "(vui lòng lựa chọn)";
            // 
            // btnThoatThem
            // 
            this.btnThoatThem.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnThoatThem.Font = new System.Drawing.Font("Times New Roman", 13.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnThoatThem.Location = new System.Drawing.Point(609, 144);
            this.btnThoatThem.Name = "btnThoatThem";
            this.btnThoatThem.Size = new System.Drawing.Size(163, 37);
            this.btnThoatThem.TabIndex = 62;
            this.btnThoatThem.Text = "Thoát";
            this.btnThoatThem.UseVisualStyleBackColor = true;
            this.btnThoatThem.Click += new System.EventHandler(this.btnThoatThem_Click);
            // 
            // btnThemDiem
            // 
            this.btnThemDiem.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnThemDiem.Font = new System.Drawing.Font("Times New Roman", 13.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnThemDiem.Location = new System.Drawing.Point(214, 144);
            this.btnThemDiem.Name = "btnThemDiem";
            this.btnThemDiem.Size = new System.Drawing.Size(159, 37);
            this.btnThemDiem.TabIndex = 61;
            this.btnThemDiem.Text = "Xóa";
            this.btnThemDiem.UseVisualStyleBackColor = true;
            // 
            // txtMaDiem
            // 
            this.txtMaDiem.Anchor = System.Windows.Forms.AnchorStyles.Left;
            this.txtMaDiem.Font = new System.Drawing.Font("Times New Roman", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtMaDiem.Location = new System.Drawing.Point(181, 68);
            this.txtMaDiem.Multiline = true;
            this.txtMaDiem.Name = "txtMaDiem";
            this.txtMaDiem.Size = new System.Drawing.Size(239, 32);
            this.txtMaDiem.TabIndex = 58;
            // 
            // label4
            // 
            this.label4.Font = new System.Drawing.Font("Times New Roman", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label4.Location = new System.Drawing.Point(45, 77);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(130, 23);
            this.label4.TabIndex = 57;
            this.label4.Text = "Mã điểm";
            this.label4.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
            // 
            // txtNamHoc
            // 
            this.txtNamHoc.Anchor = System.Windows.Forms.AnchorStyles.Left;
            this.txtNamHoc.Font = new System.Drawing.Font("Times New Roman", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtNamHoc.Location = new System.Drawing.Point(633, 74);
            this.txtNamHoc.Multiline = true;
            this.txtNamHoc.Name = "txtNamHoc";
            this.txtNamHoc.Size = new System.Drawing.Size(239, 32);
            this.txtNamHoc.TabIndex = 54;
            // 
            // label2
            // 
            this.label2.Font = new System.Drawing.Font("Times New Roman", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.Location = new System.Drawing.Point(484, 77);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(130, 23);
            this.label2.TabIndex = 53;
            this.label2.Text = "Năm Học";
            this.label2.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
            // 
            // label1
            // 
            this.label1.Font = new System.Drawing.Font("Times New Roman", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(484, 21);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(130, 23);
            this.label1.TabIndex = 51;
            this.label1.Text = "Học kỳ";
            this.label1.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
            // 
            // txtMaHS
            // 
            this.txtMaHS.Anchor = System.Windows.Forms.AnchorStyles.Left;
            this.txtMaHS.Font = new System.Drawing.Font("Times New Roman", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtMaHS.Location = new System.Drawing.Point(181, 19);
            this.txtMaHS.Multiline = true;
            this.txtMaHS.Name = "txtMaHS";
            this.txtMaHS.Size = new System.Drawing.Size(239, 32);
            this.txtMaHS.TabIndex = 50;
            // 
            // label21
            // 
            this.label21.Font = new System.Drawing.Font("Times New Roman", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label21.Location = new System.Drawing.Point(45, 28);
            this.label21.Name = "label21";
            this.label21.Size = new System.Drawing.Size(130, 23);
            this.label21.TabIndex = 49;
            this.label21.Text = "Mã học sinh";
            this.label21.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
            // 
            // frmXoaDiemTKHK
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1019, 274);
            this.Controls.Add(this.panel1);
            this.Name = "frmXoaDiemTKHK";
            this.Text = "Xóa Điểm Học Kỳ";
            this.panel1.ResumeLayout(false);
            this.panel2.ResumeLayout(false);
            this.panel2.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.Panel panel2;
        private System.Windows.Forms.ComboBox cbbHocKy;
        private System.Windows.Forms.Button btnThoatThem;
        private System.Windows.Forms.Button btnThemDiem;
        private System.Windows.Forms.TextBox txtMaDiem;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.TextBox txtNamHoc;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox txtMaHS;
        private System.Windows.Forms.Label label21;
    }
}