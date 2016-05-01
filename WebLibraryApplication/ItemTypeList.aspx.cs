using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLayer;

namespace WebLibraryApplication
{
    public partial class ItemTypeList : System.Web.UI.Page
    {
        string bookType = "LIST BOOKS";
        string newspaperType = "LIST NEWSPAPERS";
        string journalType = "LIST JOURNALS";
        string videoType = "LIST VIDEOS";
        string itemType = "LIST ALL";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {

                String[] array = new String[10];
                array = ItemDataProcess.getBookByItemId(4);
                GridViewDataBind();
                List<Category> categories = ItemDataProcess.GetCategories();
                List<Publisher> publishers = ItemDataProcess.GetPublishers();
                Session["PublisherData"] = publishers;
                Session["CategoryData"] = categories;
                if (Session["AuthenticatedAdminData"] != null)
                {
                    FillCategories();
                    FillPublishers();
                    FillDate();
                }
            }
        }

        void FillCategories()
        {
            if (ItemDataProcess.type != itemType && Session["AuthenticatedAdminData"] != null)
            {
                List<Category> categories = (List<Category>)Session["CategoryData"];
                foreach (Category category in categories)
                {
                    ((DropDownList)GridViewAdminDistinct.FooterRow.FindControl("ddlDistinctFooterItemCategory")).Items.Add(new ListItem { Text = category.Name, Value = category.CategoryId.ToString() });
                }
            }
        }

        void FillPublishers()
        {
            if (ItemDataProcess.type != itemType && Session["AuthenticatedAdminData"] != null)
            {
                List<Publisher> publishers = (List<Publisher>)Session["PublisherData"];
                foreach (Publisher publisher in publishers)
                {
                    ((DropDownList)GridViewAdminDistinct.FooterRow.FindControl("ddlDistinctFooterItemPublisher")).Items.Add(new ListItem { Text = publisher.Name, Value = publisher.PublisherId.ToString() });
                }
            }

        }

        void FillDate()
        {
            if (ItemDataProcess.type != itemType && Session["AuthenticatedAdminData"] != null)
            {


                //Year
                for (int i = 1990; i <= DateTime.Now.Year; i++)
                {
                    ListItem item = new ListItem();
                    item.Text = new DateTime(i, 1, 1).ToString("yyyy");
                    item.Value = i.ToString();
                    ((DropDownList)GridViewAdminDistinct.FooterRow.FindControl("ddlDistinctItemYear")).Items.Add(new ListItem { Text = item.Text, Value = item.Value });
                }
                //Month
                for (int i = 1; i <= 12; i++)
                {
                    ListItem item = new ListItem();
                    item.Text = new DateTime(1900, i, 1).ToString("MMMM");
                    item.Value = i.ToString();
                    ((DropDownList)GridViewAdminDistinct.FooterRow.FindControl("ddlDistinctItemMonth")).Items.Add(new ListItem { Text = item.Text, Value = item.Value });
                }
                //Day
                for (int i = 1; i <= 31; i++)
                {
                    ListItem item = new ListItem();
                    item.Text = new DateTime(1900, 1, i).ToString("dd");
                    item.Value = i.ToString();
                    ((DropDownList)GridViewAdminDistinct.FooterRow.FindControl("ddlDistinctItemDay")).Items.Add(new ListItem { Text = item.Text, Value = item.Value });
                }
            }
        }

        protected bool returnRentAvailable(string isAvailable)
        {
            if (isAvailable == "Available")
            {
                return true;
            }
            else if (isAvailable == "Unavailable")
            {
                return false;
            }

            return false;
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if ((DropDownList)e.Row.FindControl("ddlDistinctItemCategory") != null)
                {
                    DropDownList DropDownList1 = (DropDownList)e.Row.FindControl("ddlDistinctItemCategory");
                    DropDownList1.DataSource = ItemDataProcess.GetCategories();
                    DropDownList1.DataTextField = "name";
                    DropDownList1.DataValueField = "categoryId";
                    DropDownList1.DataBind();
                }
                if ((DropDownList)e.Row.FindControl("ddlDistinctItemPublisher") != null)
                {
                    DropDownList DropDownList1 = (DropDownList)e.Row.FindControl("ddlDistinctItemPublisher");
                    DropDownList1.DataSource = ItemDataProcess.GetPublishers();
                    DropDownList1.DataTextField = "name";
                    DropDownList1.DataValueField = "publisherId";
                    DropDownList1.DataBind();
                }
            }
        }

        protected string returnCategoryName(int value)
        {
            return ItemDataProcess.getCategoryNameByCategoryID(value);
        }

        protected string returnPublisherName(int value)
        {
            return ItemDataProcess.getPublisherNameByPublisherID(value); ;
        }

        protected Item returnItemById(int id)
        {
            return ItemDataProcess.getItemByID(id);
        }

        protected string[] returnAllBook(int id)
        {
            return ItemDataProcess.getBookByItemId(id);
        }

        protected string[] returnAllJournal(int id)
        {
            return ItemDataProcess.getJournalByItemId(id);
        }

        protected string[] returnAllNewspaper(int id)
        {
            return ItemDataProcess.getNewspaperByItemId(id);
        }

        protected string[] returnAllVideo(int id)
        {
            return ItemDataProcess.getVideoByItemId(id);
        }

        protected string[] returnItem(int id)
        {
            if (ItemDataProcess.type == bookType)
            {
                return returnAllBook(id);
            }
            else if (ItemDataProcess.type == journalType)
            {
                return returnAllJournal(id);
            }
            else if (ItemDataProcess.type == newspaperType)
            {
                return returnAllNewspaper(id);
            }
            else if (ItemDataProcess.type == videoType)
            {
                return returnAllVideo(id);
            }
            return null;
        }

        protected string returnItemState(string State)
        {
            if (State == "0")
            {
                return "Unavailable";
            }
            else
            {
                return "Available";
            }
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditRow")
            {
                int rowIndex = ((GridViewRow)((LinkButton)e.CommandSource).NamingContainer).RowIndex;
                GridViewAdminDistinct.EditIndex = rowIndex;
                FillGridView();
            }
            else if (e.CommandName == "DeleteRow")
            {
                if (ItemDataProcess.type == bookType)
                {
                    ItemDataProcess.DeleteBookByID(Convert.ToInt32(e.CommandArgument));
                }
                else if (ItemDataProcess.type == journalType)
                {
                    ItemDataProcess.DeleteJournalByID(Convert.ToInt32(e.CommandArgument));
                }
                else if (ItemDataProcess.type == newspaperType)
                {
                    ItemDataProcess.DeleteNewspaperByID(Convert.ToInt32(e.CommandArgument));
                }
                else if (ItemDataProcess.type == videoType)
                {
                    ItemDataProcess.DeleteVideoByID(Convert.ToInt32(e.CommandArgument));
                }
                FillGridView();
            }
            else if (e.CommandName == "CancelUpdate")
            {
                GridViewAdminDistinct.EditIndex = -1;
                FillGridView();
            }
            else if (e.CommandName == "UpdateRow")
            {
                int rowIndex = ((GridViewRow)((LinkButton)e.CommandSource).NamingContainer).RowIndex;
                Item item = new Item();

                item.Name = ((TextBox)GridViewAdminDistinct.Rows[rowIndex].FindControl("TextBoxDistinctItemName")).Text;
                String state = ((DropDownList)GridViewAdminDistinct.Rows[rowIndex].FindControl("ddlDistinctItemState")).SelectedValue;
                if (state == "Available")
                {
                    item.State = 1;
                }
                else if (state == "Unavailable")
                {

                    item.State = 0;
                }

                item.ProductionDate = deConvertDate(((TextBox)GridViewAdminDistinct.Rows[rowIndex].FindControl("TextBoxDistinctItemProductionDate")).Text);//Date aldıktan sonra işlem yapppppp.....
                item.CategoryId = ItemDataProcess.getCategoryIDByName(((DropDownList)GridViewAdminDistinct.Rows[rowIndex].FindControl("ddlDistinctItemCategory")).SelectedItem.Text);
                item.PublisherId = ItemDataProcess.getPublisherIDByName(((DropDownList)GridViewAdminDistinct.Rows[rowIndex].FindControl("ddlDistinctItemPublisher")).SelectedItem.Text);
                item.Type = ((Label)GridViewAdminDistinct.Rows[rowIndex].FindControl("LabelDistinctEditType")).Text;
                if (ItemDataProcess.type == bookType)
                {
                    Book book = new Book();
                    book.BookId = Convert.ToInt32(e.CommandArgument);
                    book.Author = ((TextBox)GridViewAdminDistinct.Rows[rowIndex].FindControl("TextBoxDistinctItemKolon")).Text;
                    item.ItemId = ItemDataProcess.getBookByBookId(book.BookId).ItemId;
                    ItemDataProcess.UpdateItems(item);
                    book.ItemId = ItemDataProcess.getItemIdByItemName(item.Name);
                    ItemDataProcess.UpdateBook(book);
                }
                else if (ItemDataProcess.type == journalType)
                {
                    Journal journal = new Journal();
                    journal.JournalId = Convert.ToInt32(e.CommandArgument);
                    journal.TimeRange = ((TextBox)GridViewAdminDistinct.Rows[rowIndex].FindControl("TextBoxDistinctItemKolon")).Text;
                    item.ItemId = ItemDataProcess.getJournalByJournalId(journal.JournalId).ItemId;
                    ItemDataProcess.UpdateItems(item);
                    journal.ItemId = ItemDataProcess.getItemIdByItemName(item.Name);
                    ItemDataProcess.UpdateJournal(journal);
                }
                else if (ItemDataProcess.type == newspaperType)
                {
                    Newspaper news = new Newspaper();
                    news.NewspaperId = Convert.ToInt32(e.CommandArgument);
                    news.Period = ((TextBox)GridViewAdminDistinct.Rows[rowIndex].FindControl("TextBoxDistinctItemKolon")).Text;
                    item.ItemId = ItemDataProcess.getNewspaperByNewspaperId(news.NewspaperId).ItemId;
                    ItemDataProcess.UpdateItems(item);
                    news.ItemId = ItemDataProcess.getItemIdByItemName(item.Name);
                    ItemDataProcess.UpdateNewspaper(news);
                }
                else if (ItemDataProcess.type == videoType)
                {
                    Video video = new Video();
                    video.VideoId = Convert.ToInt32(e.CommandArgument);
                    video.Format = ((TextBox)GridViewAdminDistinct.Rows[rowIndex].FindControl("TextBoxDistinctItemKolon")).Text;
                    item.ItemId = ItemDataProcess.getVideoByVideoId(video.VideoId).ItemId;
                    ItemDataProcess.UpdateItems(item);
                    video.ItemId = ItemDataProcess.getItemIdByItemName(item.Name);
                    ItemDataProcess.UpdateVideo(video);
                }


                GridViewAdminDistinct.EditIndex = -1;

                FillGridView();
            }
            else if (e.CommandName == "InsertRow")
            {
                Item item = new Item();
                item.Name = ((TextBox)GridViewAdminDistinct.FooterRow.FindControl("txtDistinctName")).Text;
                String state = ((DropDownList)GridViewAdminDistinct.FooterRow.FindControl("ddlDistinctItemInsertState")).SelectedValue;
                if (state == "Available")
                {
                    item.State = 1;
                }
                else if (state == "Unavailable")
                {

                    item.State = 0;
                }
                string date = ((DropDownList)GridViewAdminDistinct.FooterRow.FindControl("ddlDistinctItemYear")).Text + ((DropDownList)GridViewAdminDistinct.FooterRow.FindControl("ddlDistinctItemMonth")).Text.PadLeft(2, '0') + ((DropDownList)GridViewAdminDistinct.FooterRow.FindControl("ddlDistinctItemDay")).Text.PadLeft(2, '0');
                item.ProductionDate = date;
                item.CategoryId = ItemDataProcess.getCategoryIDByName(((DropDownList)GridViewAdminDistinct.FooterRow.FindControl("ddlDistinctFooterItemCategory")).SelectedItem.Text);
                item.PublisherId = ItemDataProcess.getPublisherIDByName(((DropDownList)GridViewAdminDistinct.FooterRow.FindControl("ddlDistinctFooterItemPublisher")).SelectedItem.Text);
                string types = returnPrimaryKey();
                item.Type = types.Substring(0, types.Length - 2);

                if (ItemDataProcess.type == bookType)
                {
                    Book book = new Book();
                    book.Author = ((TextBox)GridViewAdminDistinct.FooterRow.FindControl("txtDistinctKolon")).Text;
                    ItemDataProcess.InsertItems(item);
                    book.ItemId = ItemDataProcess.getItemIdByItemName(item.Name);
                    ItemDataProcess.InsertBook(book);
                }
                else if (ItemDataProcess.type == journalType)
                {
                    Journal jor = new Journal();
                    jor.TimeRange = ((TextBox)GridViewAdminDistinct.FooterRow.FindControl("txtDistinctKolon")).Text;
                    ItemDataProcess.InsertItems(item);
                    jor.ItemId = ItemDataProcess.getItemIdByItemName(item.Name);
                    ItemDataProcess.InsertJournal(jor);
                }
                else if (ItemDataProcess.type == newspaperType)
                {
                    Newspaper news = new Newspaper();
                    news.Period = ((TextBox)GridViewAdminDistinct.FooterRow.FindControl("txtDistinctKolon")).Text;
                    ItemDataProcess.InsertItems(item);
                    news.ItemId = ItemDataProcess.getItemIdByItemName(item.Name);
                    ItemDataProcess.InsertNewspaper(news);
                }
                else if (ItemDataProcess.type == videoType)
                {
                    Video video = new Video();
                    video.Format = ((TextBox)GridViewAdminDistinct.FooterRow.FindControl("txtDistinctKolon")).Text;
                    ItemDataProcess.InsertItems(item);
                    video.ItemId = ItemDataProcess.getItemIdByItemName(item.Name);
                    ItemDataProcess.InsertVideo(video);
                }
                FillGridView();
            }
            else if (e.CommandName == "Rent")/*Kiralama Kısmı*/
            {
                User user = (User)Session["AuthenticatedUserData"];
                Item item = new Item();
                int id = Convert.ToInt16(e.CommandArgument);//book ise bookId, video ise video id .....

                string[] tempItem = new string[10];
                if (ItemDataProcess.type == bookType)
                {
                    tempItem = ItemDataProcess.getBookByItemId(id);
                }
                else if (ItemDataProcess.type == journalType)
                {
                    tempItem = ItemDataProcess.getJournalByItemId(id);
                }
                else if (ItemDataProcess.type == newspaperType)
                {
                    tempItem = ItemDataProcess.getNewspaperByItemId(id);
                }
                else if (ItemDataProcess.type == videoType)
                {
                    tempItem = ItemDataProcess.getVideoByItemId(id);
                }
                item.ItemId = Convert.ToInt32(tempItem[0]);
                item.Name = tempItem[1];
                item.State = Convert.ToInt32(tempItem[2]);
                item.ProductionDate = tempItem[3];
                item.CategoryId = Convert.ToInt32(tempItem[4]);
                item.PublisherId = Convert.ToInt32(tempItem[5]);
                item.Type = tempItem[6];
                Borrow borrow = new Borrow();
                borrow.ItemId = item.ItemId;
                borrow.UserId = user.UserId;
                string dateReceive = "";
                string dateReturn = "";
                string[] temp = DateTime.Now.ToShortDateString().Split('-');
                dateReceive = temp[2] + temp[1].PadLeft(2, '0') + temp[0].PadLeft(2, '0');
                int day = Convert.ToInt32(temp[0]) + 7;
                int month = Convert.ToInt32(temp[1]);
                int year = Convert.ToInt32(temp[2]);
                if (day > 30)
                {
                    day = day % 30;
                    month++;
                }
                if (month > 12)
                {
                    month = month % 12;
                    year++;
                }
                dateReturn = year + month.ToString().PadLeft(2, '0') + day.ToString().PadLeft(2, '0');
                borrow.ReceiveDate = dateReceive;
                borrow.ReturnDate = dateReturn;
                BorrowDataProcess.InsertBorrow(borrow);
                Response.Redirect("BorrowList.aspx");
            }
        }

        protected string convertDate(string date)
        {
            string[] rDate = date.Split('-');
            date = "";
            date = rDate[0] + "/" + rDate[1] + "/" + rDate[2];
            return date;
        }

        protected string deConvertDate(string date)
        {
            date = date.Substring(0, 10);
            string[] rDate = date.Split('-');
            date = "";
            date = rDate[2] + rDate[1] + rDate[0];
            return date;
        }

        protected string getCurrentTime()
        {
            string date = "";
            string[] temp = DateTime.Now.ToShortDateString().Split('-');
            date = temp[2] + temp[1] + temp[0];
            return date;
        }

        protected string returnPrimaryKey()
        {
            string retVal = "";
            if (ItemDataProcess.type == itemType)
            {
                retVal = "ItemId";
            }
            else if (ItemDataProcess.type == bookType)
            {
                retVal = "BookId";
            }
            else if (ItemDataProcess.type == journalType)
            {
                retVal = "JournalId";
            }
            else if (ItemDataProcess.type == newspaperType)
            {
                retVal = "NewspaperId";
            }
            else if (ItemDataProcess.type == videoType)
            {
                retVal = "VideoId";
            }
            return retVal;
        }

        protected string returnTypeColumn()
        {
            string retVal = "";
            if (ItemDataProcess.type == bookType)
            {
                retVal = "Author";
            }
            else if (ItemDataProcess.type == journalType)
            {
                retVal = "TimeRange";
            }
            else if (ItemDataProcess.type == newspaperType)
            {
                retVal = "Period";
            }
            else if (ItemDataProcess.type == videoType)
            {
                retVal = "Format";
            }
            return retVal;
        }

        private void GridViewDataBind()
        {

            if (ItemDataProcess.type == itemType)
            {
                if (Session["AuthenticatedAdminData"] != null)
                {
                    GridViewAdmin.DataSource = ItemDataProcess.GetItems(); //Görüldüğü gibi GridView’e DataSet nesnesi atanıyor.
                    GridViewAdmin.DataBind();//this.DataBind() değil GridView’in DataBind()’i çağrıldı
                }
                else
                {
                    GridViewUser.DataSource = ItemDataProcess.GetItems(); //Görüldüğü gibi GridView’e DataSet nesnesi atanıyor.
                    GridViewUser.DataBind();//this.DataBind() değil GridView’in DataBind()’i çağrıldı
                }

            }
            else if (ItemDataProcess.type == bookType)
            {
                if (Session["AuthenticatedAdminData"] != null)
                {
                    GridViewAdminDistinct.DataSource = ItemDataProcess.GetBooks(); //Görüldüğü gibi GridView’e DataSet nesnesi atanıyor.
                    GridViewAdminDistinct.DataBind();
                }
                else
                {
                    GridViewUserDistinct.DataSource = ItemDataProcess.GetBooks(); //Görüldüğü gibi GridView’e DataSet nesnesi atanıyor.
                    GridViewUserDistinct.DataBind();
                }
            }
            else if (ItemDataProcess.type == journalType)
            {
                if (Session["AuthenticatedAdminData"] != null)
                {
                    GridViewAdminDistinct.DataSource = ItemDataProcess.GetJournals(); //Görüldüğü gibi GridView’e DataSet nesnesi atanıyor.
                    GridViewAdminDistinct.DataBind();
                }
                else
                {
                    GridViewUserDistinct.DataSource = ItemDataProcess.GetJournals(); //Görüldüğü gibi GridView’e DataSet nesnesi atanıyor.
                    GridViewUserDistinct.DataBind();
                }
            }
            else if (ItemDataProcess.type == newspaperType)
            {
                if (Session["AuthenticatedAdminData"] != null)
                {
                    GridViewAdminDistinct.DataSource = ItemDataProcess.GetNewspapers(); //Görüldüğü gibi GridView’e DataSet nesnesi atanıyor.
                    GridViewAdminDistinct.DataBind();
                }
                else
                {
                    GridViewUserDistinct.DataSource = ItemDataProcess.GetNewspapers(); //Görüldüğü gibi GridView’e DataSet nesnesi atanıyor.
                    GridViewUserDistinct.DataBind();
                }
            }
            else if (ItemDataProcess.type == videoType)
            {
                if (Session["AuthenticatedAdminData"] != null)
                {
                    GridViewAdminDistinct.DataSource = ItemDataProcess.GetVideos(); //Görüldüğü gibi GridView’e DataSet nesnesi atanıyor.
                    GridViewAdminDistinct.DataBind();
                }
                else
                {
                    GridViewUserDistinct.DataSource = ItemDataProcess.GetVideos(); //Görüldüğü gibi GridView’e DataSet nesnesi atanıyor.
                    GridViewUserDistinct.DataBind();
                }
            }


        }

        private void FillGridView()
        {
            GridViewDataBind();
            FillCategories();
            FillPublishers();
            FillDate();
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            if (ItemDataProcess.type == itemType)
            {
                if (Session["AuthenticatedAdminData"] != null)
                {
                    GridViewAdmin.PageIndex = e.NewPageIndex;
                }
                else
                {
                    GridViewUser.PageIndex = e.NewPageIndex;
                }

            }
            else if (ItemDataProcess.type == bookType || ItemDataProcess.type == journalType || ItemDataProcess.type == newspaperType || ItemDataProcess.type == videoType)
            {
                if (Session["AuthenticatedAdminData"] != null)//Adminse
                {
                    GridViewAdminDistinct.PageIndex = e.NewPageIndex;
                }
                else
                {
                    GridViewUserDistinct.PageIndex = e.NewPageIndex;
                }


            }
            FillGridView();
        }

        protected void ListBooks_CheckedChanged(object sender, EventArgs e)
        {
            if (CheckBoxListBooks.Checked == true)
            {
                ItemDataProcess.type = bookType;
                GridViewAdmin.Visible = false;
                GridViewUser.Visible = false;
                GridViewAdminDistinct.Visible = true;
                GridViewUserDistinct.Visible = true;
                CheckBoxListAll.Checked = false;
                CheckBoxListJournals.Checked = false;
                CheckBoxListNewspapers.Checked = false;
                CheckBoxListVideos.Checked = false;
                FillGridView();
            }
        }

        protected void ListJournals_CheckedChanged(object sender, EventArgs e)
        {
            if (CheckBoxListJournals.Checked == true)
            {
                ItemDataProcess.type = journalType;
                GridViewAdmin.Visible = false;
                GridViewUser.Visible = false;
                GridViewAdminDistinct.Visible = true;
                GridViewUserDistinct.Visible = true;
                CheckBoxListBooks.Checked = false;
                CheckBoxListAll.Checked = false;
                CheckBoxListNewspapers.Checked = false;
                CheckBoxListVideos.Checked = false;
                FillGridView();
            }
        }

        protected void ListNewspapers_CheckedChanged(object sender, EventArgs e)
        {
            if (CheckBoxListNewspapers.Checked == true)
            {
                ItemDataProcess.type = newspaperType;
                GridViewAdmin.Visible = false;
                GridViewUser.Visible = false;
                GridViewAdminDistinct.Visible = true;
                GridViewUserDistinct.Visible = true;
                CheckBoxListBooks.Checked = false;
                CheckBoxListAll.Checked = false;
                CheckBoxListJournals.Checked = false;
                CheckBoxListVideos.Checked = false;
                FillGridView();
            }
        }

        protected void ListVideos_CheckedChanged(object sender, EventArgs e)
        {
            if (CheckBoxListVideos.Checked == true)
            {
                ItemDataProcess.type = videoType;
                GridViewAdmin.Visible = false;
                GridViewUser.Visible = false;
                GridViewAdminDistinct.Visible = true;
                GridViewUserDistinct.Visible = true;
                CheckBoxListBooks.Checked = false;
                CheckBoxListAll.Checked = false;
                CheckBoxListJournals.Checked = false;
                CheckBoxListNewspapers.Checked = false;
                FillGridView();
            }
        }

        protected void ListAll_CheckedChanged(object sender, EventArgs e)
        {
            if (CheckBoxListAll.Checked == true)
            {
                ItemDataProcess.type = itemType;
                GridViewAdminDistinct.Visible = false;
                GridViewUserDistinct.Visible = false;
                GridViewAdmin.Visible = true;
                GridViewUser.Visible = true;
                CheckBoxListBooks.Checked = false;
                CheckBoxListJournals.Checked = false;
                CheckBoxListNewspapers.Checked = false;
                CheckBoxListVideos.Checked = false;
                FillGridView();
            }
        }
    }
}