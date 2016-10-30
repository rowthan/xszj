using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

public partial class Apply_question_apply : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request["q12"].Length == 11 && !check())
        {
            if (Request["q4"] == "店长" || Request["q4"] == "店员")
            {
                try
                {
                    conn apply = new conn();
                    string sql = "insert into apply (Name,Major,GenderAge,Position,Way,Forwhat,Bring,Salary,Sure,Advise,ElseThing,Tel,time)values(?name,?major,?genderage,?position,?way,?forwhat,?bring,?salary,?sure,?advise,?elsething,?tel,?time)";
                    MySqlParameter[] insertpar ={ 
                               new MySqlParameter ("?name",MySqlDbType.VarChar),
                               new MySqlParameter ("?major",MySqlDbType.VarChar),
                               new MySqlParameter ("?genderage",MySqlDbType.VarChar),
                               new MySqlParameter ("?position",MySqlDbType.VarChar),
                               new MySqlParameter ("?way",MySqlDbType.VarChar),
                               new MySqlParameter ("?forwhat",MySqlDbType.VarChar),
                               new MySqlParameter ("?bring",MySqlDbType.VarChar),
                               new MySqlParameter ("?salary",MySqlDbType.VarChar),
                               new MySqlParameter ("?sure",MySqlDbType.VarChar),
                               new MySqlParameter ("?advise",MySqlDbType.VarChar),
                               new MySqlParameter ("?elsething",MySqlDbType.VarChar),
                               new MySqlParameter ("?tel",MySqlDbType.VarChar),
			       new MySqlParameter ("?time",MySqlDbType.VarChar)
                                        };
                    insertpar[0].Value = Request["q1"];
                    insertpar[1].Value = Request["q2"];
                    insertpar[2].Value = Request["q3"];
                    insertpar[3].Value = Request["q4"];
                    insertpar[4].Value = Request["q5"];
                    insertpar[5].Value = Request["q6"];
                    insertpar[6].Value = Request["q7"];
                    insertpar[7].Value = Request["q8"];
                    insertpar[8].Value = Request["q9"];
                    insertpar[9].Value = Request["q10"];
                    insertpar[10].Value = Request["q11"];
                    insertpar[11].Value = Request["q12"];
                    insertpar[12].Value = DateTime.Now;
                    int num = apply.ExecuteSql(sql, insertpar);
                    if (num == 1)
                    {

                        Response.Write("<script language='javascript'>alert('提交成功！请耐心等候通知面试，感谢你的支持！');location.href='../../Do/login.aspx';</script>");

                    }
                    else Response.Write("<script language='javascript'>alert('提交失败！');</script>");

                }
                catch
                {
                    Response.Write("<script language='javascript'>alert('提交报名失败了，有可能你的输入格式不正确，请重新填写！');location.href='index.html';</script>");
                }
            }
            else Response.Write("<script language='javascript'>alert('输入不合法！请选择应聘选择职位');location.href='index.html';</script>");
        }
        else
        {
            Response.Write("<script language='javascript'>alert('提交失败，输入不合法,电话无效！');location.href='../../Do/login.aspx';</script>");
        }
    }

    public bool check()
    {
       string tel = Request["q12"];
       conn telcheck=new conn();    
       MySqlParameter[] mysp ={ 
                               new MySqlParameter ("?tel",MySqlDbType.VarChar)
                               };
       mysp[0].Value = tel;
      
       string sql="select * from apply where  Tel=?tel";
       bool result=telcheck.ReadSql(sql,mysp);
       return result;
      

    }
    
}