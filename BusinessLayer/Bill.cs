using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLayer
{
    public class Bill
    {
        private int billId;

        public int BillId
        {
            get { return billId; }
            set { billId = value; }
        }
        private string billValue;

        public string BillValue
        {
            get { return billValue; }
            set { billValue = value; }
        }
        private int memberID;

        public int MemberID
        {
            get { return memberID; }
            set { memberID = value; }
        }
        private int itemID;

        public int ItemID
        {
            get { return itemID; }
            set { itemID = value; }
        }
        private string billDate;

        public string BillDate
        {
            get { return billDate; }
            set { billDate = value; }
        }
    }
}
