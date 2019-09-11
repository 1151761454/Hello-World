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
    public partial class Form8 : Form
    {
        ArrayList stud;
        public Form8()
        {
            InitializeComponent();
        }

        private void Form8_Load(object sender, EventArgs e)
        {
            //下面按分数段统计人数
            FileStream wj = new FileStream("d:\\编程作业\\登录成绩管理系统\\学生数据.txt", FileMode.Open, FileAccess.Read);
            StreamReader sp = new StreamReader(wj);
            int n = 0, m = 0, p = 0;
            int n1 = 0, m1 = 0, p1 = 0;
            int n2 = 0, m2 = 0, p2 = 0;
            stud = new ArrayList();
            string s = "";
            while ((s = sp.ReadLine()) != null)
            {
                stud.Add(s);

            }
            for (int i = 0; i < stud.Count; i++)
            {
                string[] ss = stud[i].ToString().Split('^');
                string yw = ss[6].ToString();
                string sx = ss[7].ToString();
                string yy = ss[8].ToString();
                if (int.Parse(yw) > 0 && int.Parse(yw) < 90)
                {
                    n++;

                } textBox1.Text = n.ToString() + "人"; textBox1.ReadOnly = true;
                 if (int.Parse(yw) >= 90 && int.Parse(yw) < 120)
                {

                    m++;

                } textBox2.Text = m.ToString() + "人"; textBox2.ReadOnly = true;
                if (int.Parse(yw) >= 120 && int.Parse(yw) < 150)
                {

                    p++;
                    
                }
                textBox3.Text = p.ToString() + "人"; textBox3.ReadOnly = true;
                if (int.Parse(sx) > 0 && int.Parse(sx) < 90)
                {
                    n1++;

                } textBox4.Text = n1.ToString() + "人"; textBox4.ReadOnly = true;
                if (int.Parse(sx) >= 90 && int.Parse(sx) < 120)
                {

                    m1++;

                } textBox5.Text = m1.ToString() + "人"; textBox5.ReadOnly = true;
                if (int.Parse(sx) >= 120 && int.Parse(sx) < 150)
                {

                    p1++;

                }
                textBox6.Text = p1.ToString() + "人"; textBox6.ReadOnly = true;
                if (int.Parse(yy) > 0 && int.Parse(yy) < 90)
                {
                    n2++;

                } textBox7.Text = n2.ToString() + "人"; textBox7.ReadOnly = true;
                if (int.Parse(yy) >= 90 && int.Parse(yy) < 120)
                {

                    m2++;

                } textBox8.Text = m2.ToString() + "人"; textBox8.ReadOnly = true;
                if (int.Parse(yy) >= 120 && int.Parse(yy) < 150)
                {

                    p2++;

                }
                textBox9.Text = p2.ToString() + "人"; textBox9.ReadOnly = true;
                
            }
        
        }
    }
}
