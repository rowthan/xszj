using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

public partial class aspx_MasterPage2 : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["username"] == null ||Session["username"].ToString()=="")
        {
            Response.Write("<script language='javascript'>alert('不允许匿名登录！');location.href='login.aspx';</script>");

        }
        else
        {

            string constr = System.Configuration.ConfigurationManager.AppSettings["ConnectionString"].ToString();

            //下面使用MySql Connector/net提供的专用对象
            MySqlConnection mycon = new MySqlConnection(constr);
            mycon.Open();

            MySqlCommand cmd = new MySqlCommand("select Name,WID,PowerName,Sign from staffinfo,power where (Name=?username or SID=?username or WID=?username) and power.Power=staffinfo.Power", mycon);//看很多资料在sql server 中是用@usernaem 在mysql中是使用?username 但通过实际运用来说在此技术@也是可以的　但是为了规范　还是用问号吧
            cmd.Parameters.AddWithValue("?username", Session["username"]);
            MySqlDataReader reader = cmd.ExecuteReader();
            //MySqlDataReader reader= cmd ExecuteReader(CommandBehavior.CloseConnection); 这一句的意思是如果reader关闭的话 那么cmd也随之关闭 这样一来就可以方便关闭数据库连接了
            if (reader.Read())
            {
                try
                {
                    Session["username"] = reader.GetString(0);
                   
                    user.Text = Session["username"].ToString();
                    if (Convert.ToInt32(reader.GetString(1)) == 999)
                    {
                        WID.Text = "";
                    }
                    else WID.Text = reader.GetString(1)+"号";
                    Power.Text = reader.GetString(2);//还有一种方式是 reader[2]；第三种方法 reader["Name"] 其中 第一种即正在使用的方法效率最高-
                    sign.Text = reader.GetString(3);
                    reader.Close();
                    cmd = null;
                    mycon.Close();
                    mycon = null;
                }

                catch {
                    Response.Write("<script language='javascript'>alert('读取信息发生错误！');location.href='login.aspx';</script>");
                }
            }

        }

    }


    protected void logout(object sender, EventArgs e)
    {
        try
        {
            Session["usermame"] = null;
            Response.Write("<script language='javascript'>alert('退出成功！');location.href='login.aspx';</script>");
        }
        catch
        {
            Response.Write("<script language='javascript'>alert('退出失败！')</script>");
        }
    }
}
