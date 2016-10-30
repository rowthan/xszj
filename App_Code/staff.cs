using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MySql.Data.MySqlClient;

/// <summary>
/// staff 的摘要说明
/// </summary>
public class staff:conn
{
	public staff()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
       
	}

    public int MakeSureGet(int salaryID)
    {
        string sql = "update salary set StateID=(select StateID from state where StateName='已确收') where SalaID="+salaryID;
        conn makesuer = new staff();
        return makesuer.ExecuteSql(sql);
    }

    public int ErrorMoneyReport(int salaryID,float Money)
    {
        string sql = "update salary set ErrorMoney=?Money where salaID=?salaryID";
        MySqlParameter[] insertpar ={
            new MySqlParameter ("?Money",MySqlDbType.Float),
            new MySqlParameter ("?salaryID",MySqlDbType.Int16)
                                    };
        conn reportErrorMoney = new staff();
        return reportErrorMoney.ExecuteSql(sql,insertpar);
    }



    //public void signin{
     //conn updatename = new conn(); 定义工号 设置set方法 以及签到方法
     //   string email = ((TextBox)this.Repeater1.Items[0].FindControl("email")).Text.Trim();
     //   string tel = ((TextBox)this.Repeater1.Items[0].FindControl("tel")).Text.Trim();
     //   string qq = ((TextBox)this.Repeater1.Items[0].FindControl("qq")).Text.Trim();
     //   string address = ((TextBox)this.Repeater1.Items[0].FindControl("address")).Text.Trim();
     //   string homeaddress = ((TextBox)this.Repeater1.Items[0].FindControl("homeaddress")).Text.Trim();
     //   string upsql = "update  staffinfo set Email=?email,Tel=?tel,QQ=?qq,LastModify=?lastmodify,Address=?address,HomeAddress=?homeaddress WHERE SID =?session";

     //   MySqlParameter[] insertpar ={ 
     //                          new MySqlParameter ("?email",MySqlDbType.VarChar),
     //                          new MySqlParameter ("?tel",MySqlDbType.VarChar),
     //                          new MySqlParameter ("?qq",MySqlDbType.VarChar),
     //                          new MySqlParameter ("?lastmodify",MySqlDbType.VarChar),
     //                          new MySqlParameter ("?address",MySqlDbType.VarChar),
     //                          new MySqlParameter ("?homeaddress",MySqlDbType.VarChar),
     //                          new MySqlParameter ("?session",MySqlDbType.VarChar)
     //                              };
     //   insertpar[0].Value = email;
     //   insertpar[1].Value = tel;
     //   insertpar[2].Value = qq;
     //   insertpar[3].Value = DateTime.Now;
     //   insertpar[4].Value = address;
     //   insertpar[5].Value = homeaddress;
     //   insertpar[6].Value = Session["userid"];
     //   int num = updatename.ExecuteSql(upsql, insertpar);
     //   if (num == 1)
     //   {
     //       Response.Write("<script language='javascript'>alert('更新成功！');location.replace(document.referrer);</script>");

     //   }
     //   else
     //       Response.Write("<script language='javascript'>alert('更新失败！');</script>");
    //}
}