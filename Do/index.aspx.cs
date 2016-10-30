using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using MySql.Data.MySqlClient;

public partial class Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {//会员不能查看 只有员工以上才能查看 加入判断员工是否值班的状态判断
            conn checkstate = new conn();
           
            bindonduty();
          
            if (Convert.ToInt32(Session["power"]) > 0)
            {
               
                if (checkwork() == false)
                {
                    
                    gowork.Visible = true;
                    onwork.Visible = false;

                }
                else if (checkwork() == true)
                {
                    bind();
                    gowork.Visible = false;
                    onwork.Visible = true;
                }
            }
            else
            {
                gowork.Visible = false;
                onwork.Visible = false;
            }

            }

    }
    public void bind()
    {
        //this.DropDownList1.DataTextField = "";
        conn time = new conn();
        String sql = "select * from time where TIMEDIFF(CURRENT_TIME(),Time)>0 ORDER BY TimeID DESC LIMIT 0,2";
        DataSet ds = time.GetDataSet(sql);
        DropDownList1.DataSource = ds;
        this.DropDownList1.SelectedIndex = 0;
        this.DropDownList1.DataTextField = "Time"; //dropdownlist的Text的字段
        this.DropDownList1.DataValueField = "TimeID";//dropdownlist的Value的字段
        //DropDownList1.Items.Add(new ListItem("-=请选择=-", "0"));
        this.DropDownList1.DataBind();
    }//签到绑定

    public void bindonduty()
    {
        conn onduty = new conn();
        String sql = "select staffinfo.WID,Name,Tel,Email,QQ,PowerName from onduty,staffinfo,power where WorkState=21 and staffinfo.WID=onduty.WID and power.Power=staffinfo.Power";
        DataSet ds = onduty.GetDataSet(sql);
        Repeater1.DataSource = ds;
        Repeater1.DataBind();
    }//工作人员绑定
    public bool checkwork()
    {
        conn work = new conn();
        String sql = "select * from onduty where WorkState=21 and onduty.WID in (SELECT WID from staffinfo where SID=?userid)";
        MySqlParameter[] insertpar ={ 
                               new MySqlParameter ("?userid",MySqlDbType.VarChar)
                              };
        insertpar[0].Value = Session["userid"]; 
        return  work.ReadSql(sql,insertpar);
    }

    
   
}