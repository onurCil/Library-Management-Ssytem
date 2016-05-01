using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataLayer;
using System.Data;

namespace BusinessLayer
{
    public class BorrowDataProcess
    {
        public static void InsertBorrow(Borrow borrow)//Insert
        {
            DBClass.InsertCommand("exec spInsertBORROW " + borrow.UserId + ", " + borrow.ItemId + ",'" + borrow.ReceiveDate + "', '" + borrow.ReturnDate + "'");
        }

        public static void InsertBill(Bill bill)//Insert
        {
            DBClass.InsertCommand("exec spInsertBILL '" + bill.BillValue + "'," + bill.MemberID + "," + bill.ItemID + ",'" + bill.BillDate + "'");
        }

        public static List<Bill> GetBills()//List
        {
            DataSet data = DBClass.SelectCommand("exec spGetBorrows");
            if (data.Tables[0].Rows.Count == 0)
            {
                return null;
            }
            else
            {
                List<Bill> bills = new List<Bill>();
                foreach (DataRow bill in data.Tables[0].Rows)
                {
                    bills.Add(new Bill
                    {
                        BillId = Convert.ToInt32(bill[0]),
                        BillValue = bill[1].ToString(),
                        MemberID = Convert.ToInt32(bill[2]),
                        ItemID = Convert.ToInt32(bill[3]),
                        BillDate = bill[4].ToString()
                    });
                }
                return bills;
            }
        }

        public static bool controlBill(string recDate, string retDate, int memberId,int itemId,string curDate)
        {


            DataSet data = DBClass.SelectCommand("exec controlBill '" + recDate + "','" + retDate + "', " + memberId + "," + itemId + ",'" + curDate + "'");
            if (data.Tables[0].Rows.Count == 0)
            {
                return true;//fatura henüz ödenmemiş(ödeyebilme = true)
            }
            else
            {
                return false;
            }
        }

        public static List<Borrow> GetBorrows()//List
        {
            DataSet data = DBClass.SelectCommand("exec spGetBorrows");
            if (data.Tables[0].Rows.Count == 0)
            {
                return null;
            }
            else
            {
                List<Borrow> borrows = new List<Borrow>();
                foreach (DataRow borrow in data.Tables[0].Rows)
                {
                    borrows.Add(new Borrow
                    {
                        UserId = Convert.ToInt32(borrow[0]),
                        ItemId = Convert.ToInt32(borrow[1]),
                        ReceiveDate = borrow[2].ToString(),
                        ReturnDate = borrow[3].ToString()
                    });
                }
                return borrows;
            }
        }

        public static void UpdateBorrow(Borrow borrow)//Update
        {
            DBClass.InsertCommand("exec spUpdateBORROW " + borrow.UserId + "," + borrow.ItemId + " , '" + borrow.ReturnDate + "'");
        }

        public static List<Borrow> GetUserBorrows(int id)//List
        {
            DataSet data = DBClass.SelectCommand("exec spGetUserBorrows " + id);
            if (data.Tables[0].Rows.Count == 0)
            {
                return null;
            }
            else
            {
                List<Borrow> borrows = new List<Borrow>();
                foreach (DataRow borrow in data.Tables[0].Rows)
                {
                    borrows.Add(new Borrow
                    {
                        UserId = Convert.ToInt32(borrow[0]),
                        ItemId = Convert.ToInt32(borrow[1]),
                        ReceiveDate = borrow[2].ToString(),
                        ReturnDate = borrow[3].ToString()
                    });
                }
                return borrows;
            }
        }

        public static void DeleteBorrowByUserID(int userId)//Delete by ID
        {
            DBClass.InsertCommand("exec spDeleteBORROWbyUserID " + userId);
        }

        public static User getUserIdByNickName(string nickName)
        {
            DataSet data = DBClass.SelectCommand("exec spGetUserByNickName '" + nickName + "'");
            if (data.Tables[0].Rows.Count == 0)
            {
                return null;
            }
            else
            {
                DataRow row = data.Tables[0].Rows[0];
                User user = new User();
                user.UserId = Convert.ToInt16(row[0].ToString());
                user.Name = row[1].ToString();
                user.Gender = row[2].ToString();
                user.Address = row[3].ToString();
                user.Password = row[4].ToString();
                user.NickName = row[5].ToString();
                user.IsOnline = Convert.ToBoolean(row[6]);
                user.Mail = row[7].ToString();
                return user;
            }
        }
    }
}
