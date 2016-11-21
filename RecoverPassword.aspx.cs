using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;

public partial class RecoverPassword : System.Web.UI.Page
{
    string cs = ConfigurationManager.ConnectionStrings["MasaiConnectionString1"].ConnectionString;
    string GUIDvalue;
    DataTable dt = new DataTable();
    int Uid;

    protected void Page_Load(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(cs);

        GUIDvalue = Request.QueryString["Uid"];
        if (GUIDvalue != null)
        {
            SqlCommand cmd = new SqlCommand("SELECT * FROM ForgotPassRequests WHERE Id= '" + GUIDvalue + "'", con);
            con.Open();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            if(dt.Rows.Count !=0)
            {
                Uid = Convert.ToInt32(dt.Rows[0][1]);
            }

            else
            {
                lblMsg.Text = "Your Password Reset Link is Expired or Invalid";
                lblMsg.ForeColor = Color.Red;
            }
            con.Close();
        }
        else
        {
            Response.Redirect("~/Default.aspx");
        }

        if(!IsPostBack)
        {
            if(dt.Rows.Count !=0)
            {
                tbNewPass.Visible = true;
                tbConfirmPass.Visible = true;
                lblPassword.Visible = true;
                lblRetypePass.Visible = true;
                btRecPass.Visible = true;
            }
            else
            {
                lblMsg.Text = "Your Password Reset Link is Expired or Invalid";
                lblMsg.ForeColor = Color.Red;
            }
        }
        
    }
    
    protected void btRecPass_Click(object sender, EventArgs e)
    {
        if(tbNewPass.Text !="" && tbConfirmPass.Text !="" && tbNewPass.Text==tbConfirmPass.Text)
        { 
        SqlConnection con = new SqlConnection(cs);
        SqlCommand cmd = new SqlCommand("UPDATE Customers SET Password ='"+tbNewPass.Text+"', ConfirmPassword='"+tbConfirmPass.Text+"' WHERE Uid = '"+Uid+"'", con);
        con.Open();
        cmd.ExecuteNonQuery();

        SqlCommand cmd2 = new SqlCommand("DELETE FROM ForgotPassRequests WHERE Uid='" + Uid + "'", con);
        cmd2.ExecuteNonQuery();
        Response.Redirect("~/SignIn.aspx");
        con.Close();
        }

       
    }
}