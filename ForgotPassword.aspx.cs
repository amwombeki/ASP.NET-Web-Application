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
using System.Net.Mail;
using System.Net;

public partial class ForgotPassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblEmailSettings.Text = "Note: To receive the password reset link, make sure you select \"Turn on\" option on the lesssecure apps settings on your email account.<br/> Otherwise you'll run into secure connection error.";    
    }
    protected void BtPassRec_Click(object sender, EventArgs e)
    {
        string constr = ConfigurationManager.ConnectionStrings["MasaiConnectionString1"].ConnectionString;
        SqlConnection con = new SqlConnection(constr);
        string cmdstr = "SELECT * FROM Customers WHERE Email='"+tbEmailId.Text+"'";
        SqlCommand com = new SqlCommand(cmdstr, con);
        con.Open();
        SqlDataAdapter da = new SqlDataAdapter(com);
        DataTable dt = new DataTable();
        da.Fill(dt);

        if(dt.Rows.Count !=0)
        {
            String myGUID = Guid.NewGuid().ToString();
            int Uid = Convert.ToInt32(dt.Rows[0][0]);
            string cmdstr1="INSERT INTO ForgotPassRequests VALUES(@guid, @uid, getdate())";
            SqlCommand cmd1 = new SqlCommand(cmdstr1,con);
            cmd1.Parameters.AddWithValue("@guid", myGUID);
            cmd1.Parameters.AddWithValue("@uid", Uid);           
            cmd1.ExecuteNonQuery();

            //Send Email
            string senderAddress = "amonmwesiga@gmail.com";
            string senderPassword = "Kangantebe1714";
            string ToEmailAddress = dt.Rows[0][6].ToString();
            string Username = dt.Rows[0][3].ToString();
            string EmailBody = "Hi " + Username + ",<br/><br/> Click the link below to reset your password <br/> http://localhost:51640/RecoverPassword.aspx?Uid=" + myGUID;
            
            MailMessage mail = new MailMessage(senderAddress, ToEmailAddress);
            mail.Body = EmailBody;
            mail.IsBodyHtml = true;
            mail.Subject = "Reset Password";

            SmtpClient SMTP = new SmtpClient("smtp.gmail.com", 587);          
            SMTP.Credentials = new NetworkCredential(senderAddress, senderPassword);

            SMTP.EnableSsl = true;
            SMTP.Send(mail);

            lblPassRec.Text = "Check your email to reset your password";
            lblPassRec.ForeColor = Color.Green;
            
        }

        else
        {
            lblPassRec.Text = "Oops! Email does not exist in our database!";
            lblPassRec.ForeColor = Color.Red;
        }
        con.Close();
    }
}