using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class 学生后台 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string condi = Request["key"].Trim();
        string[] data;
        data = condi.Split(',');

        if (data[0].ToString() == "'a'")
        {


            Class1 myc2 = new Class1();
            string sql = "select 教材编号,教材名称,' <input type=\"checkbox\" name=\"cs\" value=\"'+convert(nchar(6),教材编号)+'\"/>' as 是否选择 from 教材目录表 ";
            DataTable t3 = myc2.gettable(sql);
            string res = "教材编号,教材名称,是否选择";
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
        if (data[0].ToString() == "'b'")
        {
            int m = 0;
            if (data.Length - 1 == 2)
            {
                Response.Write("请先选择教材！");
                Response.End();
            }
            else
            {
                for (int i = 2; i < data.Length - 1; i++)
                {
                    DataTable t = new Class1().gettable("select count(*) from 学生教材表 where 教材编号=" + data[i] + "and 学号=" + data[1]);
                    if (int.Parse(t.Rows[0][0].ToString()) != 0) // if(t.Rows[0][0].ToString()!="0")
                    {
                        //s = s + data[i] + ",";
                        Response.Write("你已领取过" + data[i].Substring(1,3) + "教材！");
                        Response.End();
                        m = 1;
                    }
                }
                if (m == 0)
                {

                    for (int j = 2; j < data.Length - 1; j++)
                    {
                        Class1 myc = new Class1();
                        myc.noquery("insert into 学生教材表(学号,教材编号)values(" + data[1] + ',' + data[j] + ")");
                    }
                    Response.Write("领取成功！");
                    Response.End();

                }
            }
       
            //Response.Write(data[3]);
            //Response.End();

        }
        if (data[0].ToString() == "'c'")
        {
            Class1 myc2 = new Class1();
            string sql = "select 学号,姓名,专业名,性别,YEAR(出生日期),MONTH(出生日期),day(出生日期),入校成绩,备注,密码 from 学生表 where 学号=" + data[1];
            DataTable t3 = myc2.gettable(sql);
            //凑成文本返回
            string res = "学号,姓名,专业名,性别,出生日期,入校成绩,备注,密码";
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
        if (data[0].ToString() == "'d'")
        {
            Class1 myc2 = new Class1();
            string sql = "select * from 课程表 where 开课学期=" + data[1];
            DataTable t3 = myc2.gettable(sql);
            string res = "课程号,课程名称,所用教材,开课学期,学分";
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
        if (data[0].ToString() == "'e'")
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
        if (data[0].ToString() == "'f'")
        {
            Class1 myc1 = new Class1();
            DataTable t2 = myc1.gettable("select 教材编号 from 学生教材表 where 学号="+data[1]+"order by 教材编号");
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
        if (data[0].ToString() == "'g'")
        {
            Class1 myc = new Class1();
            myc.noquery("delete from 学生教材表 where 学号=" + data[1] + "and 教材编号="+data[2]);
            Response.Write("退还成功！");
            Response.End();
        }
    }
}