using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Default3 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string condi = Request["key"].Trim();
        string[] data;
        data = condi.Split(',');
        if (data[2] == "'管理员'")
        {
            DataTable t = new Class1().gettable("select count(*) from 管理员表 where 编号=" + data[0] + "");
            DataTable t1 = new Class1().gettable("select count(*) from 管理员表 where 编号=" + data[0] + "and 密码=" + data[1] + "");

            if (int.Parse(t.Rows[0][0].ToString()) == 0) // if(t.Rows[0][0].ToString()!="0")
            {
                Response.Write("用户名不存在！");
                Response.End();
            }
            else
            {
                if (int.Parse(t1.Rows[0][0].ToString()) == 0)
                {
                    Response.Write("密码错误！");
                    Response.End();
                }
                else
                {
                    Response.Write("1");
                    Response.End();
                }
            }

        }
        if (data[2] == "'教师'")
        {
            DataTable t = new Class1().gettable("select count(*) from 教师表 where 教师编号=" + data[0] + "");
            DataTable t1 = new Class1().gettable("select count(*) from 教师表 where 教师编号=" + data[0] + "and 密码=" + data[1] + "");

            if (int.Parse(t.Rows[0][0].ToString()) == 0) // if(t.Rows[0][0].ToString()!="0")
            {
                Response.Write("用户名不存在！");
                Response.End();
            }
            else
            {
                if (int.Parse(t1.Rows[0][0].ToString()) == 0)
                {
                    Response.Write("密码错误！");
                    Response.End();
                }
                else
                {
                    Response.Write("2");
                    Response.End();
                }
            }

        }
        if (data[2] == "'学生'")
        {
            DataTable t = new Class1().gettable("select count(*) from 学生表 where 学号=" + data[0] + "");
            DataTable t1 = new Class1().gettable("select count(*) from 学生表 where 学号=" + data[0] + "and 密码=" + data[1] + "");

            if (int.Parse(t.Rows[0][0].ToString()) == 0) // if(t.Rows[0][0].ToString()!="0")
            {
                Response.Write("用户名不存在！");
                Response.End();
            }
            else
            {
                if (int.Parse(t1.Rows[0][0].ToString()) == 0)
                {
                    Response.Write("密码错误！");
                    Response.End();
                }
                else
                {
                    Response.Write("3");
                    Response.End();
                }
            }

        }

    }
}