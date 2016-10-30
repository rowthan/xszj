using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using MySql.Data.MySqlClient;

public partial class aspx_userinfo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bind();
              
        }
    }

    protected void bind()
    {
        conn userinfo = new conn();
        String sql = "SELECT * from staffinfo,power,state WHERE state.StateID=staffinfo.StateID and staffinfo.Power=power.Power and staffinfo.SID =" + Session["userid"];//顺序比较重要 如果把参数放到中间 这句话将不能够执行
        //MySqlParameter[] mysp ={ new MySqlParameter ("?username",MySqlDbType.VarChar)                   
        //mysp[0].Value = Session["username"];    
        DataSet ds = userinfo.GetDataSet(sql);
        Repeater1.DataSource = ds;
        //int num = ds.Tables["staffinfo"].Rows.Count; 可以试着判断是否只有一条满足要求的记录    
        //GridView1.DataKeyNames = new string[] { "id" };//主键
        Repeater1.DataBind();
    }
    protected void @do(object source, RepeaterCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Updatename":
                Updatename(e);
            break;
            case "Updatepersonal":
                Updatepersonal(e);
            break;
            case "Updatecontact":
            Updatecontact(e);
            break;
            case "Updatework":
            Updatework(e);
            break;
            case "Updatepwd":
            Updatepwd(e);
            break;
                
        }
    }

    protected void Updatename(RepeaterCommandEventArgs e)
    {
        conn updatename = new conn();
        string Nickname = ((TextBox)this.Repeater1.Items[0].FindControl("Nickname")).Text.Trim();
        string Name = ((TextBox)this.Repeater1.Items[0].FindControl("Name")).Text.Trim();
        string Sign = ((TextBox)this.Repeater1.Items[0].FindControl("Sign")).Text.Trim();
        string upsql = "update  staffinfo set Name=?name,Nickname=?nickname,Sign=?sign,LastModify=?lastmodify,Gender=?gender WHERE SID =?session";
        string gender = ((DropDownList)this.Repeater1.Items[0].FindControl("Gender")).SelectedValue.Trim();
        MySqlParameter[] insertpar ={ 
                               new MySqlParameter ("?name",MySqlDbType.VarChar),
                               new MySqlParameter ("?nickname",MySqlDbType.VarChar),
                               new MySqlParameter ("?sign",MySqlDbType.VarChar),
                               new MySqlParameter ("?lastmodify",MySqlDbType.VarChar),
                               new MySqlParameter ("?session",MySqlDbType.VarChar),
                               new MySqlParameter ("?gender",MySqlDbType.VarChar)
                                        };
        insertpar[0].Value = Name;
        insertpar[1].Value = Nickname;
        insertpar[2].Value = Sign;
        insertpar[3].Value = DateTime.Now;
        insertpar[4].Value = Session["userid"];
        insertpar[5].Value = gender;
        int num = updatename.ExecuteSql(upsql,insertpar);
        if (num == 1)
        {
            //bind();
            //Response.Write("<script language='javascript'>alert('更新成功！');</script>");
             ScriptManager.RegisterClientScriptBlock(UpdatePanel1, this.GetType(), "", "alert('更新成功')", true);
            //this.Page.ClientScript.RegisterStartupScript(this.GetType(), "age1", "alert('更新成功')", true);
        }
        else Response.Write("<script language='javascript'>alert('更新失败！');</script>");

    }

    protected void Updatepersonal(RepeaterCommandEventArgs e)
    {
        conn updatename = new conn();
        string gender = ((DropDownList)this.Repeater1.Items[0].FindControl("gender")).SelectedValue.Trim();
        string lovestate = ((DropDownList)this.Repeater1.Items[0].FindControl("lovestate")).SelectedValue.Trim();
        string birth = ((TextBox)this.Repeater1.Items[0].FindControl("birth")).Text.Trim();
        string age = ((TextBox)this.Repeater1.Items[0].FindControl("age")).Text.Trim();
        string upsql = "update  staffinfo set Gender=?gender,LoveState=?lovestate,LastModify=?lastmodify,Birth=?birth,Age=?age WHERE SID =?session";
       
        MySqlParameter[] insertpar ={ 
                               new MySqlParameter ("?gender",MySqlDbType.VarChar),
                               new MySqlParameter ("?lovestate",MySqlDbType.VarChar),
                               new MySqlParameter ("?lastmodify",MySqlDbType.VarChar),
                               new MySqlParameter ("?birth",MySqlDbType.VarChar),
                               new MySqlParameter ("?age",MySqlDbType.VarChar),
                                new MySqlParameter ("?session",MySqlDbType.VarChar)
                                   };
        insertpar[0].Value = gender;
        insertpar[1].Value = lovestate;
        insertpar[2].Value = DateTime.Now;
        insertpar[3].Value = birth;
        insertpar[4].Value = age;
        insertpar[5].Value = Session["userid"];
        int num = updatename.ExecuteSql(upsql, insertpar);
        if (num == 1)
        {
            Response.Write("<script language='javascript'>alert('更新成功！');</script>");

        }
        else 
        Response.Write("<script language='javascript'>alert('更新失败！');</script>");
    }

    protected void Updatecontact(RepeaterCommandEventArgs e)
    {
        conn updatename = new conn();
        string email = ((TextBox)this.Repeater1.Items[0].FindControl("email")).Text.Trim();
        string tel = ((TextBox)this.Repeater1.Items[0].FindControl("tel")).Text.Trim();
        string qq = ((TextBox)this.Repeater1.Items[0].FindControl("qq")).Text.Trim();
        string address = ((TextBox)this.Repeater1.Items[0].FindControl("address")).Text.Trim();
        string homeaddress = ((TextBox)this.Repeater1.Items[0].FindControl("homeaddress")).Text.Trim();
        string upsql = "update  staffinfo set Email=?email,Tel=?tel,QQ=?qq,LastModify=?lastmodify,Address=?address,HomeAddress=?homeaddress WHERE SID =?session";
       
        MySqlParameter[] insertpar ={ 
                               new MySqlParameter ("?email",MySqlDbType.VarChar),
                               new MySqlParameter ("?tel",MySqlDbType.VarChar),
                               new MySqlParameter ("?qq",MySqlDbType.VarChar),
                               new MySqlParameter ("?lastmodify",MySqlDbType.VarChar),
                               new MySqlParameter ("?address",MySqlDbType.VarChar),
                               new MySqlParameter ("?homeaddress",MySqlDbType.VarChar),
                               new MySqlParameter ("?session",MySqlDbType.VarChar)
                                   };
        insertpar[0].Value = email;
        insertpar[1].Value = tel;  
        insertpar[2].Value = qq;
        insertpar[3].Value = DateTime.Now;
        insertpar[4].Value = address;
        insertpar[5].Value = homeaddress;
        insertpar[6].Value = Session["userid"];
        int num = updatename.ExecuteSql(upsql, insertpar);
        if (num == 1)
        {
            Response.Write("<script language='javascript'>alert('更新成功！');location.replace(document.referrer);</script>");

        }
        else 
        Response.Write("<script language='javascript'>alert('更新失败！');</script>");
    }


    protected void Updatework(RepeaterCommandEventArgs e)
    {
        conn updatename = new conn();
        string sid = ((TextBox)this.Repeater1.Items[0].FindControl("sid")).Text.Trim();
        string zfb = ((TextBox)this.Repeater1.Items[0].FindControl("zfb")).Text.Trim();
        string bank = ((TextBox)this.Repeater1.Items[0].FindControl("bank")).Text.Trim();
        string card = ((TextBox)this.Repeater1.Items[0].FindControl("card")).Text.Trim();
        string upsql = "update  staffinfo set SID=?sid,ZFB=?zfb,Bank=?bank,Card=?card,LastModify=?lastmodify WHERE SID =?session";
       
        MySqlParameter[] insertpar ={ 
                               new MySqlParameter ("?sid",MySqlDbType.VarChar),
                               new MySqlParameter ("?zfb",MySqlDbType.VarChar),
                               new MySqlParameter ("?bank",MySqlDbType.VarChar),
                                new MySqlParameter ("?card",MySqlDbType.VarChar),
                               new MySqlParameter ("?lastmodify",MySqlDbType.VarChar),
                                new MySqlParameter ("?session",MySqlDbType.VarChar)
                                   };
        insertpar[0].Value = sid;
        insertpar[1].Value = zfb;  
        insertpar[2].Value = bank;
        insertpar[3].Value = card;
        insertpar[4].Value = DateTime.Now;
        insertpar[5].Value = Session["userid"];
        int num = updatename.ExecuteSql(upsql, insertpar);
        if (num == 1)
        {
            Response.Write("<script language='javascript'>alert('更新成功！');location.replace(document.referrer);</script>");

        }
        else 
        Response.Write("<script language='javascript'>alert('更新失败！');</script>");
    }

    protected void Updatepwd(RepeaterCommandEventArgs e)
    {
        conn updatepwd = new conn();
        string oldpwd = ((TextBox)this.Repeater1.Items[0].FindControl("oldpwd")).Text.Trim();
        string newpwd = ((TextBox)this.Repeater1.Items[0].FindControl("newpwd")).Text.Trim();
        string name = Session["userid"].ToString();
        string result = updatepwd.checklogin(name,oldpwd);
        if (result == null)
        {
            Response.Write("<script language='javascript'>alert('原密码不正确！');</script>");
        }
        else
        {
            string upsql = "update  staffinfo set PWD=?newpwd,LastModify=?lastmodify WHERE SID =?session";
            MySqlParameter[] insertpar ={ 
                               new MySqlParameter ("?newpwd",MySqlDbType.VarChar),
                               new MySqlParameter ("?lastmodify",MySqlDbType.VarChar),
                               new MySqlParameter ("?session",MySqlDbType.VarChar)
                                   };
            insertpar[0].Value = newpwd;
            insertpar[1].Value = DateTime.Now;
            insertpar[2].Value = Session["userid"];
            int num = updatepwd.ExecuteSql(upsql, insertpar);
            if (num == 1)
            {
                Response.Write("<script language='javascript'>alert('更新成功！');location.replace(document.referrer);</script>");

            }
            else
                Response.Write("<script language='javascript'>alert('更新失败！');</script>");
        }
    }
   
}