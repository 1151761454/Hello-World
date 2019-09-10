using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class 管理员后台 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string condi = Request["key"].Trim();
        string[] data;
        data = condi.Split(',');

        if (data[0].ToString() == "'a'")
        {
            Class1 myc2 = new Class1();
            string sql = "select * from 管理员表 where 编号=" + data[1];
            DataTable t3 = myc2.gettable(sql);
            //凑成文本返回
            string res = "编号,姓名,性别,出生日期,家庭住址,密码";
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
        if (data[0].ToString() == "'b'")
        {
            Class1 myc2 = new Class1();
            string sql = "select 编号,姓名,性别,YEAR(出生日期),MONTH(出生日期),day(出生日期),家庭住址,密码 from 管理员表 where 编号=" + data[1];
            DataTable t3 = myc2.gettable(sql);
            //凑成文本返回
            string res = "编号,姓名,性别,出生日期,家庭住址,密码";
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
        if (data[0].ToString() == "'c'")
        {
            Class1 myc = new Class1();
            myc.noquery("update 管理员表 set 姓名=" + data[2] + ", 性别= " + data[3] + ", 出生日期= " + data[4] + ", 家庭住址= " + data[5] + ", 密码= " + data[6] + " where 编号=" + data[1] + "");
            Response.Write("修改成功！");
            Response.End();
        }
        if (data[0].ToString() == "'d'")
        {
            DataTable t = new Class1().gettable("select count(*) from 课程表 where 课程号=" + data[1]);
            if (int.Parse(t.Rows[0][0].ToString()) != 0) // if(t.Rows[0][0].ToString()!="0")
            {
                Response.Write("该课程已经存在！");
                Response.End();
            }
            else
            {

                Class1 myc = new Class1();
                myc.noquery("insert into 课程表(课程号,课程名称,所用教材,开课学期,学分)values(" + data[1] + ',' + data[2] + ',' + data[3] + ',' + data[4] + ',' + data[5] +  ")");
                Response.Write("课程信息添加成功！");
                Response.End();

            }
            

        }
        if (data[0].ToString() == "'e'")
        {
            Class1 myc1 = new Class1();
            DataTable t2 = myc1.gettable("select 课程号 from 课程表");
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
        if (data[0].ToString() == "'g'")
        {
            Class1 myc2 = new Class1();
            string sql = "select 课程号,课程名称,所用教材,开课学期,学分 from 课程表 where 课程号=" + data[1];
            DataTable t3 = myc2.gettable(sql);
            //凑成文本返回
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
        if (data[0].ToString() == "'h'")
        {
            Class1 myc = new Class1();
            myc.noquery("update 课程表 set 课程名称=" + data[2] + ", 所用教材= " + data[3] + ", 开课学期= " + data[4] + ", 学分= " + data[5] +" where 课程号=" + data[1] + "");
            Response.Write("修改成功！");
            Response.End();
        }
        if (data[0].ToString() == "'i'")
        {
            Class1 myc = new Class1();
            myc.noquery("delete from 课程表 where 课程号=" + data[1] + "");
            Response.Write("删除成功！");
            Response.End();
        }
        if (data[0].ToString() == "'j'")
        {
            DataTable t = new Class1().gettable("select count(*) from 教师表 where 教师编号=" + data[1]);
            if (int.Parse(t.Rows[0][0].ToString()) != 0) // if(t.Rows[0][0].ToString()!="0")
            {
                Response.Write("该教师已经存在！");
                Response.End();
            }
            else
            {

                Class1 myc = new Class1();
                myc.noquery("insert into 教师表(教师编号,姓名,性别,所属学院,所上课程,密码)values(" + data[1] + ',' + data[2] + ',' + data[3] + ',' + data[4] + ',' + data[5] +','+ data[6]+ ")");
                Response.Write("教师信息添加成功！");
                Response.End();

            }


        }
        if (data[0].ToString() == "'k'")
        {
            Class1 myc1 = new Class1();
            DataTable t2 = myc1.gettable("select 姓名 from 教师表");
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
        if (data[0].ToString() == "'l'")
        {
            Class1 myc2 = new Class1();
            string sql = "select 教师编号,姓名,性别,所属学院,所上课程,密码 from 教师表 where 姓名=" + data[1];
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
            DataTable t2 = myc1.gettable("select 教师编号 from 教师表");
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
            string sql = "select 教师编号,姓名,性别,所属学院,所上课程,密码 from 教师表 where 教师编号=" + data[1];
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
        if (data[0].ToString() == "'o'")
        {
            Class1 myc = new Class1();
            myc.noquery("update 教师表 set 姓名=" + data[2] + ",性别="+data[3]+", 所属学院= " + data[4] + ", 所上课程= " + data[5] + ", 密码= " + data[6] + " where 教师编号=" + data[1] + "");
            Response.Write("修改成功！");
            Response.End();
        }
        if (data[0].ToString() == "'p'")
        {
            Class1 myc = new Class1();
            myc.noquery("delete from 教师表 where 教师编号=" + data[1] + "");
            Response.Write("删除成功！");
            Response.End();
        }
        if (data[0].ToString() == "'q'")
        {
            Class1 myc2 = new Class1();
            string sql = "select * from 教材登记表 ";
            DataTable t3 = myc2.gettable(sql);
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
            //Response.Write(condi);
            Response.End();
        }
        if (data[0].ToString() == "'r'")
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
        if (data[0].ToString() == "'s'")
        {
            DataTable t = new Class1().gettable("select count(*) from 教材登记表 where 教材编号=" + data[1]);
            if (int.Parse(t.Rows[0][0].ToString()) != 0) // if(t.Rows[0][0].ToString()!="0")
            {
                Response.Write("该教材已经存在！");
                Response.End();
            }
            else
            {

                Class1 myc = new Class1();
                myc.noquery("insert into 教材登记表(教材编号,教材名称,总库存)values(" + data[1] + ',' + data[2] + ',' + data[3] + ")");
                Response.Write("教材入库成功！");
                Response.End();

            }
        }
        if (data[0].ToString() == "'t'")
        {
            Class1 myc2 = new Class1();
            string sql = "select 教材名称 from 教材目录表 where 教材编号=" + data[1];
            DataTable t3 = myc2.gettable(sql);
            //凑成文本返回
            string res = "教材名称";
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