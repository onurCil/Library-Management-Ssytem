using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLayer
{
    public class User
    {
        private int userId;

        public int UserId
        {
            get { return userId; }
            set { userId = value; }
        }
        private string name;

        public string Name
        {
            get { return name; }
            set { name = value; }
        }

        private string gender;

        public string Gender
        {
            get { return gender; }
            set { gender = value; }
        }
        private string address;

        public string Address
        {
            get { return address; }
            set { address = value; }
        }
        private string password;

        public string Password
        {
            get { return password; }
            set { password = value; }
        }
        private string nickName;

        public string NickName
        {
            get { return nickName; }
            set { nickName = value; }
        }
        private bool isOnline;

        public bool IsOnline
        {
            get { return isOnline; }
            set { isOnline = value; }
        }
        private string mail;

        public string Mail
        {
            get { return mail; }
            set { mail = value; }
        }

    }
}
