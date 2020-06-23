namespace QL_diem_THPT.Main
{
    partial class frmXoaHSDSLop
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
            this.label3 = new System.Windows.Forms.Label();
            this.btnThoatThem = new System.Windows.Forms.Button();
            this.btnThemLop = new System.Windows.Forms.Button();
            this.panel2 = new System.Windows.Forms.Panel();
            this.txtMaHS = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.txtTenLop = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.cbbHocKi = new System.Windows.Forms.ComboBox();
            this.txtNamHoc = new System.Windows.Forms.TextBox();
            this.label29 = new System.Windows.Forms.Label();
            this.label30 = new System.Windows.Forms.Label();
            this.panel1.SuspendLayout();
            this.panel2.SuspendLayout();
            this.SuspendLayout();
            // 
            // panel1
            // 
            this.panel1.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(255)))), ((int)(((byte)(128)))));
            this.panel1.Controls.Add(this.label3);
            this.panel1.Controls.Add(this.btnThoatThem);
            this.panel1.Controls.Add(this.btnThemLop);
            this.panel1.Controls.Add(this.panel2);
            this.panel1.Location = new System.Drawing.Point(12, 12);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(776, 376);
            this.panel1.TabIndex = 2;
            // 
            // label3
            // 
            this.label3.Font = new System.Drawing.Font("Times New Roman", 13.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label3.ForeColor = System.Drawing.Color.Red;
            this.label3.Location = new System.Drawing.Point(171, 12);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(446, 37);
            this.label3.TabIndex = 12;
            this.label3.Text = "Xóa học sinh vào một lớp bất kỳ";
            this.label3.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // btnThoatThem
            // 
            this.btnThoatThem.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnThoatThem.Font = new System.Drawing.Font("Times New Roman", 13.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnThoatThem.Location = new System.Drawing.Point(396, 305);
            this.btnThoatThem.Name = "btnThoatThem";
            this.btnThoatThem.Size = new System.Drawing.Size(163, 46);
            this.btnThoatThem.TabIndex = 11;
            this.btnThoatThem.Text = "Thoát";
            this.btnThoatThem.UseVisualStyleBackColor = true;
            this.btnThoatThem.Click += new System.EventHandler(this.btnThoatThem_Click);
            // 
            // btnThemLop
            // 
            this.btnThemLop.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnThemLop.Font = new System.Drawing.Font("Times New Roman", 13.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnThemLop.Location = new System.Drawing.Point(200, 305);
            this.btnThemLop.Name = "btnThemLop";
            this.btnThemLop.Size = new System.Drawing.Size(163, 46);
            this.btnThemLop.TabIndex = 10;
            this.btnThemLop.Text = "Xóa";
            this.btnThemLop.UseVisualStyleBackColor = true;
            this.btnThemLop.Click += new System.EventHandler(this.btnThemLop_Click);
            // 
            // panel2
            // 
            this.panel2.BackColor = System.Drawing.Color.White;
            this.panel2.Controls.Add(this.txtMaHS);
            this.panel2.Controls.Add(this.label1);
            this.panel2.Controls.Add(this.txtTenLop);
            this.panel2.Controls.Add(this.label2);
            this.panel2.Controls.Add(this.cbbHocKi);
            this.panel2.Controls.Add(this.txtNamHoc);
            this.panel2.Controls.Add(this.label29);
            this.panel2.Controls.Add(this.label30);
            this.panel2.Location = new System.Drawing.Point(39, 76);
            this.panel2.Name = "panel2";
            this.panel2.Size = new System.Drawing.Size(694, 200);
            this.panel2.TabIndex = 0;
            // 
            // txtMaHS
            // 
            this.txtMaHS.Anchor = System.Windows.Forms.AnchorStyles.Left;
            this.txtMaHS.Font = new System.Drawing.Font("Times New Roman", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtMaHS.Location = new System.Drawing.Point(301, 84);
            this.txtMaHS.Multiline = true;
            this.txtMaHS.Name = "txtMaHS";
            this.txtMaHS.Size = new System.Drawing.Size(185, 32);
            this.txtMaHS.TabIndex = 46;
            // 
            // label1
            // 
            this.label1.Font = new System.Drawing.Font("Times New Roman", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(177, 93);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(118, 23);
            this.label1.TabIndex = 45;
            this.label1.Text = "Mã học sinh";
            this.label1.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
            // 
            // txtTenLop
            // 
            this.txtTenLop.Anchor = System.Windows.Forms.AnchorStyles.Left;
            this.txtTenLop.Font = new System.Drawing.Font("Times New Roman", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtTenLop.Location = new System.Drawing.Point(300, 144);
            this.txtTenLop.Multiline = true;
            this.txtTenLop.Name = "txtTenLop";
            this.txtTenLop.Size = new System.Drawing.Size(185, 32);
            this.txtTenLop.TabIndex = 42;
            // 
            // label2
            // 
            this.label2.Font = new System.Drawing.Font("Times New Roman", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.Location = new System.Drawing.Point(222, 151);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(102, 23);
            this.label2.TabIndex = 41;
            this.label2.Text = "Lớp";
            this.label2.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
            // 
            // cbbHocKi
            // 
            this.cbbHocKi.Font = new System.Drawing.Font("Times New Roman", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cbbHocKi.FormattingEnabled = true;
            this.cbbHocKi.Items.AddRange(new object[] {
            "HỌC KỲ 1",
            "HỌC KỲ 2"});
            this.cbbHocKi.Location = new System.Drawing.Point(497, 31);
            this.cbbHocKi.Name = "cbbHocKi";
            this.cbbHocKi.Size = new System.Drawing.Size(176, 30);
            this.cbbHocKi.TabIndex = 40;
            this.cbbHocKi.Text = "(Vui lòng chọn)";
            // 
            // txtNamHoc
            // 
            this.txtNamHoc.Anchor = System.Windows.Forms.AnchorStyles.Left;
            this.txtNamHoc.Font = new System.Drawing.Font("Times New Roman", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtNamHoc.Location = new System.Drawing.Point(123, 31);
            this.txtNamHoc.Multiline = true;
            this.txtNamHoc.Name = "txtNamHoc";
            this.txtNamHoc.Size = new System.Drawing.Size(185, 32);
            this.txtNamHoc.TabIndex = 39;
            // 
            // label29
            // 
            this.label29.Font = new System.Drawing.Font("Times New Roman", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label29.Location = new System.Drawing.Point(26, 31);
            this.label29.Name = "label29";
            this.label29.Size = new System.Drawing.Size(102, 23);
            this.label29.TabIndex = 38;
            this.label29.Text = "Năm học";
            this.label29.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
            // 
            // label30
            // 
            this.label30.Font = new System.Drawing.Font("Times New Roman", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label30.Location = new System.Drawing.Point(390, 38);
            this.label30.Name = "label30";
            this.label30.Size = new System.Drawing.Size(101, 23);
            this.label30.TabIndex = 37;
            this.label30.Text = "Học kì";
            this.label30.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
            // 
            // frmXoaHSDSLop
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(804, 401);
            this.Controls.Add(this.panel1);
            this.Name = "frmXoaHSDSLop";
            this.Text = "frmXoaHSDSLop";
            this.panel1.ResumeLayout(false);
            this.panel2.ResumeLayout(false);
            this.panel2.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Button btnThoatThem;
        private System.Windows.Forms.Button btnThemLop;
        private System.Windows.Forms.Panel panel2;
        private System.Windows.Forms.TextBox txtMaHS;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox txtTenLop;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.ComboBox cbbHocKi;
        private System.Windows.Forms.TextBox txtNamHoc;
        private System.Windows.Forms.Label label29;
        private System.Windows.Forms.Label label30;
    }
}