using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLayer;

namespace WebLibraryApplication
{
    public partial class HomeLibrary : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["AuthenticatedUserData"] != null)//Normal User
            {
                User user = (User)Session["AuthenticatedUserData"];
                LabelWelcome.Text = "Welcome To DEU Library " + user.Name;
                if (BorrowDataProcess.GetUserBorrows(user.UserId) != null)
                {
                    ButtonReturn.Visible = true;
                    ButtonExtend.Visible = true;
                }
                else
                {
                    ButtonReturn.Visible = false;
                    ButtonExtend.Visible = false;
                }
                ButtonRent.Visible = true;
                ButtonEditAdmin.Visible = false;
                ButtonEditBorrow.Visible = false;
                ButtonEditCategory.Visible = false;
                ButtonEditItem.Visible = false;
                ButtonEditMember.Visible = false;
                ButtonEditPublisher.Visible = false;
            }
            else if (Session["AuthenticatedAdminData"] != null)//Admin
            {
                User admin = (User)Session["AuthenticatedAdminData"];
                LabelWelcome.Text = "Welcome To DEU Library " + admin.Name;
                LabelAdmin.Text = "Admin Functions";
                
                ButtonRent.Visible = false;
                ButtonReturn.Visible = false;
                ButtonExtend.Visible = false;
                ButtonEditAdmin.Visible = true;
                ButtonEditBorrow.Visible = true;
                ButtonEditCategory.Visible = true;
                ButtonEditItem.Visible = true;
                ButtonEditMember.Visible = true;
                ButtonEditPublisher.Visible = true;
            }
        }

        protected void ButtonRent_Click(object sender, EventArgs e)/*Kirala Fonksiyonu*/
        {
            Response.Redirect("ItemTypeList.aspx");
        }

        protected void ButtonReturn_Click(object sender, EventArgs e)/*Iade Fonksiyonu*/
        {
            Response.Redirect("BorrowList.aspx");
        }

        protected void ButtonEditMember_Click(object sender, EventArgs e)
        {
            Response.Redirect("MemberList.aspx");
        }

        protected void ButtonEditAdmin_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminList.aspx");
        }

        protected void ButtonEditCategory_Click(object sender, EventArgs e)
        {
            Response.Redirect("CategoryList.aspx");
        }

        protected void ButtonEditPublisher_Click(object sender, EventArgs e)
        {
            Response.Redirect("PublisherList.aspx");
        }

        protected void ButtonEditItem_Click(object sender, EventArgs e)
        {
            Response.Redirect("ItemTypeList.aspx");
        }

        protected void ButtonEditBorrow_Click(object sender, EventArgs e)
        {
            Response.Redirect("BorrowList.aspx");
        }

        protected void ButtonExtend_Click(object sender, EventArgs e)
        {
            Response.Redirect("BorrowList.aspx");
        }
    }
}