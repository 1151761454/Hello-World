using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.IO;
using System.Collections;

namespace 登录成绩管理系统
{
    public partial class Form1 : Form
    {
        ArrayList stud;
       
        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            FileStream fs = new FileStream("d:\\编程作业\\登录成绩管理系统\\数据库.txt", FileMode.Open, FileAccess.Read);
            StreamReader sr = new StreamReader(fs);
            string s = "";
            stud = new ArrayList();//定义集合，保存所有文件中的人的数据
            while ((s = sr.ReadLine()) != null)
            {
                stud.Add(s);//

            }


            string[] ss = stud[0].ToString().Split('^');
            
                if (textBox1.Text == ss[0].ToString() && textBox2.Text == ss[1].ToString() && textBox3.Text == textBox4.Text)
                {
                    this.Hide();
                    Form2 f2 = new Form2();
                    f2.Show();
                }

                if (textBox1.Text != "" && textBox2.Text != "" && textBox3.Text == textBox4.Text)
                {
                    if (textBox1.Text != ss[0].ToString() || textBox2.Text != ss[1].ToString())
                        MessageBox.Show("密码不正确！");

                }
                if (textBox1.Text != "" && textBox2.Text != "" && textBox3.Text != textBox4.Text)
                {
                    MessageBox.Show("验证码不正确！");
                }

                if (textBox1.Text == "")
                    MessageBox.Show("请输入用户名！");
                if (textBox1.Text != "" && textBox2.Text == "")
                    MessageBox.Show("请输入密码！");
          
            fs.Close();
            sr.Close();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            textBox4.Text = "";
            Random r=new Random ();
            for (int i = 0; i < 4; i++)
            {
                
                int z = r.Next(3) + 0;
                int t = -1;
                if (z == 0) t = r.Next(26) + 65;//大写字母
                if (z == 1) t = r.Next(26) + 97;//小写字母
                if (z == 2) t = r.Next(10) + 48;//数字
                textBox4.Text = textBox4.Text +((char)t).ToString();
                textBox4.ReadOnly = true;

            }    
         
            
         }

        private void button3_Click(object sender, EventArgs e)
        {
            textBox4.Text = "";
            Random r = new Random();
            for (int i = 0; i < 4; i++)
            {

                int z = r.Next(3) + 0;
                int t = -1;
                if (z == 0) t = r.Next(26) + 65;//大写字母
                if (z == 1) t = r.Next(26) + 97;//小写字母
                if (z == 2) t = r.Next(10) + 48;//数字
                textBox4.Text = textBox4.Text +((char)t).ToString();
                textBox4.ReadOnly = true;

            }    
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
