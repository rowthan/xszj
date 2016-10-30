using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using MySql.Data.MySqlClient;

public partial class Do_application : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if ( Convert.ToInt32(Session["Power"]) < 1)
        {
            Response.Write("<script>alert('你不是员工！无权查看');history.go(-1);</script>");
        }
        else if (!IsPostBack) {
            bindwid();
            bingtype();
            bindsalaryapply();
            bindmysalaryapply();
        }
    }

    public void bindwid(){
        admin getwid = new admin(1);
        DataSet ds = getwid.getwid();
        DropDownList1.DataSource = ds;
        DropDownList5.DataSource = ds;
        //DropDownList5.DataSource = ds;
        this.DropDownList1.SelectedIndex = 0;
        this.DropDownList1.DataTextField = "Name"; //dropdownlist的Text的字段
        this.DropDownList1.DataValueField = "WID";//dropdownlist的Value的字段
        //DropDownList1.Items.Add(new ListItem("-=请选择=-", "0"));
        this.DropDownList1.DataBind();

        this.DropDownList5.SelectedIndex = 0;
        this.DropDownList5.DataTextField = "WID";
        this.DropDownList5.DataValueField = "WID";
        this.DropDownList5.DataBind();
        
    }

    public void bingtype()
    {
        admin getwid = new admin(1);
        DataSet ds = getwid.getsalarytype();
        DropDownList2.DataSource = ds;
        this.DropDownList2.SelectedIndex = 0;
        this.DropDownList2.DataTextField = "SalaryTypeName"; //dropdownlist的Text的字段
        this.DropDownList2.DataValueField = "SalaryTypeID";//dropdownlist的Value的字段
        //DropDownList1.Items.Add(new ListItem("-=请选择=-", "0"));
        this.DropDownList2.DataBind();
    }
    
    protected void Button1_Click(object sender, EventArgs e)
    {
        bool result = check();
        if (result)
        {
            int year = Convert.ToInt32(DropDownList3.SelectedValue);
            int month = Convert.ToInt32(DropDownList4.SelectedValue);
            int wid = Convert.ToInt32(DropDownList5.SelectedValue);
            int type = Convert.ToInt32(DropDownList2.SelectedValue);
            double money = Convert.ToDouble(Money.Text);
            string applyperson = Session["userid"].ToString();
            string remarkcontent = remark.Text;
            admin apply = new admin(2);

            int no = apply.applysalary(year, month, wid, type, month, applyperson, remarkcontent);

            if (no == 1)
            {
                Response.Write("<script>alert('申请提交成功！');location.replace(document.referrer);</script>");
            }
            else if (no == 0)
            {
                Response.Write("<script>alert('已经提交请勿重复提交！');location.replace(document.referrer);</script>");
            }
            else if (no == -1)
            {
                Response.Write("<script>alert('提交发生了一些错误！');location.replace(document.referrer);</script>");
            }
        }
        else {
            Response.Write("<script>alert('权限不足！仅允许管理员操作');</script>");
        }
    }

    public bool check() {
        if (Convert.ToInt32(Session["Power"]) < 2)
        {
            return false;
        }
        else
            return true;
    }
    protected void DropDownList5_SelectedIndexChanged(object sender, EventArgs e)
    {
        this.DropDownList1.SelectedIndex = this.DropDownList5.SelectedIndex;
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        this.DropDownList5.SelectedIndex = this.DropDownList1.SelectedIndex;
    }

    public void bindsalaryapply()
    {
        admin salaryapply = new admin(2);
        DataSet ds =salaryapply.getapplysalary();
        Repeater1.DataSource = ds;
        Repeater1.DataBind();
    }

    public void bindmysalaryapply()
    {
        admin salaryapply = new admin(2);
        string SID = Session["userid"].ToString();
        DataSet ds = salaryapply.getmyapplysalary(SID);
        Repeater2.DataSource = ds;
        Repeater2.DataBind();
    }
    //yong for 循环 添加月份 年份到dropdownlist
}