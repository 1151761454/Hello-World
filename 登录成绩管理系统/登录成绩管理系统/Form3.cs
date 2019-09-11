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

namespace 登录成绩管理系统
{
    public partial class Form3 : Form
    {
        public Form3()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            string xh = textBox1.Text.Trim();
            string xm = textBox2.Text.Trim();
            string xb = "男";
            if (radioButton2.Checked == true) xb = "女";
            string csrq = " " + comboBox1.Text.Trim() + " " + comboBox2.Text.Trim() + " " + comboBox3.Text.Trim() + " ";
            string zzmm = "共青团员";
            if (radioButton3.Checked == true) zzmm = "群众";
            if (radioButton5.Checked == true) zzmm = "党员";
            string grsm = textBox3.Text.Trim();
            grsm = grsm.Replace((char)13, '|');
            grsm = grsm.Replace((char)10, ']');

            //准备把上面的数据输入到一个stud.txt文件中长期保存
            string filename = "d:\\编程作业\\登录成绩管理系统\\学生数据.txt";
            FileStream myf;
            if (!File.Exists(filename))//如果文件不存在
            {
                myf = new FileStream(filename, FileMode.Create, FileAccess.ReadWrite);//如果文件不存在，先新建这个文件，且以读和写的方式打开文件
            }
            else
            {
                myf = new FileStream(filename, FileMode.Append, FileAccess.Write);
                //如果此文件已存在，则以追加数据的方式打开，可读可写
            }//此文件已经存在


            StreamWriter sw = new StreamWriter(myf);//建立一个写式的文件流对象sw，以追加数据进文件方式打开文件--原文件已经存在的数据不丢失
            //sw.Write(xh); sw.Write(xm); sw.Write(xb);
            //sw.Write(sr); sw.Write(xl); sw.Write(gkcj); sw.Write(grsm);
            sw.WriteLine(xh + "^" + xm + "^" + xb + "^" + csrq + "^" + zzmm + "^" + grsm);
            sw.Close();//文件流对象结束时要关闭
            MessageBox.Show("数据保存成功！");
        }

        private void Form3_Load(object sender, EventArgs e)
        {
            DateTime d0 = DateTime.Now;
            int y = d0.Year;
            int t = d0.Month;
            int d = d0.Day;
            for (int i = y; i >= y - 50; i--)
                comboBox1.Items.Add(i.ToString());
            for (int i = 1; i <= 12; i++)
                comboBox2.Items.Add(i.ToString());
        }

        private void comboBox2_SelectedIndexChanged(object sender, EventArgs e)
        {
            int y = int.Parse(comboBox1.Text); //把字符串数字转换为整数
            int m = int.Parse(comboBox2.Text);
            int d = 30;
            if (m == 1 || m == 3 || m == 5 || m == 7 || m == 8 || m == 10 || m == 12) d = 31;
            //  if(m==4||m==6||m==9||m==11) 
            if (m == 2)
            {
                if ((y % 400 == 0) || ((y % 100 == 0) && (y % 4 != 0)))
                    d = 29;
                else
                    d = 28;
            }
            comboBox3.Items.Clear();
            for (int i = 1; i <= d; i++) comboBox3.Items.Add(i.ToString());
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Hide();
        }
    }
}
