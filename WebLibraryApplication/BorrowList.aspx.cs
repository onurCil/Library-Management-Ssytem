using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLayer;

namespace WebLibraryApplication
{
    public partial class BorrowList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                GridViewDataBind();
            }
        }

        private void GridViewDataBind()
        {
            User user = (User)Session["AuthenticatedUserData"];
            if (user != null)
            {
                GridViewAdmin.DataSource = BorrowDataProcess.GetUserBorrows(user.UserId); //Görüldüğü gibi GridView’e DataSet nesnesi atanıyor.
                GridViewAdmin.DataBind();//this.DataBind() değil GridView’in DataBind()’i çağrıldı  
            }
            else
            {
                GridViewAdmin.DataSource = BorrowDataProcess.GetBorrows(); //Görüldüğü gibi GridView’e DataSet nesnesi atanıyor.
                GridViewAdmin.DataBind();//this.DataBind() değil GridView’in DataBind()’i çağrıldı    
            }
        }

        protected bool selectBorrowForReturn(Borrow borrow)
        {

            return false;
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridViewAdmin.PageIndex = e.NewPageIndex;
            GridViewDataBind();
        }
        protected string returnUserName(int userID)
        {
            User user = UserDataProcess.getUserByID(userID);
            return user.NickName;
        }

        protected string returnItemName(int itemID)
        {
            Item item = ItemDataProcess.getItemByID(itemID);
            return item.Name;
        }

        protected void GridViewAdmin_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            User user = (User)Session["AuthenticatedUserData"];
            if (e.CommandName == "ExtendTime")
            {
                int rowIndex = ((GridViewRow)((LinkButton)e.CommandSource).NamingContainer).RowIndex;
                GridViewAdmin.EditIndex = rowIndex;
                GridViewAdmin.DataSource = BorrowDataProcess.GetUserBorrows(user.UserId); //Görüldüğü gibi GridView’e DataSet nesnesi atanıyor.
                GridViewAdmin.DataBind();//this.DataBind() değil GridView’in DataBind()’i çağrıldı 
            }
            else if (e.CommandName == "Extend")
            {
                int rowIndex = ((GridViewRow)((LinkButton)e.CommandSource).NamingContainer).RowIndex;
                String Returndate = ((DropDownList)GridViewAdmin.Rows[rowIndex].FindControl("ddlReturnTime")).SelectedValue;
                String RecieveDate = ((Label)GridViewAdmin.Rows[rowIndex].FindControl("LabelRecieve")).Text;
                String name = ((Label)GridViewAdmin.Rows[rowIndex].FindControl("LabelUserName")).Text;
                String itemName = ((Label)GridViewAdmin.Rows[rowIndex].FindControl("LabelEditName")).Text;
                int userId = BorrowDataProcess.getUserIdByNickName(name).UserId;
                int itemId = ItemDataProcess.getItemIdByItemName(itemName);
                Borrow borrow = new Borrow();

                string oldDate = (e.CommandArgument).ToString().Substring(0, 10);
                string[] tempDate = oldDate.Split('.');
                int coeff = Convert.ToInt32(Returndate.Split(' ')[0]);

                int day = Convert.ToInt32(tempDate[0]) + (coeff * 7);
                int month = Convert.ToInt32(tempDate[1]);
                int year = Convert.ToInt32(tempDate[2]);
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

                Returndate = year.ToString() + month.ToString().PadLeft(2, '0') + day.ToString().PadLeft(2, '0');
                borrow.ReturnDate = Returndate.ToString();
                borrow.UserId = userId;
                borrow.ItemId = itemId;
                BorrowDataProcess.UpdateBorrow(borrow);
                GridViewAdmin.EditIndex = -1;
                GridViewAdmin.DataSource = BorrowDataProcess.GetUserBorrows(user.UserId); //Görüldüğü gibi GridView’e DataSet nesnesi atanıyor.
                GridViewAdmin.DataBind();//this.DataBind() değil GridView’in DataBind()’i çağrıldı 

            }
            else if (e.CommandName == "ReturnItem")
            {
                int rowIndex = ((GridViewRow)((LinkButton)e.CommandSource).NamingContainer).RowIndex;
                String Returndate = ((Label)GridViewAdmin.Rows[rowIndex].FindControl("LabelReturn")).Text;
                String name = ((Label)GridViewAdmin.Rows[rowIndex].FindControl("LabelUserName")).Text;
                String itemName = ((Label)GridViewAdmin.Rows[rowIndex].FindControl("LabelName")).Text;
                String RecieveDate = ((Label)GridViewAdmin.Rows[rowIndex].FindControl("LabelReceive")).Text;

                int userId = BorrowDataProcess.getUserIdByNickName(name).UserId;
                int itemId = ItemDataProcess.getItemIdByItemName(itemName);
                int memberId = MemberDataProcess.getMemberByUserId(userId).MemberId;
                //controlReturning(RecieveDate,Returndate);
                string[] cRetDate = Returndate.Split('/');
                string tempRet = cRetDate[2] + cRetDate[1] + cRetDate[0];
                string[] cRecDate = RecieveDate.Split('/');
                string tempRec = cRecDate[2] + cRecDate[1] + cRecDate[0];

                Bill bill = new Bill();
                string[] temp = DateTime.Now.ToShortDateString().Split('/');
                bill.BillDate = temp[2] + temp[1] + temp[0];
                bill.ItemID = itemId;
                bill.MemberID = memberId;
                
                bill.BillValue = calculateBillValue(tempRet).ToString();

                BorrowDataProcess.InsertBill(bill);
                Response.Redirect("HomeLibrary.aspx");

            }
            else if (e.CommandName == "CancelUpdate")
            {
                GridViewAdmin.EditIndex = -1;
                GridViewAdmin.DataSource = BorrowDataProcess.GetUserBorrows(user.UserId); //Görüldüğü gibi GridView’e DataSet nesnesi atanıyor.
                GridViewAdmin.DataBind();//this.DataBind() değil GridView’in DataBind()’i çağrıldı 
            }
        }

        private int calculateBillValue(string returnDate)//20110101  yyyymmdd
        {
            int value = 1;
            int year = Convert.ToInt32(returnDate.Substring(0, 4));
            int month = Convert.ToInt32(returnDate.Substring(4, 2));
            int day = Convert.ToInt32(returnDate.Substring(6, 2));
            string[] curDate = DateTime.Now.ToShortDateString().Split('/');
            int curDay = Convert.ToInt32(curDate[0]);/*25.12.2014*/
            int curMonth = Convert.ToInt32(curDate[1]);
            int curYear = Convert.ToInt32(curDate[2]);
                        int totalCur = curYear * 365 + curMonth * 30 + curDay;
            int totalRet = year * 365 + month * 30 + day;
            int fark = totalRet - totalCur;
            if (fark > 0)
            {
                value = fark + value;//geciktiği gün sayısı kadar 1tl fark parası alınıyor
            }
            return value;
        }

        protected bool controlExtendButton(string date)//28.02.2015
        {
            if ((User)Session["AuthenticatedUserData"] == null)
            {
                return false;
            }
            string[] curDate = DateTime.Now.ToShortDateString().Split('/');
            string[] retDate = date.Split('/');
            int curDay = Convert.ToInt32(curDate[0]);/*25.12.2014*/
            int curMonth = Convert.ToInt32(curDate[1]);
            int curYear = Convert.ToInt32(curDate[2]);

            int retDay = Convert.ToInt32(retDate[0]);/*28.02.2015*/
            int retMonth = Convert.ToInt32(retDate[1]);
            int retYear = Convert.ToInt32(retDate[2]);

            int totalCur = curYear * 365 + curMonth * 30 + curDay;
            int totalRet = retYear * 365 + retMonth * 30 + retDay;

            if (totalCur > totalRet)
            {
                return false;
            }
            else
            {
                return true;
            }
        }

        protected bool controlReturning(string receiveDate, string returnDate, int memberId,int itemId,string curDate)
        {
            if ((User)Session["AuthenticatedUserData"] == null)
            {
                return false;
            }
            if (receiveDate.Contains('/'))
            {
                string[] temp1 = receiveDate.Split('/');
                string[] temp2 = returnDate.Split('/');
                receiveDate = temp1[2] + temp1[1] + temp1[0];
                returnDate = temp2[2] + temp2[1] + temp2[0];
                string[] temp = DateTime.Now.ToShortDateString().Split('/');
                curDate = temp[2] + temp[1] + temp[0];
            }

            return BorrowDataProcess.controlBill(receiveDate, returnDate, memberId, itemId,curDate);
        }

        protected int convertUserIdToMemberId(int userId)
        {
            return MemberDataProcess.getMemberByUserId(userId).MemberId;
        }

        protected string returnCurDate()
        {
            string curDate = "";
            string[] temp = DateTime.Now.ToShortDateString().Split('/');
            curDate = temp[2] + temp[1] + temp[0];
            return curDate;
        }
    }
}