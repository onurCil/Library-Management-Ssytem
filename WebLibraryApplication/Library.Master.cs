using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLayer;

namespace WebLibraryApplication
{
    public partial class Library : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["AuthenticatedUserData"] == null && Session["AuthenticatedAdminData"] == null)
            {
                ButtonLogIn.Visible = true;
                ButtonLogOut.Visible = false;
                ButtonOrder.Visible = false;
                LinkButton1.Visible = false;
            }
            else
            {
                ButtonLogOut.Visible = true;
                ButtonLogIn.Visible = false;
                LinkButton1.Visible = true;
                if (Session["AuthenticatedAdminData"] == null)
                {
                    ButtonOrder.Visible = true;
                }
                else
                {
                    ButtonOrder.Visible = false;
                }
            }
        }

        protected void ButtonLogOut_Click(object sender, EventArgs e)
        {

            if (Session["AuthenticatedUserData"]!=null)
            {
                User user = (User)Session["AuthenticatedUserData"];
                UserDataProcess.UpdateUserOnline(user.UserId, false);
            }
            else if (Session["AuthenticatedAdminData"] != null)
            {
                User admin = (User)Session["AuthenticatedAdminData"];
                UserDataProcess.UpdateUserOnline(admin.UserId, false);
            }
            
            Session["AuthenticatedUserData"] = null;
            Session["AuthenticatedAdminData"] = null;
            ButtonLogOut.Visible = false;
            ButtonLogIn.Visible = true;
            LinkButton1.Visible = false;
            ButtonOrder.Visible = false;
            Response.Redirect("Default.aspx");
        }

        protected void ButtonLogIn_Click(object sender, EventArgs e)
        {
            Response.Redirect("LoginLibrary.aspx");
            ButtonLogIn.Visible = false;
            ButtonLogOut.Visible = false;
            ButtonOrder.Visible = false;
            LinkButton1.Visible = false;
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("HomeLibrary.aspx");
        }

        protected void ButtonOrdes_Click(object sender, EventArgs e)
        {
            Response.Redirect("BorrowList.aspx");
        }
    }
}