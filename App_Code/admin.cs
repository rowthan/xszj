using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using MySql.Data.MySqlClient;
using System.Data;
/// <summary>
/// admin 的摘要说明
/// </summary>
public class admin
{
    private int power;
    private MySqlConnection con = null;
    private string constr;
	public admin(int power)
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
        this.power = power;
        constr = System.Configuration.ConfigurationManager.AppSettings["ConnectionString"].ToString();//连接用户名密码再web.comfig文件中。不可见
	}

    public void open()
    {
        if (con == null)
            con = new MySqlConnection(constr);
        if (con.State.Equals(ConnectionState.Closed))
            con.Open();
    }

    public void close()
    {
        if (con == null)
            return;
        if (con.State.Equals(ConnectionState.Open))
        {
            con.Close();
            con.Dispose();
            con = null;
        }
        else
        {
            con.Dispose();
            con = null;
        }
    }

    public DataSet getwid()
    {
        string sql = "select Name,WID from staffinfo where StateID in (select StateID from state where StateName='现员工') ORDER BY WID";
        this.open();
        using ( MySqlDataAdapter da = new MySqlDataAdapter(sql, con))   
        {
            DataSet ds = new DataSet();
            da.Fill(ds);
            this.close();
            return ds;
        } 
    }

    public DataSet getsalarytype()
    {
        string sql = "select * from salarytype order by SalaryTypeID";
        this.open();
        using (MySqlDataAdapter da = new MySqlDataAdapter(sql, con))
        {
            DataSet ds = new DataSet();
            da.Fill(ds);
            this.close();
            return ds;
        }
    }


    public bool checkbeforapply(int year, int month, int wid, int type)
    {
        string check = "select * from salaryapply where Year=" + year + " and Month=" + month + " and ApplyType=" + type + " and WID=" + wid;
        this.open();
        MySqlCommand cmd = new MySqlCommand(check, con);
        MySqlDataReader reader = cmd.ExecuteReader();
        if (reader.Read())
        {
            this.close();
            return true;
        }
        else
            this.close();
            return false;
       
    }
    public int applysalary(int year, int month, int wid ,int type,double money, string applyperson, string remark) {

        bool result = checkbeforapply(year,month,wid,type);
        if (result == false)
        {
            string insert = "insert into salaryapply (Year,Month,WID,ApplyType,Money,ApplyPerson,Remark,ApplyTime)values(?Year,?Month,?WID,?Type,?Money,?ApplyPerson,?Remark,?ApplyTime)";
            MySqlParameter[] insertpar ={ 
                               new MySqlParameter ("?Year",MySqlDbType.VarChar),
                               new MySqlParameter ("?Month",MySqlDbType.VarChar),
                               new MySqlParameter ("?WID",MySqlDbType.VarChar),
                               new MySqlParameter ("?Type",MySqlDbType.VarChar),
                               new MySqlParameter ("?Money",MySqlDbType.VarChar),
                               new MySqlParameter ("?ApplyPerson",MySqlDbType.VarChar),
                                new MySqlParameter ("?Remark",MySqlDbType.VarChar),
                               new MySqlParameter ("?ApplyTime",MySqlDbType.VarChar)
                               };
            insertpar[0].Value = year;
            insertpar[1].Value = month;
            insertpar[2].Value = wid;
            insertpar[3].Value = type;
            insertpar[4].Value = month;
            insertpar[5].Value = applyperson;
            insertpar[6].Value = remark;
            insertpar[7].Value = DateTime.Now;

            //try
            //{
                this.open();
                using (MySqlCommand cmd = new MySqlCommand(insert, con))
                {
                    if (insertpar != null)
                    {
                        foreach (MySqlParameter spar in insertpar)
                        {
                            cmd.Parameters.Add(spar);
                        }
                    }
                    return cmd.ExecuteNonQuery();

                }

            //}
            //catch
            //{
            //    return -1;
            //}
            //finally
            //{
            //    this.close();
            //}
        }
        else
        {
            return 0;
        }
    }

    public DataSet getapplysalary()
    {
        string sql = "select * from salaryapply,staffinfo,salarytype,state where salaryapply.WID=staffinfo.WID and salarytype.SalaryTypeID=salaryapply.ApplyType and state.StateID=salaryapply.State ORDER BY ApplyTime";
        this.open();
        using (MySqlDataAdapter da = new MySqlDataAdapter(sql, con))
        {
            DataSet ds = new DataSet();
            da.Fill(ds);
            this.close();
            return ds;
        } 
    }

    public DataSet getmyapplysalary(string SID)
    {
        string sql = "select * from salaryapply,staffinfo,salarytype,state where salaryapply.WID=staffinfo.WID and salarytype.SalaryTypeID=salaryapply.ApplyType and state.StateID=salaryapply.State and (ApplyPerson=" + SID + " OR salaryapply.WID in (select WID from staffinfo where SID=" + SID + ")) ORDER BY ApplyTime";
        this.open();
        using (MySqlDataAdapter da = new MySqlDataAdapter(sql, con))
        {
            DataSet ds = new DataSet();
            da.Fill(ds);
            this.close();
            return ds;
        }
    }
}