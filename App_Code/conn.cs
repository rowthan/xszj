using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MySql.Data.MySqlClient;
using System.Data;
/// <summary>
/// conn 连接类 主要用于执行语句 包括建立连接 关闭连接 执行读操作/判断是否存在，执行一般语句/带参数不带参数的（重写），返回数据集
/// </summary>
public class conn
{
    private MySqlConnection con = null;
    private string constr;

    public conn()
    {// TODO: 在此处添加构造函数逻辑
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

    public void loginRecord(string session)
    {
        this.open();
        string sql="update staffinfo set lastLogin=?logintime,LoginCount=LoginCount+1 where SID=?userid";
        using (MySqlCommand cmd = new MySqlCommand(sql,con))
        {//此处不能使用wid进行认证，因为wid并不唯一，并且在注册时没有进行限制，
            //虽然name同样不唯一，但是name在进行注册的时候已经进行限制不能重复。
            //如果用wid进行认证会导致数据出错，脏读
            cmd.Parameters.AddWithValue("?LoginTime", DateTime.Now);
            cmd.Parameters.AddWithValue("?userid", session);
            cmd.ExecuteNonQuery();
        }
        sql = null;
        session = null;
        this.close();
    }

    public string checklogin(string name, string password)//检查登录 返回学号
    {
        ////下面使用MySql Connector/net提供的专用对象
        MySqlConnection mycon = new MySqlConnection(constr);
        mycon.Open();
        MySqlCommand cmd = new MySqlCommand("select Name,SID from staffinfo where PWD=?password and (Name=?username or SID=?username or WID=?username)", mycon);//此处不能使用wid进行认证，因为wid并不唯一，并且在注册时没有进行限制，虽然name同样不唯一，但是name在进行注册的时候已经进行限制不能重复。如果用wid进行认证会导致数据出错，脏读
        cmd.Parameters.AddWithValue("?username", name);
        cmd.Parameters.AddWithValue("?password", password);
        MySqlDataReader reader = cmd.ExecuteReader();
        if (reader.Read())
        {                
            String userid = reader.GetString(1);
            reader.Close();
            cmd = null;
            mycon.Close();
            mycon = null;
            loginRecord(userid);
            return userid;
        }
        else return null;
    }

    public int ExecuteSql(string strSql, MySqlParameter[] myPar)
    {
        try
        {
            this.open();
            using (MySqlCommand cmd = new MySqlCommand(strSql, con))
            {
                if (myPar != null)
                {
                    foreach (MySqlParameter spar in myPar)
                    {
                        cmd.Parameters.Add(spar);
                    }        
                 }
                strSql = null;
                myPar = null;
               
                return cmd.ExecuteNonQuery();
                
            }

        }
        catch
        {
            return -1;
        }
        finally
        {
            this.close();
        }
    }//返回变化的条数

    public int ExecuteSql(string strSql)
    {
        try
        {
            this.open();
            using (MySqlCommand cmd = new MySqlCommand(strSql, con))
            {
                return  cmd.ExecuteNonQuery();
            }


        }
        catch
        {
            return -1;
        }
        finally
        {
            this.close();
        }
    }//返回变化的条数

    public bool ReadSql(string strSql, MySqlParameter[] myPar)
    {
        try
        {
            this.open();
            MySqlCommand cmd = new MySqlCommand(strSql, con);
            if (myPar != null)
            {
                foreach (MySqlParameter spar in myPar)
                {
                    cmd.Parameters.Add(spar);
                }
            }
            MySqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read()) { reader.Close(); cmd.Dispose(); cmd = null; return true; }
            else { reader.Close(); cmd.Dispose(); cmd = null; return false; }
        }
        catch
        {
            return false;
        }
        finally
        {
            this.close();
        }
    }//带参查询 如果存在就返回真 否则为假


    public bool ReadSql(string strSql)
    {
        try
        {
            this.open();
            MySqlCommand cmd = new MySqlCommand(strSql, con);
            MySqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read()) { reader.Close(); cmd.Dispose(); cmd = null; return true; }
            else { reader.Close(); cmd.Dispose(); cmd = null; return false; }
        }
        catch
        {
            return false;
        }
        finally
        {
            this.close();
        }
    }
    public DataSet GetDataSet(string strSql)//获取数据
    {
        try
        {
        this.open();
        MySqlDataAdapter da = new MySqlDataAdapter(strSql, con);
        DataSet ds = new DataSet();
        da.Fill(ds);
        da.Dispose();
        da = null;
        strSql = null;
        return ds;
        }
        catch
        {
        return null;
        }
        finally
        {
        this.close();
        }
    }//无参数调用 可以写一个调用参数的

    public string  Getstring(string strSql)//获取数据
    {
        try
        {
            this.open();
            MySqlCommand cmd = new MySqlCommand(strSql, con);
            MySqlDataReader reader = cmd.ExecuteReader();
            string result = reader.GetString(0);
            if (reader.Read()) { reader.Close(); cmd.Dispose(); cmd = null; return result; }
            else { reader.Close(); cmd.Dispose(); cmd = null; return "no"; }
        }
        catch
        {
            return null;
        }
        finally
        {
            this.close();
        }
    }//无参数调用 可以写一个调用参数的

}