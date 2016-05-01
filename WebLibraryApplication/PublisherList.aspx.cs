using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLayer;

namespace WebLibraryApplication
{
    public partial class PublisherList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                GridViewDataBind();
            }
        }

        protected void GridViewAdmin_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditRow")
            {
                int rowIndex = ((GridViewRow)((LinkButton)e.CommandSource).NamingContainer).RowIndex;
                GridViewAdmin.EditIndex = rowIndex;
                GridViewDataBind();
            }
            else if (e.CommandName == "DeleteRow")
            {
                ItemDataProcess.DeletePublishersByID(Convert.ToInt32(e.CommandArgument));
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
                Publisher publisher = new Publisher();
                publisher.PublisherId = Convert.ToInt32(e.CommandArgument);
                publisher.Name = ((TextBox)GridViewAdmin.Rows[rowIndex].FindControl("TextBoxPublisherName")).Text;
                publisher.Address = ((TextBox)GridViewAdmin.Rows[rowIndex].FindControl("TextBoxPublisherAddress")).Text;
                GridViewAdmin.EditIndex = -1;
                ItemDataProcess.UpdatePublishers(publisher);
                GridViewDataBind();
            }
            else if (e.CommandName == "InsertRow")
            {
                Publisher publisher = new Publisher();
                publisher.Name = ((TextBox)GridViewAdmin.FooterRow.FindControl("txtName")).Text;
                publisher.Address = ((TextBox)GridViewAdmin.FooterRow.FindControl("txtAddress")).Text;
                ItemDataProcess.InsertPublishers(publisher);
                GridViewDataBind();
            }
        }


        private void GridViewDataBind()
        {
            GridViewAdmin.DataSource = ItemDataProcess.GetPublishers(); //Görüldüğü gibi GridView’e DataSet nesnesi atanıyor.
            GridViewAdmin.DataBind();//this.DataBind() değil GridView’in DataBind()’i çağrıldı
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridViewAdmin.PageIndex = e.NewPageIndex;
            GridViewDataBind();
        }
    }
}