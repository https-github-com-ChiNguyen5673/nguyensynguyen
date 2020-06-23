namespace QL_diem_THPT.Main
{
    partial class frmThemDiemTKNH
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
            this.btnThoatThem = new System.Windows.Forms.Button();
            this.btnThemDiem = new System.Windows.Forms.Button();
            this.txtMaDiem = new System.Windows.Forms.TextBox();
            this.label4 = new System.Windows.Forms.Label();
            this.txtNamHoc = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
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
            this.panel1.TabIndex = 2;
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
            this.dgvHienThiCT.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
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
            this.panel2.Controls.Add(this.btnThoatThem);
            this.panel2.Controls.Add(this.btnThemDiem);
            this.panel2.Controls.Add(this.txtMaDiem);
            this.panel2.Controls.Add(this.label4);
            this.panel2.Controls.Add(this.txtNamHoc);
            this.panel2.Controls.Add(this.label2);
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
            this.button1.Location = new System.Drawing.Point(38, 143);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(163, 35);
            this.button1.TabIndex = 65;
            this.button1.Text = "Kiểm tra";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
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
            // btnThemDiem
            // 
            this.btnThemDiem.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnThemDiem.Font = new System.Drawing.Font("Times New Roman", 13.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnThemDiem.Location = new System.Drawing.Point(634, 112);
            this.btnThemDiem.Name = "btnThemDiem";
            this.btnThemDiem.Size = new System.Drawing.Size(159, 37);
            this.btnThemDiem.TabIndex = 61;
            this.btnThemDiem.Text = "Thêm";
            this.btnThemDiem.UseVisualStyleBackColor = true;
            this.btnThemDiem.Click += new System.EventHandler(this.btnThemDiem_Click);
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
            this.txtNamHoc.Location = new System.Drawing.Point(643, 25);
            this.txtNamHoc.Multiline = true;
            this.txtNamHoc.Name = "txtNamHoc";
            this.txtNamHoc.Size = new System.Drawing.Size(239, 32);
            this.txtNamHoc.TabIndex = 54;
            // 
            // label2
            // 
            this.label2.Font = new System.Drawing.Font("Times New Roman", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.Location = new System.Drawing.Point(494, 28);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(130, 23);
            this.label2.TabIndex = 53;
            this.label2.Text = "Năm Học";
            this.label2.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
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
            // frmThemDiemTKNH
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1219, 374);
            this.Controls.Add(this.panel1);
            this.Name = "frmThemDiemTKNH";
            this.Text = "frmThemDiemTKNH";
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
        private System.Windows.Forms.Button btnThoatThem;
        private System.Windows.Forms.Button btnThemDiem;
        private System.Windows.Forms.TextBox txtMaDiem;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.TextBox txtNamHoc;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox txtMaHS;
        private System.Windows.Forms.Label label21;
    }
}