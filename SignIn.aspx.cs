using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class SignIn : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            if(Request.Cookies["UNAME"] !=null && Request.Cookies["PWD"] !=null)
            {
                tbUname.Text = Request.Cookies["UNAME"].Value;
                tbPass.Attributes["value"] = Request.Cookies["PWD"].Value;
                CheckBox1.Checked = true;
            }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string constr = ConfigurationManager.ConnectionStrings["MasaiConnectionString1"].ConnectionString;
        SqlConnection con = new SqlConnection(constr);
        string cmdstr = "SELECT * FROM Customers WHERE Username ='"+tbUname.Text+"' and Password ='"+tbPass.Text+"'";
        SqlCommand com = new SqlCommand(cmdstr, con);
        con.Open();
        SqlDataAdapter da = new SqlDataAdapter(com);
        DataTable dt = new DataTable();
        da.Fill(dt);

        if(dt.Rows.Count!=0)
        {
            if(CheckBox1.Checked)
            {
                Response.Cookies["UNAME"].Value = tbUname.Text;
                Response.Cookies["PWD"].Value = tbPass.Text;

                Response.Cookies["UNAME"].Expires = DateTime.Now.AddMinutes(5);
                Response.Cookies["PWD"].Expires = DateTime.Now.AddMinutes(55);


            }
            else
            {
                Response.Cookies["UNAME"].Expires = DateTime.Now.AddDays(-1);
                Response.Cookies["PWD"].Expires = DateTime.Now.AddDays(-1);
            }
            string Utype;
            Utype = dt.Rows[0][7].ToString().Trim();

            if(Utype== "U")
            {
                Session["USERNAME"] = tbUname.Text;
                Response.Redirect("~/UsersHome.aspx");
            }

            else
            {
                Session["USERNAME"] = tbUname.Text;
                Response.Redirect("~/AdminHome.aspx");
            }

           
        }

        else
        {
            lblError.Text = "Invalid Username or Password!";
        }
        con.Close();
    }
}