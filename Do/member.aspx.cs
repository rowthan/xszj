using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Data;

public partial class Do_member : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {//会员不能查看 只有员工以上才能查看
            if (Convert.ToInt32(Session["power"]) > 0)
            {
                bind();
            }
            else Response.Write("<script language='javascript'>alert('权限不足！');location.href='userinfo.aspx';</script>");

        }
    }
        public void bind()
    {
        conn obj = new conn();
        String sql = "SELECT * FROM staffinfo,power,state where staffinfo.Power=power.Power AND staffinfo.StateID=state.StateID and staffinfo.Power=0";
        DataSet ds = obj.GetDataSet(sql);
        Repeater.DataSource = ds;
        Repeater.DataBind();
    }
    
}