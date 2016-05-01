using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLayer;
using System.Data;

namespace WebLibraryApplication
{
    public partial class MemberList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                GridViewDataBind();
            }
        }
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditRow")
            {
                int rowIndex = ((GridViewRow)((LinkButton)e.CommandSource).NamingContainer).RowIndex;
                GridViewAdmin.EditIndex = rowIndex;
                GridViewDataBind();
            }
            else if (e.CommandName == "DeleteRow")
            {
                int memberID = Convert.ToInt32(e.CommandArgument);
                int userID = MemberDataProcess.getUserIdByMemberId(memberID);
                MemberDataProcess.DeleteBillByMemberID(memberID);
                BorrowDataProcess.DeleteBorrowByUserID(userID);//Önce kiralamaları varsa onları siliyoruz.
                MemberDataProcess.DeleteMemberByID(Convert.ToInt32(e.CommandArgument));
                GridViewDataBind();
            }
            else if (e.CommandName == "CancelUpdate")
            {
                GridViewAdmin.EditIndex = -1;
                GridViewDataBind();
            }
            else if (e.CommandName == "UpdateRow")
            {
                int rowIndex = ((GridViewRow)((LinkButton)e.CommandSource).NamingContainer).RowIndex;
                Member member = new Member();
                User user = new User();
                member.MemberId = Convert.ToInt32(e.CommandArgument);
                member.FacultyName = ((DropDownList)GridViewAdmin.Rows[rowIndex].FindControl("ddlFacultyName")).SelectedItem.Text;
                member.MemberType = ((DropDownList)GridViewAdmin.Rows[rowIndex].FindControl("ddlMemberType")).SelectedItem.Text;
                member.IsActive = true;

                user.Name = ((TextBox)GridViewAdmin.Rows[rowIndex].FindControl("TextBoxMemberName")).Text;
                user.Gender = ((DropDownList)GridViewAdmin.Rows[rowIndex].FindControl("ddlGender")).SelectedItem.Text;
                user.Address = ((TextBox)GridViewAdmin.Rows[rowIndex].FindControl("TextBoxMemberAddress")).Text;
                user.Password = ((TextBox)GridViewAdmin.Rows[rowIndex].FindControl("TextBoxMemberPassword")).Text;
                user.NickName = ((TextBox)GridViewAdmin.Rows[rowIndex].FindControl("TextBoxMemberNickName")).Text;
                user.IsOnline = false;
                user.Mail = ((TextBox)GridViewAdmin.Rows[rowIndex].FindControl("TextBoxMemberMail")).Text;

                GridViewAdmin.EditIndex = -1;
                member.UserId = MemberDataProcess.getUserIdByMemberId(member.MemberId);
                user.UserId = MemberDataProcess.getUserIdByMemberId(member.MemberId);
                UserDataProcess.UpdateUsers(user);
                MemberDataProcess.UpdateMembers(member);


                GridViewDataBind();
            }
            else if (e.CommandName == "InsertRow")
            {
                Member member = new Member();
                User user = new User();

                member.FacultyName = ((DropDownList)GridViewAdmin.FooterRow.FindControl("ddlMemberInsertFacultyName")).SelectedItem.Text;
                member.MemberType = ((DropDownList)GridViewAdmin.FooterRow.FindControl("ddlMemberInsertType")).SelectedItem.Text;
                member.IsActive = true;


                user.Name = ((TextBox)GridViewAdmin.FooterRow.FindControl("txtName")).Text;
                user.Gender = ((DropDownList)GridViewAdmin.FooterRow.FindControl("ddlMemberInsertGender")).SelectedItem.Text;
                user.Address = ((TextBox)GridViewAdmin.FooterRow.FindControl("txtAddress")).Text;
                user.Password = ((TextBox)GridViewAdmin.FooterRow.FindControl("txtPassword")).Text;
                user.NickName = ((TextBox)GridViewAdmin.FooterRow.FindControl("txtNickName")).Text;
                user.IsOnline = false;

                user.Mail = ((TextBox)GridViewAdmin.FooterRow.FindControl("txtMail")).Text;

                UserDataProcess.InsertUser(user);
                member.UserId = MemberDataProcess.getUserIdByNickName(user.NickName);
                MemberDataProcess.InsertMember(member);
                GridViewDataBind();



            }
        }


        private void GridViewDataBind()
        {
            GridViewAdmin.DataSource = MemberDataProcess.GetMembers(); //Görüldüğü gibi GridView’e DataSet nesnesi atanıyor.
            GridViewAdmin.DataBind();//this.DataBind() değil GridView’in DataBind()’i çağrıldı
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridViewAdmin.PageIndex = e.NewPageIndex;
            GridViewDataBind();
        }


        protected string returnMemberOnline(bool Online)
        {
            if (Online == false)
            {
                return "Offline";
            }
            else
            {
                return "Online";
            }
        }
        protected User returnUserById(int userId)
        {
            return UserDataProcess.getUserByID(userId);
        }



    }
}