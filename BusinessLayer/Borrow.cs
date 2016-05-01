using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLayer
{
    public class Borrow
    {
        private int userId;

        public int UserId
        {
            get { return userId; }
            set { userId = value; }
        }
        private int itemId;

        public int ItemId
        {
            get { return itemId; }
            set { itemId = value; }
        }
        private string receiveDate;

        public string ReceiveDate
        {
            get { return receiveDate; }
            set { receiveDate = value; }
        }
        private string returnDate;

        public string ReturnDate
        {
            get { return returnDate; }
            set { returnDate = value; }

        }
    }
}
