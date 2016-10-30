using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using MySql.Data.MySqlClient;

public partial class Do_Apply : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if ( Convert.ToInt32(Session["power"]) < 2)
        {
            Response.Redirect("index.aspx");
        }
        if (!IsPostBack)
        {
            bindapply();
           
        }
        bindadvise();
    }
    public void bindapply()
    {
        conn obj = new conn();
        String sql = "SELECT * FROM apply";
        DataSet ds = obj.GetDataSet(sql);
        Repeater2.DataSource = ds;
        Repeater2.DataBind();
        String sql3 = "select * from applyadvise ORDER BY Score DESC";
        DataSet ds3 = obj.GetDataSet(sql3);
        Repeater3.DataSource = ds3;
        Repeater3.DataBind();
    }

    public void bindadvise()
    {
        conn obj = new conn();
        String sql = "select * from applyadvise ORDER BY Score DESC";
        DataSet ds = obj.GetDataSet(sql);
        Repeater1.DataSource = ds;
        Repeater1.DataBind();
    }

    protected void Button1_Click1(object sender, EventArgs e)
    {
       //name.Text=Button1
    }
    protected void Repeater2_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "apply")
        {
            name.Text = e.CommandArgument.ToString();      
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        //Response.Write("<script language='javascript'>alert('提交时出现了一些意外！');</script>");
        string insert = "insert into applyadvise (ApplyName,Person,Advise,Score,Time)values(?applyname,?person,?advise,?scorce,?time)";
        MySqlParameter[] insertpar ={ 
                               new MySqlParameter ("?applyname",MySqlDbType.VarChar),
                               new MySqlParameter ("?person",MySqlDbType.VarChar),
                               new MySqlParameter ("?advise",MySqlDbType.VarChar),
                               new MySqlParameter ("?scorce",MySqlDbType.VarChar),
                               new MySqlParameter ("?time",MySqlDbType.VarChar) 
                               };
        insertpar[0].Value = name.Text;
        insertpar[1].Value = Session["userid"];
        insertpar[2].Value = advise.Text;
        insertpar[3].Value = score.Text;
        insertpar[4].Value = DateTime.Now;
        conn apply = new conn();
        int no = apply.ExecuteSql(insert,insertpar);
        name.Text = "";
        advise.Text = "";
        score.Text = "";
        if (no == 1)
        {
            Response.Write("<script language='javascript'>alert('提交成功');</script>");
        }
        else if (no == 0)
        {
            Response.Write("<script language='javascript'>alert('提交时出现了一些意外！');</script>");
        }
    }

    
}