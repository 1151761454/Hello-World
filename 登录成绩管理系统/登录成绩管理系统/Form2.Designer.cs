namespace 登录成绩管理系统
{
    partial class Form2
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
            this.label1 = new System.Windows.Forms.Label();
            this.menuStrip1 = new System.Windows.Forms.MenuStrip();
            this.数据入库ToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.成绩入库ToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.数据管理ToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.toolStripMenuItem1 = new System.Windows.Forms.ToolStripMenuItem();
            this.删除数据ToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.查询数据ToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.数据统计ToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.成绩统计ToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.人数统计ToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.退出系统ToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.label2 = new System.Windows.Forms.Label();
            this.menuStrip1.SuspendLayout();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("宋体", 16F, ((System.Drawing.FontStyle)((System.Drawing.FontStyle.Bold | System.Drawing.FontStyle.Italic))), System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.label1.ForeColor = System.Drawing.SystemColors.MenuHighlight;
            this.label1.Location = new System.Drawing.Point(108, 97);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(236, 27);
            this.label1.TabIndex = 6;
            this.label1.Text = "学生成绩管理系统";
            // 
            // menuStrip1
            // 
            this.menuStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.数据入库ToolStripMenuItem,
            this.成绩入库ToolStripMenuItem,
            this.数据管理ToolStripMenuItem,
            this.数据统计ToolStripMenuItem,
            this.退出系统ToolStripMenuItem});
            this.menuStrip1.Location = new System.Drawing.Point(0, 0);
            this.menuStrip1.Name = "menuStrip1";
            this.menuStrip1.Size = new System.Drawing.Size(507, 28);
            this.menuStrip1.TabIndex = 5;
            this.menuStrip1.Text = "menuStrip1";
            // 
            // 数据入库ToolStripMenuItem
            // 
            this.数据入库ToolStripMenuItem.Name = "数据入库ToolStripMenuItem";
            this.数据入库ToolStripMenuItem.Size = new System.Drawing.Size(81, 24);
            this.数据入库ToolStripMenuItem.Text = "数据入库";
            this.数据入库ToolStripMenuItem.Click += new System.EventHandler(this.数据入库ToolStripMenuItem_Click);
            // 
            // 成绩入库ToolStripMenuItem
            // 
            this.成绩入库ToolStripMenuItem.Name = "成绩入库ToolStripMenuItem";
            this.成绩入库ToolStripMenuItem.Size = new System.Drawing.Size(81, 24);
            this.成绩入库ToolStripMenuItem.Text = "成绩入库";
            this.成绩入库ToolStripMenuItem.Click += new System.EventHandler(this.成绩入库ToolStripMenuItem_Click);
            // 
            // 数据管理ToolStripMenuItem
            // 
            this.数据管理ToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.toolStripMenuItem1,
            this.删除数据ToolStripMenuItem,
            this.查询数据ToolStripMenuItem});
            this.数据管理ToolStripMenuItem.Name = "数据管理ToolStripMenuItem";
            this.数据管理ToolStripMenuItem.Size = new System.Drawing.Size(81, 24);
            this.数据管理ToolStripMenuItem.Text = "数据管理";
            this.数据管理ToolStripMenuItem.Click += new System.EventHandler(this.数据管理ToolStripMenuItem_Click);
            // 
            // toolStripMenuItem1
            // 
            this.toolStripMenuItem1.Name = "toolStripMenuItem1";
            this.toolStripMenuItem1.Size = new System.Drawing.Size(138, 24);
            this.toolStripMenuItem1.Text = "修改数据";
            this.toolStripMenuItem1.Click += new System.EventHandler(this.toolStripMenuItem1_Click);
            // 
            // 删除数据ToolStripMenuItem
            // 
            this.删除数据ToolStripMenuItem.Name = "删除数据ToolStripMenuItem";
            this.删除数据ToolStripMenuItem.Size = new System.Drawing.Size(138, 24);
            this.删除数据ToolStripMenuItem.Text = "删除数据";
            this.删除数据ToolStripMenuItem.Click += new System.EventHandler(this.删除数据ToolStripMenuItem_Click);
            // 
            // 查询数据ToolStripMenuItem
            // 
            this.查询数据ToolStripMenuItem.Name = "查询数据ToolStripMenuItem";
            this.查询数据ToolStripMenuItem.Size = new System.Drawing.Size(138, 24);
            this.查询数据ToolStripMenuItem.Text = "查询数据";
            this.查询数据ToolStripMenuItem.Click += new System.EventHandler(this.查询数据ToolStripMenuItem_Click);
            // 
            // 数据统计ToolStripMenuItem
            // 
            this.数据统计ToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.成绩统计ToolStripMenuItem,
            this.人数统计ToolStripMenuItem});
            this.数据统计ToolStripMenuItem.Name = "数据统计ToolStripMenuItem";
            this.数据统计ToolStripMenuItem.Size = new System.Drawing.Size(81, 24);
            this.数据统计ToolStripMenuItem.Text = "数据统计";
            // 
            // 成绩统计ToolStripMenuItem
            // 
            this.成绩统计ToolStripMenuItem.Name = "成绩统计ToolStripMenuItem";
            this.成绩统计ToolStripMenuItem.Size = new System.Drawing.Size(138, 24);
            this.成绩统计ToolStripMenuItem.Text = "成绩统计";
            this.成绩统计ToolStripMenuItem.Click += new System.EventHandler(this.成绩统计ToolStripMenuItem_Click);
            // 
            // 人数统计ToolStripMenuItem
            // 
            this.人数统计ToolStripMenuItem.Name = "人数统计ToolStripMenuItem";
            this.人数统计ToolStripMenuItem.Size = new System.Drawing.Size(138, 24);
            this.人数统计ToolStripMenuItem.Text = "人数统计";
            this.人数统计ToolStripMenuItem.Click += new System.EventHandler(this.人数统计ToolStripMenuItem_Click);
            // 
            // 退出系统ToolStripMenuItem
            // 
            this.退出系统ToolStripMenuItem.Name = "退出系统ToolStripMenuItem";
            this.退出系统ToolStripMenuItem.Size = new System.Drawing.Size(81, 24);
            this.退出系统ToolStripMenuItem.Text = "退出系统";
            this.退出系统ToolStripMenuItem.Click += new System.EventHandler(this.退出系统ToolStripMenuItem_Click);
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("宋体", 15F, ((System.Drawing.FontStyle)((System.Drawing.FontStyle.Bold | System.Drawing.FontStyle.Italic))), System.Drawing.GraphicsUnit.Point, ((byte)(134)));
            this.label2.ForeColor = System.Drawing.SystemColors.MenuHighlight;
            this.label2.Location = new System.Drawing.Point(12, 53);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(116, 25);
            this.label2.TabIndex = 7;
            this.label2.Text = "欢迎来到";
            // 
            // Form2
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 15F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(192)))), ((int)(((byte)(255)))), ((int)(((byte)(192)))));
            this.ClientSize = new System.Drawing.Size(507, 193);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.menuStrip1);
            this.Name = "Form2";
            this.Text = "Form2";
            this.menuStrip1.ResumeLayout(false);
            this.menuStrip1.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.MenuStrip menuStrip1;
        private System.Windows.Forms.ToolStripMenuItem 数据入库ToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem 成绩入库ToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem 数据管理ToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem toolStripMenuItem1;
        private System.Windows.Forms.ToolStripMenuItem 删除数据ToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem 查询数据ToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem 数据统计ToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem 成绩统计ToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem 人数统计ToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem 退出系统ToolStripMenuItem;
        private System.Windows.Forms.Label label2;
    }
}