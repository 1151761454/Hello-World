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
    public partial class Form9 : Form
    {
        ArrayList stud;
        public Form9()
        {
            InitializeComponent();
        }

        private void Form9_Load(object sender, EventArgs e)
        {
            FileStream wj = new FileStream("d:\\编程作业\\登录成绩管理系统\\学生数据.txt", FileMode.Open, FileAccess.Read);
            StreamReader sp = new StreamReader(wj);
            stud = new ArrayList();
            string s = "";
            int m = 0,n=0;
            int x=0,y=0,z=0;
            int p=0;
            while ((s = sp.ReadLine()) != null)
            {
                stud.Add(s);

            }
            for (int i = 0; i < stud.Count; i++)
            {
                string[] ss = stud[i].ToString().Split('^');
                if (ss[2] == "男")
                    m++;
                textBox1.Text = m.ToString() + "人"; textBox1.ReadOnly = true;
                if (ss[2] == "女")
                    n++;
                textBox2.Text = n.ToString() + "人"; textBox2.ReadOnly = true;
                if (ss[4] == "群众")
                    x++;
                textBox3.Text = x.ToString() + "人"; textBox3.ReadOnly = true;
                if (ss[4] == "共青团员")
                    y++;
                textBox4.Text = y.ToString() + "人"; textBox4.ReadOnly = true;
                if (ss[4] == "党员")
                    z++;
                textBox5.Text = z.ToString() + "人"; textBox5.ReadOnly = true;
                textBox6.Text = stud.Count.ToString() + "人"; textBox6.ReadOnly = true;
            }
           
        }
    }
}
