namespace QL_diem_THPT.Main
{
    partial class frmXoaGV
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
            this.btnThoat = new System.Windows.Forms.Button();
            this.btnXoaGV = new System.Windows.Forms.Button();
            this.panel2 = new System.Windows.Forms.Panel();
            this.txtXoaMaGV = new System.Windows.Forms.TextBox();
            this.labMaHS = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.panel1.SuspendLayout();
            this.panel2.SuspendLayout();
            this.SuspendLayout();
            // 
            // panel1
            // 
            this.panel1.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(255)))), ((int)(((byte)(128)))));
            this.panel1.Controls.Add(this.btnThoat);
            this.panel1.Controls.Add(this.btnXoaGV);
            this.panel1.Controls.Add(this.panel2);
            this.panel1.Location = new System.Drawing.Point(12, 12);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(822, 317);
            this.panel1.TabIndex = 1;
            // 
            // btnThoat
            // 
            this.btnThoat.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnThoat.Font = new System.Drawing.Font("Times New Roman", 13.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnThoat.Location = new System.Drawing.Point(433, 252);
            this.btnThoat.Name = "btnThoat";
            this.btnThoat.Size = new System.Drawing.Size(163, 46);
            this.btnThoat.TabIndex = 10;
            this.btnThoat.Text = "Thoát";
            this.btnThoat.UseVisualStyleBackColor = true;
            this.btnThoat.Click += new System.EventHandler(this.btnThoat_Click);
            // 
            // btnXoaGV
            // 
            this.btnXoaGV.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnXoaGV.Font = new System.Drawing.Font("Times New Roman", 13.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnXoaGV.Location = new System.Drawing.Point(192, 252);
            this.btnXoaGV.Name = "btnXoaGV";
            this.btnXoaGV.Size = new System.Drawing.Size(163, 46);
            this.btnXoaGV.TabIndex = 9;
            this.btnXoaGV.Text = "Xóa";
            this.btnXoaGV.UseVisualStyleBackColor = true;
            this.btnXoaGV.Click += new System.EventHandler(this.btnXoaGV_Click);
            // 
            // panel2
            // 
            this.panel2.BackColor = System.Drawing.Color.White;
            this.panel2.Controls.Add(this.txtXoaMaGV);
            this.panel2.Controls.Add(this.labMaHS);
            this.panel2.Controls.Add(this.label1);
            this.panel2.Location = new System.Drawing.Point(24, 21);
            this.panel2.Name = "panel2";
            this.panel2.Size = new System.Drawing.Size(775, 199);
            this.panel2.TabIndex = 8;
            // 
            // txtXoaMaGV
            // 
            this.txtXoaMaGV.Anchor = System.Windows.Forms.AnchorStyles.Left;
            this.txtXoaMaGV.Cursor = System.Windows.Forms.Cursors.IBeam;
            this.txtXoaMaGV.Font = new System.Drawing.Font("Times New Roman", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtXoaMaGV.Location = new System.Drawing.Point(319, 98);
            this.txtXoaMaGV.Multiline = true;
            this.txtXoaMaGV.Name = "txtXoaMaGV";
            this.txtXoaMaGV.Size = new System.Drawing.Size(375, 39);
            this.txtXoaMaGV.TabIndex = 23;
            // 
            // labMaHS
            // 
            this.labMaHS.Font = new System.Drawing.Font("Times New Roman", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.labMaHS.Location = new System.Drawing.Point(135, 98);
            this.labMaHS.Name = "labMaHS";
            this.labMaHS.Size = new System.Drawing.Size(130, 39);
            this.labMaHS.TabIndex = 22;
            this.labMaHS.Text = "Mã giáo viên";
            this.labMaHS.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Times New Roman", 13.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.ForeColor = System.Drawing.Color.Red;
            this.label1.Location = new System.Drawing.Point(45, 28);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(705, 26);
            this.label1.TabIndex = 0;
            this.label1.Text = "Người dùng cần nhập mã giáo viên để xóa thông tin của giáo viên đó";
            // 
            // frmXoaGV
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(851, 345);
            this.Controls.Add(this.panel1);
            this.Name = "frmXoaGV";
            this.Text = "Xóa Giáo Viên";
            this.panel1.ResumeLayout(false);
            this.panel2.ResumeLayout(false);
            this.panel2.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.Button btnThoat;
        private System.Windows.Forms.Button btnXoaGV;
        private System.Windows.Forms.Panel panel2;
        private System.Windows.Forms.TextBox txtXoaMaGV;
        private System.Windows.Forms.Label labMaHS;
        private System.Windows.Forms.Label label1;
    }
}