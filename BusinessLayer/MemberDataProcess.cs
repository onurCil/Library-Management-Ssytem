using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataLayer;

namespace BusinessLayer
{
    public class MemberDataProcess
    {
        public static List<Member> GetMembers()//List
        {
            DataSet data = DBClass.SelectCommand("exec spSelectMEMBER");
            if (data.Tables[0].Rows.Count == 0)
            {
                return null;
            }
            else
            {
                List<Member> members = new List<Member>();
                foreach (DataRow member in data.Tables[0].Rows)
                {
                    bool active = false;
                    if (Convert.ToInt32(member[4]) == 1)
                    {
                        active = true;
                    }
                    members.Add(new Member
                    {
                        MemberId = Convert.ToInt32(member[0]),
                        FacultyName = member[1].ToString(),
                        MemberType = member[2].ToString(),
                        UserId = Convert.ToInt32(member[3]),
                        IsActive = active
                    });
                }
                return members;
            }
        }
        public static void InsertMember(Member member)//Insert
        {
            DBClass.InsertCommand("exec spInsertMEMBER '" + member.FacultyName + "','" + member.MemberType + "'," + member.UserId + "," + member.IsActive);
        }

        public static void DeleteBillByMemberID(int memberId)//Delete by ID
        {
            DBClass.InsertCommand("exec spDeleteBILLbyMemberID " + memberId);
        }

        public static void DeleteMemberByID(int id)//Delete by ID
        {
            DBClass.InsertCommand("exec spDeleteMEMBERbyID " + id);
        }
        public static void UpdateMembers(Member member)//Update
        {
            DBClass.InsertCommand("exec spUpdateMEMBER " + member.MemberId + ",'" + member.FacultyName + "','" + member.MemberType + "'," + member.UserId + "," + member.IsActive);
        }
        public static int getUserIdByNickName(string nickName)
        {
            DataSet data = DBClass.SelectCommand("exec spGetUserByNickName '" + nickName + "'");
            if (data.Tables[0].Rows.Count == 0)
            {
                return 0;
            }
            else
            {
                DataRow row = data.Tables[0].Rows[0];
                return Convert.ToInt32(row[0].ToString());
            }
        }
        public static int getUserIdByMemberId(int memberId)
        {
            DataSet data = DBClass.SelectCommand("exec spGetUserByMemberId " + memberId);
            if (data.Tables[0].Rows.Count == 0)
            {
                return 0;
            }
            else
            {
                User user = new User();

                DataRow row = data.Tables[0].Rows[0];
                return Convert.ToInt32(row[3].ToString());
            }
        }

        public static Member getMemberByUserId(int userId)
        {
            DataSet data = DBClass.SelectCommand("exec spGetMemberByUserId " + userId);
            if (data.Tables[0].Rows.Count == 0)
            {
                return null;
            }
            else
            {
                DataRow row = data.Tables[0].Rows[0];
                Member member = new Member();

                member.MemberId = Convert.ToInt32(row[0]);
                member.FacultyName = row[1].ToString();
                member.MemberType = row[2].ToString();
                member.UserId = Convert.ToInt32(row[3]);
                member.IsActive = Convert.ToBoolean(row[4]);

                return member;
            }
        }
    }
}
