﻿using System;
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
    public partial class Form4 : Form
    {
        ArrayList stud;//集合保存所有人的数据  类内公用
        int no;//保存被修改的人编号
        public Form4()
        {
            InitializeComponent();
        }

        private void Form4_Load(object sender, EventArgs e)
        {
            FileStream fs = new FileStream("d:\\编程作业\\登录成绩管理系统\\学生数据.txt", FileMode.Open, FileAccess.Read);
            StreamReader sr = new StreamReader(fs);
            string s = "";
            while ((s = sr.ReadLine()) != null)
            {
                comboBox1.Items.Add(s.Substring(0, 3));

            }



            fs.Close();
            sr.Close();
        }

        private void button3_Click_1(object sender, EventArgs e)
        {
            textBox8.Text = ""; textBox9.Text = ""; textBox10.Text = "";
            string xh = comboBox1.Text.Trim();//取出用户选的学号
            //下面打开文件，把数据保存一个集合中，且把要修改的学生数据显示在窗口各控件中
            //修改了某个人的数据后，保存数据到磁盘文件中，实际上先把原文件删除，再把修改后的数据保存
            FileStream fs = new FileStream("d:\\编程作业\\登录成绩管理系统\\学生数据.txt", FileMode.Open, FileAccess.Read);
            StreamReader sr = new StreamReader(fs);
            string s = "";
            stud = new ArrayList();//定义集合，保存所有文件中的人的数据
            while ((s = sr.ReadLine()) != null)
            {
                stud.Add(s);//

            }
            for (int i = 0; i < stud.Count; i++)//来找出要修改的学号对应的人
            {
                if (stud[i].ToString().Trim().Substring(0, 3) == xh)
                {
                    no = i;//返回集合中的此人下标位置
                    string[] ss = stud[i].ToString().Split('^');
                    string[] ss1 = stud[i].ToString().Split(' ');
                    textBox1.Text = ss[1].ToString(); textBox1.ReadOnly = true;
                    textBox2.Text = ss[2].ToString(); textBox2.ReadOnly = true;

                    textBox3.Text = ss1[1].ToString(); textBox3.ReadOnly = true;
                    textBox4.Text = ss1[2].ToString(); textBox4.ReadOnly = true;
                    textBox5.Text = ss1[3].ToString(); textBox5.ReadOnly = true;
                    textBox6.Text = ss[4].ToString(); textBox6.ReadOnly = true;

                    ss[5] = ss[5].Replace(']', (char)10);
                    ss[5] = ss[5].Replace('|', (char)13);
                    textBox7.Text = ss[5].ToString(); textBox7.ReadOnly = true;
                    break;//已经把找到的人的数据显示窗口中以备修改，不需要再循环
                }
            }
            fs.Close();
            sr.Close();
        }

        private void button1_Click_1(object sender, EventArgs e)
        {
           
            string xh = comboBox1.Text.Trim();
            string xm = textBox1.Text.Trim();
            string xb = textBox2.Text.Trim();
            string csrq = " " + textBox3.Text.Trim() + " " + textBox4.Text.Trim() + " " + textBox5.Text.Trim() + " ";
            string zzmm = textBox6.Text.Trim();

            string grsm = textBox7.Text.Trim();
            grsm = grsm.Replace((char)13, '|');
            grsm = grsm.Replace((char)10, ']');
            string yw = textBox8.Text.Trim();
            string sx = textBox9.Text.Trim();
            string yy = textBox10.Text.Trim();
            //把此数据凑成一个串，去替换原arraylist中的被修改行
            string s0 = xh + "^" + xm + "^" + xb + "^" + csrq + "^" + zzmm + "^" + grsm + "^" + yw + "^" + sx + "^" + yy;
            //下面去修改集合中第no个人数据
            stud.RemoveAt(no);//先把命令中被修改的人第no个删除
            stud.Insert(no, s0);//在原来删除的位置插入新数据
            //下面把集合中的所有数据去覆盖源文件所有数据
            FileInfo fi = new FileInfo("d:\\编程作业\\登录成绩管理系统\\学生数据.txt");
            if (fi.Exists) fi.Delete();//如果此文件存在，，则先删除，记住，对文件的修改是先删除原文件，再新建一个文件

            FileStream fs = new FileStream("d:\\编程作业\\登录成绩管理系统\\学生数据.txt", FileMode.CreateNew, FileAccess.Write);
            StreamWriter sw = new StreamWriter(fs);
            for (int i = 0; i < stud.Count; i++)
                sw.WriteLine(stud[i].ToString());
            sw.Close();
            fs.Close();
            MessageBox.Show("成绩保存成功！");
        }

        private void button2_Click_1(object sender, EventArgs e)
        {
            this.Hide();
        }
    }
}
