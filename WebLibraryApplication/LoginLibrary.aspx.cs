using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLayer;

namespace WebLibraryApplication
{
    public partial class LoginLibrary : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void ButtonLogin_Click(object sender, EventArgs e)
        {
            User usr = UserDataProcess.controlUser(TextBoxLoginNick.Text, InputLoginPassword.Value);
            User admin = AdminDataProcess.controlAdmin(TextBoxLoginNick.Text, InputLoginPassword.Value);
            LabelNoUser.Text = "";
            if (usr != null)
            {
                if (admin != null)
                {
                    Session["AuthenticatedAdminData"] = admin;
                    UserDataProcess.UpdateUserOnline(admin.UserId, true);
                }
                else
                {
                    Session["AuthenticatedUserData"] = usr;
                    UserDataProcess.UpdateUserOnline(usr.UserId, true);
                }
                Response.Redirect("HomeLibrary.aspx");
            }
            else
            {
                LabelNoUser.Text = "No Authentication!";
            }
        }

        protected void ButtonSignUp_Click(object sender, EventArgs e)
        {
            Response.Redirect("SignUp.aspx");
        }
    }
}