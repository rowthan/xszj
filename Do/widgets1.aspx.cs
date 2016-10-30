using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using MySql.Data.MySqlClient;

public partial class aspx_widgets : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            if (Convert.ToInt32(Session["power"]) == 4)
            {
                bind(); bindall();
            }
            else bind();
                   }
    }

    public void bind()
    {
        conn obj = new conn();
        String sql = "SELECT salary.SalaID, salary.Month,salary.Money,salary.SendWay,state.StateName,salary.SendTime,salary.GetTime,salary.Remark FROM salary ,staffinfo ,state WHERE staffinfo.SID ="+Session["userid"]+" AND salary.WID = staffinfo.WID AND salary.StateID=state.StateID order by Month";
        //MySqlParameter[] mysp ={ new MySqlParameter ("?username",MySqlDbType.VarChar)                               
        //                         };
        //mysp[0].Value = Session["username"]; 
        DataSet ds = obj.GetDataSet(sql);
        GridView1.DataSource = ds;
        //GridView1.DataKeyNames = new string[] { "id" };//主键
        GridView1.DataBind();
        //sqlcon.Close();
    }

    public void bindall()
    {
        conn obj = new conn();
        String sql = "SELECT Name,salary.WID,salary.SalaID, salary.Month,salary.Money,salary.SendWay,state.StateName,salary.SendTime,salary.GetTime,salary.Remark FROM salary ,staffinfo ,state WHERE  salary.WID = staffinfo.WID AND salary.StateID=state.StateID order by WID";
        DataSet ds = obj.GetDataSet(sql);
        GridView2.DataSource = ds;
        GridView2.DataBind();
    }

    //public DataSet GetAllList()
    //{
    //    conn obj = new conn();
    //    String sql = "SELECT Name,salary.WID,salary.SalaID, salary.Month,salary.Money,salary.SendWay,state.StateName,salary.SendTime,salary.GetTime,salary.Remark FROM salary ,staffinfo ,state WHERE  salary.WID = staffinfo.WID AND salary.StateID=state.StateID order by WID";
    //    DataSet ds = obj.GetDataSet(sql);
    //    return ds;//这是使用objectdatasource控件的方法 但是似乎不奏效
    //}

    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
{

//sqlcom=new SqlCommand(sqlstr,sqlcon);
//sqlcon.Open();
//sqlcom.ExecuteNonQuery();
//sqlcon.Close();
//GridView1.EditIndex = -1;
//liefdiy 制作
//bind();
}
    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
{
GridView1.EditIndex = e.NewEditIndex;
bind();
}
}