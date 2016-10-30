using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Linq;
using MySql.Data.MySqlClient;


public partial class 网站1_index_aspx_assets_login : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void Button1_Click1(object sender, EventArgs e)//登录
    {

        try
        {
            conn check = new conn();
            String result = check.checklogin(username.Text, pwd.Text);       
            if (result!=null)
            {
                Session["userid"] = result;//这里出现了一个问题 比较严重 之前把这句放在了response.redirect 后面导致这一句不能执行
                conn login = new conn();

                Response.Redirect("index.aspx");
            }
            else
            {
                Response.Write("<script language='javascript'>alert('登录失败，请检查用户名和密码！');</script>");
            }

	   }

        catch
        {
            Response.Write("<script language='javascript'>alert('登录发生了一些错误！请重新登录！');</script>");
        }
    }

    protected void Button3_Click1(object sender, EventArgs e)//注册
    {
       conn reg=new conn();    
       MySqlParameter[] mysp ={ new MySqlParameter ("?username",MySqlDbType.VarChar),
                               new MySqlParameter ("?sid",MySqlDbType.VarChar)
                               };
       mysp[0].Value = regname.Text;
       mysp[1].Value = regstuid.Text;
       string sql="select * from staffinfo where  Name=?username or SID=?sid";
       bool result=reg.ReadSql(sql,mysp);

       if(result==false){
           string insert = "insert into staffinfo (SID,Name,Tel,Email,PWD,RegestTime)values(?regsid,?regusername,?tel,?email,?pwd,?regtime)";
           MySqlParameter[] insertpar ={ 
                               new MySqlParameter ("?regsid",MySqlDbType.VarChar),
                               new MySqlParameter ("?regusername",MySqlDbType.VarChar),
                               new MySqlParameter ("?tel",MySqlDbType.VarChar),
                               new MySqlParameter ("?email",MySqlDbType.VarChar),
                               new MySqlParameter ("?pwd",MySqlDbType.VarChar),
                               new MySqlParameter ("?regtime",MySqlDbType.VarChar)
                               };
           insertpar[0].Value = regstuid.Text;
           insertpar[1].Value = regname.Text;
           insertpar[2].Value = regphone.Text;
           insertpar[3].Value = regemail.Text;
           insertpar[4].Value = regpassword.Text;
           insertpar[5].Value = DateTime.Now;
           int no=reg.ExecuteSql(insert,insertpar);
           if(no==1){
                Response.Write("<script language='javascript'>alert('注册成功！现在可以登录了！');</script>"); 
           }
           else if(no==0){
                Response.Write("<script language='javascript'>alert('注册写入时出现了一些意外！');</script>");
           }
        }
       else {
            Response.Write("<script language='javascript'>alert('该用户名或学号已经存在请重新注册！');</script>");
       }
    }

    
 
}