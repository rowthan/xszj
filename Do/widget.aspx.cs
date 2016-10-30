using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Do_widget : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bindall();
            bind();
        }
        
       
    }
    public void bindall()
    {
        conn obj = new conn();
        String sql = "SELECT Name,salary.WID,salary.SalaID,salary.Year, salary.Month,salary.Money,salary.SendWay,state.StateName,salary.SendTime,salary.GetTime,salary.Remark,SalaryTypeName FROM salary ,staffinfo ,state ,salarytype WHERE  salary.WID = staffinfo.WID AND salary.StateID=state.StateID AND salary.SalaryTypeID=salarytype.SalaryTypeID order by WID";
        DataSet ds = obj.GetDataSet(sql);
        Repeater1.DataSource = ds;
        Repeater1.DataBind();
    }
    public void bind()
    {
        conn obj = new conn();
        String sql = "SELECT salary.SalaID, salary.Month,salary.Year,salary.Money,salary.SendWay,state.StateName,salary.SendTime,salary.GetTime,salary.Remark,SalaryTypeName FROM salary ,staffinfo ,state,salarytype WHERE staffinfo.SID =" + Session["userid"] + " AND salary.WID = staffinfo.WID AND salary.StateID=state.StateID AND salary.SalaryTypeID=salarytype.SalaryTypeID order by Month";
        DataSet ds = obj.GetDataSet(sql);
        Repeater2.DataSource = ds;
        Repeater2.DataBind();
      
    }
    protected void Repeater2_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "get")
        {

            int salaid = Convert.ToInt32(e.CommandArgument.ToString());
            //staff makesureget=new staff();
            //int result=makesureget.MakeSureGet(salaid);
            //if(result==1){
            //    Response.Write("<script language='javascript'>alert('确认成功');</script>");
            //}
            //else Response.Write("<script language='javascript'>alert('确认失败');</script>");
           
            staff make = new staff();
            int result = make.MakeSureGet(salaid);
            if (result == 1)
            {
                Response.Write("<script language='javascript'>alert('确认成功');location.replace(document.referrer);</script>");
            }
            else
            {
                Response.Write("<script language='javascript'>alert('确认失败');</script>");
            }
            
        }
        if (e.CommandName == "errorMoney")
        {
            int money=Convert.ToInt32(((TextBox)this.Repeater1.Items[0].FindControl("Name")).Text.Trim());
        }
    }
}