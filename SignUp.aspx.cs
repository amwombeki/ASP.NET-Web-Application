using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Drawing;

public partial class SignUp : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btSignup_Click(object sender, EventArgs e)
    {

        if(tbFname.Text!="" & tbLname.Text !=""  & tbUname.Text !=""  & tbPass.Text !=""  & tbCPass.Text !=""  & tbEmail.Text !="")
        {
            if (tbPass.Text==tbCPass.Text)
            { 
        string constr = ConfigurationManager.ConnectionStrings["MasaiConnectionString1"].ConnectionString;
        string cmdstr = "INSERT INTO Customers VALUES(@firstname, @lastname, @username, @password, @confirmpassword, @email, @usertype)";
        SqlConnection con = new SqlConnection(constr);
        SqlCommand com = new SqlCommand(cmdstr, con);
        com.Parameters.AddWithValue("firstname", tbFname.Text);
        com.Parameters.AddWithValue("lastname", tbLname.Text);
        com.Parameters.AddWithValue("username", tbUname.Text);
        com.Parameters.AddWithValue("password", tbPass.Text);
        com.Parameters.AddWithValue("confirmpassword", tbCPass.Text);
        com.Parameters.AddWithValue("email", tbEmail.Text);
        com.Parameters.AddWithValue("usertype", 'U');

        con.Open();
        com.ExecuteNonQuery();
        con.Close();
        lblmsg.Text = "Thanks for Registering";
        lblmsg.ForeColor = Color.Green;

        Response.Redirect("SignIn.aspx");

        //tbFname.Text = "";
        //tbLname.Text = "";
        //tbUname.Text = "";
        //tbPass.Text = "";
        //tbCPass.Text = "";
        //tbEmail.Text = "";
            }
            else
            {
                lblmsg.ForeColor = Color.Red;
                lblmsg.Text = "Password do not match";
            }
        }
        else
        {
            lblmsg.ForeColor = Color.Red;
            lblmsg.Text = "All Fields are Mandatory!!";
        }

    }
}