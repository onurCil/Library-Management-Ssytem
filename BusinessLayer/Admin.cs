using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLayer
{
    public class Admin
    {
        private int adminId;

        public int AdminId
        {
            get { return adminId; }
            set { adminId = value; }
        }
        private int workHour;

        public int WorkHour
        {
            get { return workHour; }
            set { workHour = value; }
        }
        private int authentication;

        public int Authentication
        {
            get { return authentication; }
            set { authentication = value; }
        }
        private int userId;

        public int UserId
        {
            get { return userId; }
            set { userId = value; }
        }
    }
}
