﻿namespace QL_diem_THPT.Main
{
    partial class frmSuaDiemMH
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
            this.panel3 = new System.Windows.Forms.Panel();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.dgvHienThiCT = new System.Windows.Forms.DataGridView();
            this.panel2 = new System.Windows.Forms.Panel();
            this.button1 = new System.Windows.Forms.Button();
            this.cbbHocKy = new System.Windows.Forms.ComboBox();
            this.cbbLuaChon = new System.Windows.Forms.ComboBox();
            this.btnThoatThem = new System.Windows.Forms.Button();
            this.btnSuaDiem = new System.Windows.Forms.Button();
            this.txtDiem = new System.Windows.Forms.TextBox();
            this.txtMaDiem = new System.Windows.Forms.TextBox();
            this.label4 = new System.Windows.Forms.Label();
            this.txtMonHoc = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.txtNamHoc = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.txtMaHS = new System.Windows.Forms.TextBox();
            this.label21 = new System.Windows.Forms.Label();
            this.panel1.SuspendLayout();
            this.panel3.SuspendLayout();
            this.groupBox1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvHienThiCT)).BeginInit();
            this.panel2.SuspendLayout();
            this.SuspendLayout();
            // 
            // panel1
            // 
            this.panel1.BackColor = System.Drawing.Color.Silver;
            this.panel1.Controls.Add(this.panel3);
            this.panel1.Controls.Add(this.panel2);
            this.panel1.Location = new System.Drawing.Point(12, 12);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(1196, 349);
            this.panel1.TabIndex = 1;
            // 
            // panel3
            // 
            this.panel3.BackColor = System.Drawing.Color.White;
            this.panel3.Controls.Add(this.groupBox1);
            this.panel3.Location = new System.Drawing.Point(35, 231);
            this.panel3.Name = "panel3";
            this.panel3.Size = new System.Drawing.Size(1122, 104);
            this.panel3.TabIndex = 1;
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.dgvHienThiCT);
            this.groupBox1.Location = new System.Drawing.Point(4, 4);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(1115, 96);
            this.groupBox1.TabIndex = 0;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Hiển Thị";
            // 
            // dgvHienThiCT
            // 
            this.dgvHienThiCT.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.AllCells;
            this.dgvHienThiCT.AutoSizeRowsMode = System.Windows.Forms.DataGridViewAutoSizeRowsMode.AllCells;
            this.dgvHienThiCT.BackgroundColor = System.Drawing.Color.White;
            this.dgvHienThiCT.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvHienThiCT.Location = new System.Drawing.Point(0, 22);
            this.dgvHienThiCT.Name = "dgvHienThiCT";
            this.dgvHienThiCT.RowTemplate.Height = 24;
            this.dgvHienThiCT.Size = new System.Drawing.Size(1115, 74);
            this.dgvHienThiCT.TabIndex = 0;
            // 
            // panel2
            // 
            this.panel2.BackColor = System.Drawing.Color.White;
            this.panel2.Controls.Add(this.button1);
            this.panel2.Controls.Add(this.cbbHocKy);
            this.panel2.Controls.Add(this.cbbLuaChon);
            this.panel2.Controls.Add(this.btnThoatThem);
            this.panel2.Controls.Add(this.btnSuaDiem);
            this.panel2.Controls.Add(this.txtDiem);
            this.panel2.Controls.Add(this.txtMaDiem);
            this.panel2.Controls.Add(this.label4);
            this.panel2.Controls.Add(this.txtMonHoc);
            this.panel2.Controls.Add(this.label3);
            this.panel2.Controls.Add(this.txtNamHoc);
            this.panel2.Controls.Add(this.label2);
            this.panel2.Controls.Add(this.label1);
            this.panel2.Controls.Add(this.txtMaHS);
            this.panel2.Controls.Add(this.label21);
            this.panel2.Location = new System.Drawing.Point(35, 24);
            this.panel2.Name = "panel2";
            this.panel2.Size = new System.Drawing.Size(1122, 201);
            this.panel2.TabIndex = 0;
            // 
            // button1
            // 
            this.button1.Cursor = System.Windows.Forms.Cursors.Hand;
            this.button1.Font = new System.Drawing.Font("Times New Roman", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.button1.Location = new System.Drawing.Point(40, 163);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(163, 35);
            this.button1.TabIndex = 65;
            this.button1.Text = "Kiểm tra";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
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
            // cbbLuaChon
            // 
            this.cbbLuaChon.Font = new System.Drawing.Font("Times New Roman", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cbbLuaChon.FormattingEnabled = true;
            this.cbbLuaChon.Items.AddRange(new object[] {
            "Miệng lần 1",
            "Miệng lần 2",
            "Miệng lần 3",
            "Miệng lần 4",
            "15 phút lần 1",
            "15 phút lần 2",
            "15 phút lần 3",
            "45 phút lần 1",
            "45 phút lần 2",
            "Cuối kỳ"});
            this.cbbLuaChon.Location = new System.Drawing.Point(40, 120);
            this.cbbLuaChon.Name = "cbbLuaChon";
            this.cbbLuaChon.Size = new System.Drawing.Size(135, 30);
            this.cbbLuaChon.TabIndex = 63;
            this.cbbLuaChon.Text = "(lựa chọn)";
            // 
            // btnThoatThem
            // 
            this.btnThoatThem.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnThoatThem.Font = new System.Drawing.Font("Times New Roman", 13.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnThoatThem.Location = new System.Drawing.Point(927, 112);
            this.btnThoatThem.Name = "btnThoatThem";
            this.btnThoatThem.Size = new System.Drawing.Size(163, 37);
            this.btnThoatThem.TabIndex = 62;
            this.btnThoatThem.Text = "Thoát";
            this.btnThoatThem.UseVisualStyleBackColor = true;
            this.btnThoatThem.Click += new System.EventHandler(this.btnThoatThem_Click);
            // 
            // btnSuaDiem
            // 
            this.btnSuaDiem.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnSuaDiem.Font = new System.Drawing.Font("Times New Roman", 13.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnSuaDiem.Location = new System.Drawing.Point(927, 21);
            this.btnSuaDiem.Name = "btnSuaDiem";
            this.btnSuaDiem.Size = new System.Drawing.Size(159, 37);
            this.btnSuaDiem.TabIndex = 61;
            this.btnSuaDiem.Text = "Sửa";
            this.btnSuaDiem.UseVisualStyleBackColor = true;
            this.btnSuaDiem.Click += new System.EventHandler(this.btnSuaDiem_Click);
            // 
            // txtDiem
            // 
            this.txtDiem.Anchor = System.Windows.Forms.AnchorStyles.Left;
            this.txtDiem.Font = new System.Drawing.Font("Times New Roman", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtDiem.Location = new System.Drawing.Point(181, 118);
            this.txtDiem.Multiline = true;
            this.txtDiem.Name = "txtDiem";
            this.txtDiem.Size = new System.Drawing.Size(239, 32);
            this.txtDiem.TabIndex = 60;
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
            // txtMonHoc
            // 
            this.txtMonHoc.Anchor = System.Windows.Forms.AnchorStyles.Left;
            this.txtMonHoc.Font = new System.Drawing.Font("Times New Roman", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtMonHoc.Location = new System.Drawing.Point(633, 124);
            this.txtMonHoc.Multiline = true;
            this.txtMonHoc.Name = "txtMonHoc";
            this.txtMonHoc.Size = new System.Drawing.Size(239, 32);
            this.txtMonHoc.TabIndex = 56;
            // 
            // label3
            // 
            this.label3.Font = new System.Drawing.Font("Times New Roman", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label3.Location = new System.Drawing.Point(484, 127);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(130, 23);
            this.label3.TabIndex = 55;
            this.label3.Text = "Môn Học";
            this.label3.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
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
            // frmSuaDiemMH
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1227, 379);
            this.Controls.Add(this.panel1);
            this.Name = "frmSuaDiemMH";
            this.Text = "frmSuaDiemMH";
            this.panel1.ResumeLayout(false);
            this.panel3.ResumeLayout(false);
            this.groupBox1.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.dgvHienThiCT)).EndInit();
            this.panel2.ResumeLayout(false);
            this.panel2.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.Panel panel3;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.DataGridView dgvHienThiCT;
        private System.Windows.Forms.Panel panel2;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.ComboBox cbbHocKy;
        private System.Windows.Forms.ComboBox cbbLuaChon;
        private System.Windows.Forms.Button btnThoatThem;
        private System.Windows.Forms.Button btnSuaDiem;
        private System.Windows.Forms.TextBox txtDiem;
        private System.Windows.Forms.TextBox txtMaDiem;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.TextBox txtMonHoc;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.TextBox txtNamHoc;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox txtMaHS;
        private System.Windows.Forms.Label label21;
    }
}