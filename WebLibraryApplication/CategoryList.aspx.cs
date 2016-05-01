using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLayer;

namespace WebLibraryApplication
{
    public partial class CategoryList : System.Web.UI.Page
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
                ItemDataProcess.DeleteCategoriesByID(Convert.ToInt32(e.CommandArgument));
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
                Category category = new Category();
                category.CategoryId = Convert.ToInt32(e.CommandArgument);
                category.Name = ((TextBox)GridViewAdmin.Rows[rowIndex].FindControl("TextBoxCategoryName")).Text;
                category.ShelfNumber = ((DropDownList)GridViewAdmin.Rows[rowIndex].FindControl("DropDownListCategoryShelfNumber")).SelectedItem.Text;
                GridViewAdmin.EditIndex = -1;
                ItemDataProcess.UpdateCategories(category);
                GridViewDataBind();
            }
            else if (e.CommandName == "InsertRow")
            {
                Category category = new Category();
                category.Name = ((TextBox)GridViewAdmin.FooterRow.FindControl("txtName")).Text;
                category.ShelfNumber = ((DropDownList)GridViewAdmin.FooterRow.FindControl("dllCategoryInsertShelfNumber")).SelectedItem.Text;
                ItemDataProcess.InsertCategories(category);
                GridViewDataBind();
            }
        }


        private void GridViewDataBind()
        {
            GridViewAdmin.DataSource = ItemDataProcess.GetCategories(); //Görüldüğü gibi GridView’e DataSet nesnesi atanıyor.
            GridViewAdmin.DataBind();//this.DataBind() değil GridView’in DataBind()’i çağrıldı
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridViewAdmin.PageIndex = e.NewPageIndex;
            GridViewDataBind();
        }
    }
}