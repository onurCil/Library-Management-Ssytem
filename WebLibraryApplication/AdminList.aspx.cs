using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLayer;

namespace WebLibraryApplication
{
    public partial class AdminList : System.Web.UI.Page
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
                AdminDataProcess.DeleteAdminByID(Convert.ToInt32(e.CommandArgument));
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
                Admin admin = new Admin();
                User user = new User();
                admin.AdminId = Convert.ToInt32(e.CommandArgument);
                admin.WorkHour = Convert.ToInt32(((TextBox)GridViewAdmin.Rows[rowIndex].FindControl("TextBoxEditWorkHour")).Text);

                user.Name = ((TextBox)GridViewAdmin.Rows[rowIndex].FindControl("TextBoxAdminName")).Text;
                user.Gender = ((DropDownList)GridViewAdmin.Rows[rowIndex].FindControl("ddlGender")).SelectedItem.Text;
                user.Address = ((TextBox)GridViewAdmin.Rows[rowIndex].FindControl("TextBoxAdminAddress")).Text;
                user.Password = ((TextBox)GridViewAdmin.Rows[rowIndex].FindControl("TextBoxAdminPassword")).Text;
                user.NickName = ((TextBox)GridViewAdmin.Rows[rowIndex].FindControl("TextBoxAdminNickName")).Text;
                string online = ((Label)GridViewAdmin.Rows[rowIndex].FindControl("LabelAdminOnline")).Text;
                if (online == "Offline")
                {

                    user.IsOnline = false;
                }
                else if (online == "Online")
                {
                    user.IsOnline = true;

                }
                user.Mail = ((TextBox)GridViewAdmin.Rows[rowIndex].FindControl("TextBoxAdminMail")).Text;

                GridViewAdmin.EditIndex = -1;
                admin.UserId = AdminDataProcess.getUserIdByAdminId(admin.AdminId);
                user.UserId = AdminDataProcess.getUserIdByAdminId(admin.AdminId);
                UserDataProcess.UpdateUsers(user);
                AdminDataProcess.UpdateAdmins(admin);


                GridViewDataBind();
            }
            else if (e.CommandName == "InsertRow")
            {
                Admin admin = new Admin();
                User user = new User();

                admin.WorkHour = Convert.ToInt32(((TextBox)GridViewAdmin.FooterRow.FindControl("TextBoxInsertWorkHour")).Text);

                user.Name = ((TextBox)GridViewAdmin.FooterRow.FindControl("txtName")).Text;
                user.Gender = ((DropDownList)GridViewAdmin.FooterRow.FindControl("ddlAdminInsertGender")).SelectedItem.Text;
                user.Address = ((TextBox)GridViewAdmin.FooterRow.FindControl("txtAddress")).Text;
                user.Password = ((TextBox)GridViewAdmin.FooterRow.FindControl("txtPassword")).Text;
                user.NickName = ((TextBox)GridViewAdmin.FooterRow.FindControl("txtNickName")).Text;
                user.IsOnline = false;

                user.Mail = ((TextBox)GridViewAdmin.FooterRow.FindControl("txtMail")).Text;

                UserDataProcess.InsertUser(user);
                admin.UserId = AdminDataProcess.getUserIdByNickName(user.NickName);//select gender kısmı problem//ekran paass insert nokta//delete için tirgger olmalı //active ve online düzeltilmeli/7store u at //ay hafta doldur
                AdminDataProcess.InsertAdmin(admin);
                GridViewDataBind();



            }
        }


        private void GridViewDataBind()
        {
            GridViewAdmin.DataSource = AdminDataProcess.GetAdmins();//Görüldüğü gibi GridView’e DataSet nesnesi atanıyor.
            GridViewAdmin.DataBind();//this.DataBind() değil GridView’in DataBind()’i çağrıldı
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridViewAdmin.PageIndex = e.NewPageIndex;
            GridViewDataBind();
        }

        protected string returnAdminOnline(bool Online)
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