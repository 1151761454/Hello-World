using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class 教师后台 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string condi = Request["key"].Trim();
        string[] data;
        data = condi.Split(',');

        if (data[0].ToString() == "'a'")
        {
            DataTable t = new Class1().gettable("select count(*) from 学生表 where 学号=" + data[1]);
            if (int.Parse(t.Rows[0][0].ToString()) != 0) // if(t.Rows[0][0].ToString()!="0")
            {
                Response.Write("该学号已经存在！");
                Response.End();
            }
            else
            {

                Class1 myc = new Class1();
                myc.noquery("insert into 学生表(学号,姓名,专业名,性别,出生日期,入校成绩,备注,密码)values(" +data[1]+ ',' +data[2] +','+ data[3]+',' +data[4]+','+ data[5] +','+data[6]+ ',' +data[7] +',' +data[8] +")");
                Response.Write("学生信息添加成功！");
                Response.End();

            }
        }
        if (data[0].ToString() == "'b'")
        {
  
                Class1 myc = new Class1();
                myc.noquery("update 教材登记表 set 领取人姓名="+data[1]+", 领取数量= "+data[2]+" where 教材名称="+data[3]+"");
                Response.Write("教材领取成功！");
                Response.End();

           
        }
        if (data[0].ToString() == "'c'")
        { 
            Class1 myc1 = new Class1();
            DataTable t2 = myc1.gettable("select 学号 from 学生表");
            string t1 = "请选择";
            for (int i = 0; i < t2.Rows.Count; i++)
            {
                t1 = t1 + "|";
                for (int j = 0; j < t2.Columns.Count; j++)
                {
                    t1 = t1 + t2.Rows[i][j].ToString().Trim();
                }
            }

            Response.Write(t1);
            Response.End();


        }
        if (data[0].ToString() == "'d'")
        {
            Class1 myc1 = new Class1();
            DataTable t2 = myc1.gettable("select 姓名 from 学生表");
            string t1 = "请选择";
            for (int i = 0; i < t2.Rows.Count; i++)
            {
                t1 = t1 + "|";
                for (int j = 0; j < t2.Columns.Count; j++)
                {
                    t1 = t1 + t2.Rows[i][j].ToString().Trim();
                }
            }

            Response.Write(t1);
            Response.End();


        }
        if (data[0].ToString() == "'e'")
        {
            Class1 myc1 = new Class1();
            DataTable t2 = myc1.gettable("select 教材名称 from 教材登记表");
            string t1 = "请选择";
            for (int i = 0; i < t2.Rows.Count; i++)
            {
                t1 = t1 + "|";
                for (int j = 0; j < t2.Columns.Count; j++)
                {
                    t1 = t1 + t2.Rows[i][j].ToString().Trim();
                }
            }

            Response.Write(t1);
            Response.End();


        }
        if (data[0].ToString() == "'f'")
        {
            Class1 myc2 = new Class1();
            string sql = "select 学号,姓名,专业名,性别,YEAR(出生日期),MONTH(出生日期),day(出生日期),入校成绩,备注,密码 from 学生表 where 学号=" + data[1];
            DataTable t3 = myc2.gettable(sql);
            //凑成文本返回
            string res = "学号,姓名,专业名,性别,出生日期,入校成绩,备注,初始密码";
            for (int i = 0; i < t3.Rows.Count; i++)
            {
                res = res + "|";
                for (int j = 0; j < t3.Columns.Count; j++)
                {
                    res = res + t3.Rows[i][j].ToString().Trim() + ",";
                }
            }

            Response.Write(res);
            //Response.Write(condi);
            Response.End();

        }
        if (data[0].ToString() == "'g'")
        {
            Class1 myc2 = new Class1();
            string sql = "select 学号,姓名,专业名,性别,YEAR(出生日期),MONTH(出生日期),day(出生日期),入校成绩,备注,密码 from 学生表 where 姓名=" + data[1];
            DataTable t3 = myc2.gettable(sql);
            //凑成文本返回
            string res = "学号,姓名,专业名,性别,出生日期,入校成绩,备注,初始密码";
            for (int i = 0; i < t3.Rows.Count; i++)
            {
                res = res + "|";
                for (int j = 0; j < t3.Columns.Count; j++)
                {
                    res = res + t3.Rows[i][j].ToString().Trim() + ",";
                }
            }

            Response.Write(res);
            //Response.Write(condi);
            Response.End();

        }
        if (data[0].ToString() == "'h'")
        {
            Class1 myc = new Class1();
            myc.noquery("update 学生表 set 姓名=" + data[2] + ", 专业名= " + data[3] + ", 性别= " + data[4] + ", 出生日期= " + data[5] + ", 入校成绩= " + data[6] + ", 备注= " + data[7] + ", 密码= " + data[8] + " where 学号=" + data[1] + "");
            Response.Write("修改成功！");
            Response.End();
        }
        if (data[0].ToString() == "'i'")
        {
            Class1 myc = new Class1();
            myc.noquery("delete from 学生表 where 学号=" + data[1] + "");
            Response.Write("删除成功！");
            Response.End();
        }
        if (data[0].ToString() == "'j'")
        {
            Class1 myc2 = new Class1();
            string sql = "select 教材编号,教材名称,总库存,领取人姓名,领取数量 from 教材登记表 where 教材名称=" + data[1];
            DataTable t3 = myc2.gettable(sql);
            //凑成文本返回
            string res = "教材编号,教材名称,总库存,领取人姓名,领取数量";
            for (int i = 0; i < t3.Rows.Count; i++)
            {
                res = res + "|";
                for (int j = 0; j < t3.Columns.Count; j++)
                {
                  res = res + t3.Rows[i][j].ToString().Trim() + ",";
                }
            }

             Response.Write(res);

             Response.End();
        }
        if (data[0].ToString() == "'k'")
        {
            Class1 myc2 = new Class1();
            string sql = "select * from 教材目录表 ";
            DataTable t3 = myc2.gettable(sql);
            string res = "教材编号,教材名称,作者,出版社,单价";
            for (int i = 0; i < t3.Rows.Count; i++)
            {
                res = res + "|";
                for (int j = 0; j < t3.Columns.Count; j++)
                {
                    res = res + t3.Rows[i][j].ToString().Trim() + ",";
                }
            }

            Response.Write(res);
            //Response.Write(condi);
            Response.End();
        }
        if (data[0].ToString() == "'l'")
        {
            Class1 myc2 = new Class1();
            string sql = "select * from 教师表 where 教师编号=" + data[1];
            DataTable t3 = myc2.gettable(sql);
            //凑成文本返回
            string res = "教师编号,姓名,性别,所属学院,所上课程,密码";
            for (int i = 0; i < t3.Rows.Count; i++)
            {
                res = res + "|";
                for (int j = 0; j < t3.Columns.Count; j++)
                {
                    res = res + t3.Rows[i][j].ToString().Trim() + ",";
                }
            }

            Response.Write(res);
            //Response.Write(condi);
            Response.End();
        }
        if (data[0].ToString() == "'m'")
        {
            Class1 myc1 = new Class1();
            DataTable t2 = myc1.gettable("select 教材编号 from 教材目录表");
            string t1 = "请选择";
            for (int i = 0; i < t2.Rows.Count; i++)
            {
                t1 = t1 + "|";
                for (int j = 0; j < t2.Columns.Count; j++)
                {
                    t1 = t1 + t2.Rows[i][j].ToString().Trim();
                }
            }

            Response.Write(t1);
            Response.End();


        }
        if (data[0].ToString() == "'n'")
        {
            Class1 myc2 = new Class1();
            string sql = "select * from 学生教材表 where 学号=" + data[1]+"order by 教材编号";
            DataTable t3 = myc2.gettable(sql);
            string res = "学号,教材编号";
            for (int i = 0; i < t3.Rows.Count; i++)
            {
                res = res + "|";
                for (int j = 0; j < t3.Columns.Count; j++)
                {
                    res = res + t3.Rows[i][j].ToString().Trim() + ",";
                }
            }

            Response.Write(res);
            //Response.Write(condi);
            Response.End();
        }
        if (data[0].ToString() == "'o'")
        {
            Class1 myc2 = new Class1();
            string sql = "select * from 学生教材表 where 教材编号=" + data[1] + "order by 学号";
            DataTable t3 = myc2.gettable(sql);
            string res = "学号,教材编号";
            for (int i = 0; i < t3.Rows.Count; i++)
            {
                res = res + "|";
                for (int j = 0; j < t3.Columns.Count; j++)
                {
                    res = res + t3.Rows[i][j].ToString().Trim() + ",";
                }
            }

            Response.Write(res);
            //Response.Write(condi);
            Response.End();
        }
        if (data[0].ToString() == "'p'")
        {
            Class1 myc2 = new Class1();
            string sql = "select 学号,COUNT(*)as 领取数量 from 学生教材表 group by 学号";
            DataTable t3 = myc2.gettable(sql);
            string res = "学号,领取数量";
            for (int i = 0; i < t3.Rows.Count; i++)
            {
                res = res + "|";
                for (int j = 0; j < t3.Columns.Count; j++)
                {
                    res = res + t3.Rows[i][j].ToString().Trim() + ",";
                }
            }

            Response.Write(res);
            //Response.Write(condi);
            Response.End();
        }


    }
}