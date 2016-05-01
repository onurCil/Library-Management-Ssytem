using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
namespace BusinessLayer
{
    public class Member
    {
        private int memberId;

        public int MemberId
        {
            get { return memberId; }
            set { memberId = value; }
        }
        private string facultyName;

        public string FacultyName
        {
            get { return facultyName; }
            set { facultyName = value; }
        }

        private string memberType;

        public string MemberType
        {
            get { return memberType; }
            set { memberType = value; }
        }

        private int userId;

        public int UserId
        {
            get { return userId; }
            set { userId = value; }
        }
        private bool isActive;

        public bool IsActive
        {
            get { return isActive; }
            set { isActive = value; }
        }

    }
}

