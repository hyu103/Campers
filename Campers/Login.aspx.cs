using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LabTest1
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                try
                {
                    LoginInfo loginInfo = DatabaseHelper.Login(txtUserName.Text, txtPassword.Text);
                    Session.Add("login", loginInfo); // Save login information into session
                    Response.Redirect("~/Vacationers.aspx");
                }
                catch (Exception)
                {
                    lblInvalid.Visible = true;
                }
            }
        }
    }
}