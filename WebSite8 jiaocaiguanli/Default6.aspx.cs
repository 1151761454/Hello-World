using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Default6 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string condi = Request["key"].Trim();
        string[] data;
        data = condi.Split(',');
        Class1 myc2 = new Class1();
            string sql = "select * from 教材目录表 order by 单价 desc ";
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
}