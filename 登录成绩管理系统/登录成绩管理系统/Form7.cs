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
    public partial class Form7 : Form
    {
        ArrayList stud;
        public Form7()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            dataGridView1.Columns.Clear();
            string xb = "男";
            if (radioButton2.Checked == true) xb = "女";
            if (radioButton6.Checked == true) xb = "无要求";
            string xh = comboBox1.Text;
            string xm = comboBox2.Text;
            string zzmm ="共青团员";
            if (radioButton3.Checked == true) zzmm = "群众";
            if (radioButton5.Checked == true) zzmm = "党员";
            if (radioButton7.Checked == true) zzmm = "无要求";
            string[] hname = new string[9];
            hname[0] = "学号"; hname[1] = "姓名"; hname[2] = "性别"; hname[3] = "出生日期";
            hname[4] = "政治面貌"; hname[5] = "个人说明"; hname[6] = "语文成绩"; hname[7] = "数学成绩"; hname[8] = "英语成绩";
            for (int i = 0; i < 9; i++)
            {
                DataGridViewColumn col0 = new DataGridViewColumn();
                col0.HeaderText = hname[i].ToString();
                col0.Name = "col0";
                col0.Width = 80;
                if (i == 5) col0.Width = 150;
                DataGridViewCell cell0 = new DataGridViewTextBoxCell();
                col0.CellTemplate = cell0;
                dataGridView1.Columns.Add(col0);

            }
            dataGridView1.Columns[5].CellTemplate.Style.WrapMode = DataGridViewTriState.True;
            string filename = "d:\\编程作业\\登录成绩管理系统\\学生数据.txt";
            FileStream fs;
            if (!File.Exists(filename))
            {
                fs = new FileStream(filename, FileMode.Create, FileAccess.ReadWrite);
                MessageBox.Show("文件不存在，没内容");
                return;
            }
            fs = new FileStream(filename, FileMode.Open, FileAccess.Read);
            //如果文件已经存在，则打开它open，读取数据的方式
            StreamReader sr = new StreamReader(fs);
            string data = "";
            string[] data2;
            int n = 0;
            dataGridView1.Rows.Clear();//清空原来的数据
            while ((data = sr.ReadLine()) != null)//读啊读，读到空行为止
            {
                data2 = data.Split('^');//读一个人就拆开数据项
                data2[5] = data2[5].Replace('|', (char)13);
                data2[5] = data2[5].Replace(']', (char)10);
                //if (data2[2].ToString().Trim() == xb || data2[0].ToString().Trim() == xh
                //    || data2[1].ToString().Trim() == xm || data2[4].ToString().Trim() == zzmm)  //此人就是要找的属性的人
                //{


                //    n = dataGridView1.Rows.Add();
                //    dataGridView1.Rows[n].Height = 50;
                //    for (int j = 0; j < data2.Count(); j++)
                //    {
                //        dataGridView1.Rows[n].Cells[j].Value = data2[j].ToString();
                //    }
                //}
                if (data2[0].ToString().Trim() == xh && comboBox2.Text == "" || comboBox1.Text == "" && comboBox2.Text == "")
                {
                    if (radioButton6.Checked == true)
                    {
                        if (data2[4].ToString().Trim() == zzmm)
                        {
                            n = dataGridView1.Rows.Add();
                            dataGridView1.Rows[n].Height = 50;
                            for (int j = 0; j < data2.Count(); j++)
                            {
                                dataGridView1.Rows[n].Cells[j].Value = data2[j].ToString();
                            }
                        }
                    }
                }
                if (data2[0].ToString().Trim() == xh && comboBox2.Text == "" || comboBox1.Text == "" && comboBox2.Text == "")
                {
                    if (radioButton7.Checked == true)
                    {
                        if (data2[2].ToString().Trim() == xb)
                        {
                            n = dataGridView1.Rows.Add();
                            dataGridView1.Rows[n].Height = 50;
                            for (int j = 0; j < data2.Count(); j++)
                            {
                                dataGridView1.Rows[n].Cells[j].Value = data2[j].ToString();
                            }
                        }
                    }
                }
                if (data2[0].ToString().Trim() == xh && comboBox2.Text == "" || comboBox1.Text == "" && comboBox2.Text == "")
                {
                    if (radioButton6.Checked == true)
                    {
                        if (radioButton7.Checked == true)
                        {
                            n = dataGridView1.Rows.Add();
                            dataGridView1.Rows[n].Height = 50;
                            for (int j = 0; j < data2.Count(); j++)
                            {
                                dataGridView1.Rows[n].Cells[j].Value = data2[j].ToString();
                            }
                        }
                    }
                }
                if (data2[0].ToString().Trim() == xh && comboBox2.Text == "" || comboBox1.Text == "" && comboBox2.Text == "")
                {
                    if (data2[2].ToString().Trim() == xb)
                    {
                        if (data2[4].ToString().Trim() == zzmm)
                        {
                            n = dataGridView1.Rows.Add();
                            dataGridView1.Rows[n].Height = 50;
                            for (int j = 0; j < data2.Count(); j++)
                            {
                                dataGridView1.Rows[n].Cells[j].Value = data2[j].ToString();
                            }
                        }
                    }
                }
                ////////////////////////////////
                if (data2[1].ToString().Trim() == xm && comboBox1.Text == "" )
                {
                    if (radioButton6.Checked == true)
                    {
                        if (data2[4].ToString().Trim() == zzmm)
                        {
                            n = dataGridView1.Rows.Add();
                            dataGridView1.Rows[n].Height = 50;
                            for (int j = 0; j < data2.Count(); j++)
                            {
                                dataGridView1.Rows[n].Cells[j].Value = data2[j].ToString();
                            }
                        }
                    }
                }
                if (data2[1].ToString().Trim() == xm && comboBox1.Text == "" )
                {
                    if (radioButton7.Checked == true)
                    {
                        if (data2[2].ToString().Trim() == xb)
                        {
                            n = dataGridView1.Rows.Add();
                            dataGridView1.Rows[n].Height = 50;
                            for (int j = 0; j < data2.Count(); j++)
                            {
                                dataGridView1.Rows[n].Cells[j].Value = data2[j].ToString();
                            }
                        }
                    }
                }
                if (data2[1].ToString().Trim() == xm && comboBox1.Text == "" )
                {
                    if (radioButton6.Checked == true)
                    {
                        if (radioButton7.Checked == true)
                        {
                            n = dataGridView1.Rows.Add();
                            dataGridView1.Rows[n].Height = 50;
                            for (int j = 0; j < data2.Count(); j++)
                            {
                                dataGridView1.Rows[n].Cells[j].Value = data2[j].ToString();
                            }
                        }
                    }
                }
                if (data2[1].ToString().Trim() == xm && comboBox1.Text == "" )
                {
                    if (data2[2].ToString().Trim() == xb)
                    {
                        if (data2[4].ToString().Trim() == zzmm)
                        {
                            n = dataGridView1.Rows.Add();
                            dataGridView1.Rows[n].Height = 50;
                            for (int j = 0; j < data2.Count(); j++)
                            {
                                dataGridView1.Rows[n].Cells[j].Value = data2[j].ToString();
                            }
                        }
                    }
                }
                ////////////////
                if (data2[1].ToString().Trim() == xm && data2[0].ToString().Trim() == xh)
                {
                    if (radioButton6.Checked == true)
                    {
                        if (data2[4].ToString().Trim() == zzmm)
                        {
                            n = dataGridView1.Rows.Add();
                            dataGridView1.Rows[n].Height = 50;
                            for (int j = 0; j < data2.Count(); j++)
                            {
                                dataGridView1.Rows[n].Cells[j].Value = data2[j].ToString();
                            }
                        }
                    }
                }
                if (data2[1].ToString().Trim() == xm && data2[0].ToString().Trim() == xh)
                {
                    if (radioButton7.Checked == true)
                    {
                        if (data2[2].ToString().Trim() == xb)
                        {
                            n = dataGridView1.Rows.Add();
                            dataGridView1.Rows[n].Height = 50;
                            for (int j = 0; j < data2.Count(); j++)
                            {
                                dataGridView1.Rows[n].Cells[j].Value = data2[j].ToString();
                            }
                        }
                    }
                }
                if (data2[1].ToString().Trim() == xm && data2[0].ToString().Trim() == xh)
                {
                    if (radioButton6.Checked == true)
                    {
                        if (radioButton7.Checked == true)
                        {
                            n = dataGridView1.Rows.Add();
                            dataGridView1.Rows[n].Height = 50;
                            for (int j = 0; j < data2.Count(); j++)
                            {
                                dataGridView1.Rows[n].Cells[j].Value = data2[j].ToString();
                            }
                        }
                    }
                }
                if (data2[1].ToString().Trim() == xm && data2[0].ToString().Trim() == xh)
                {
                    if (data2[2].ToString().Trim() == xb)
                    {
                        if (data2[4].ToString().Trim() == zzmm)
                        {
                            n = dataGridView1.Rows.Add();
                            dataGridView1.Rows[n].Height = 50;
                            for (int j = 0; j < data2.Count(); j++)
                            {
                                dataGridView1.Rows[n].Cells[j].Value = data2[j].ToString();
                            }
                        }
                    }
                }
            }

            sr.Close();
            fs.Close();
        }

        private void Form7_Load(object sender, EventArgs e)
        {
            FileStream fs = new FileStream("d:\\编程作业\\登录成绩管理系统\\学生数据.txt", FileMode.Open, FileAccess.Read);
            StreamReader sr = new StreamReader(fs);
            string s = "";
            
            stud = new ArrayList();
            while ((s = sr.ReadLine()) != null)
            {
                stud.Add(s);//
            }
           
            for (int i = 0; i < stud.Count; i++)
            {
                string[] ss = stud[i].ToString().Split('^');
                comboBox1.Items.Add(ss[0].ToString().Trim());
                comboBox2.Items.Add(ss[1].ToString().Trim());
            }


            fs.Close();
            sr.Close();
        }

        private void radioButton1_Click(object sender, EventArgs e)
        {
           
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }
    }
}
