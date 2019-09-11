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
    public partial class Form5 : Form
    {
        ArrayList stud;//集合保存所有人的数据  类内公用
        int no;//保存被修改的人编号
        public Form5()
        {
            InitializeComponent();
        }

        private void Form5_Load(object sender, EventArgs e)
        {
            DateTime d0 = DateTime.Now;
            int y = d0.Year;
            int t = d0.Month;
            int d = d0.Day;
            for (int i = y; i >= y - 50; i--)
                comboBox2.Items.Add(i.ToString());
            for (int i = 1; i <= 12; i++)
                comboBox3.Items.Add(i.ToString());

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

        private void button3_Click(object sender, EventArgs e)
        {
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
                    string[] ss2 = stud[i].ToString().Split(' ');
                    textBox1.Text = ss[1].ToString();

                    if (ss[2].ToString().Trim() == "男") radioButton1.Checked = true;
                    else radioButton2.Checked = true;
                    comboBox2.Text = ss2[1].ToString();
                    comboBox3.Text = ss2[2].ToString();
                    comboBox4.Text = ss2[3].ToString();
                    if (ss[4].ToString().Trim() == "群众") radioButton3.Checked = true;
                    if (ss[4].ToString().Trim() == "共青团员") radioButton4.Checked = true;
                    else radioButton5.Checked = true;

                    ss[5] = ss[5].Replace(']', (char)10);
                    ss[5] = ss[5].Replace('|', (char)13);
                    textBox2.Text = ss[5].ToString();
                    textBox3.Text = ss[6].ToString();
                    textBox4.Text = ss[7].ToString();
                    textBox5.Text = ss[8].ToString();
                    break;//已经把找到的人的数据显示窗口中以备修改，不需要再循环
                }
            }
            fs.Close();
            sr.Close();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            string xh = comboBox1.Text.Trim();
            string xm = textBox1.Text.Trim();
            string xb = (radioButton1.Checked == true) ? "男" : "女";
            string csrq = " " + comboBox2.Text.Trim() + " " + comboBox3.Text.Trim() + " " + comboBox4.Text.Trim() + " ";
            string zzmm = "共青团员";
            if (radioButton3.Checked == true) zzmm = "群众";
            if (radioButton5.Checked == true) zzmm = "党员";

            string grsm = textBox2.Text.Trim();
            grsm = grsm.Replace((char)13, '|');
            grsm = grsm.Replace((char)10, ']');
            string yw = textBox3.Text.Trim();
            string sx = textBox4.Text.Trim();
            string yy = textBox5.Text.Trim();
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
            MessageBox.Show("修改成功！");
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Hide();
        }

        private void comboBox3_SelectedIndexChanged(object sender, EventArgs e)
        {
            int y = int.Parse(comboBox2.Text); //把字符串数字转换为整数
            int m = int.Parse(comboBox3.Text);
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
            comboBox4.Items.Clear();
            for (int i = 1; i <= d; i++) comboBox4.Items.Add(i.ToString());
        }
    }
}
