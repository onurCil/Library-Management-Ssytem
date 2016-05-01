using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLayer;

namespace WebLibraryApplication
{
    public partial class SignUp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void ButtonSignUp_Click(object sender, EventArgs e)
        {
            Member member = new Member();
            User user = new User();

            user.Name = TextBoxName.Text;
            user.NickName = TextBoxNick.Text;
            user.Mail = TextBoxMail.Text;
            user.Address = TextBoxAddress.Text;
            member.FacultyName = ddlFacultyName.SelectedItem.Text;
            member.MemberType = ddlMemberType.SelectedItem.Text;
            user.Gender = RadioButtonGender.Text;
            user.Password = InputPassword.Value;
            if (user.Password == InputConfirmPassword.Value)
            {
                UserDataProcess.InsertUser(user);
                member.UserId = MemberDataProcess.getUserIdByNickName(user.NickName);
                MemberDataProcess.InsertMember(member);
                Response.Redirect("Default.aspx");
            }
            else
            {
                TextBoxAddress.Text = "";
                InputPassword.Value = "";
                TextBoxMail.Text = "";
                TextBoxName.Text = "";
                TextBoxNick.Text = "";
                InputConfirmPassword.Value = "";
                ddlFacultyName.SelectedIndex = -1;
                ddlMemberType.SelectedIndex = -1;
            }

        }

        protected void ButtonCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("LoginLibrary.aspx");
        }


    }
}