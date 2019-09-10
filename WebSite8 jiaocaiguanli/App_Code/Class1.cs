using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

/// <summary>
/// Class1 的摘要说明
/// </summary>
public class Class1
{
	public Class1()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
	}
    public string constr = "server=ERYISCSCT4T0HP2;database=教材管理系统;User ID=sa;pwd=sasasa;Trusted_Connection=no";
    //此处定义连接串，以后所有程序可以共用，如果参数发生变化，只需修改这里即可
    public DataTable gettable(string sql)
    {
        SqlConnection cn = new SqlConnection(constr);
        cn.Open();
        DataSet ds = new DataSet();

        SqlDataAdapter myad = new SqlDataAdapter(sql, cn);
        myad.Fill(ds, "T1");
        cn.Close();
        return ds.Tables["T1"];

    }
    public void filltable(DataTable t, Table t0)
    { //先处理表头
        TableRow tr0 = new TableRow();
        for (int j = 0; j < t.Columns.Count; j++)
        {
            TableCell td0 = new TableCell(); td0.Text = t.Columns[j].Caption.ToString(); tr0.Cells.Add(td0);
        }
        t0.Rows.Add(tr0);
        for (int k = 0; k < t.Rows.Count; k++)
        {
            TableRow tr = new TableRow();
            for (int c = 0; c < t.Columns.Count; c++)
            {
                TableCell td = new TableCell();
                td.Text = t.Rows[k][c].ToString();
                tr.Cells.Add(td); //把生成的单元格td加到行tr的单元格集合中
            }
            t0.Rows.Add(tr);
        }


    }
    public void filldrop(DataTable t, string colname, DropDownList L1)
    {
        L1.DataSource = t;
        L1.DataTextField = colname;
        L1.DataBind();

    }
    public void noquery(string sql)
    {
        SqlConnection cn = new SqlConnection(constr);
        cn.Open();
        SqlCommand mycmd = new SqlCommand(sql, cn);
        mycmd.ExecuteNonQuery();
        mycmd.Clone();
        cn.Close();
    }

}