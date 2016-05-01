using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataLayer;
using System.Data;

namespace BusinessLayer
{
    public class AdminDataProcess
    {
        public static User controlAdmin(string nick, string password)
        {
            User user = new User();
            DataSet data = DBClass.SelectCommand("exec spControlAdmin '" + nick + "','" + password + "'");
            if (data.Tables[0].Rows.Count == 0)
            {
                return null;
            }
            else
            {
                DataRow row = data.Tables[0].Rows[0];
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

        public static List<Admin> GetAdmins()//List
        {
            DataSet data = DBClass.SelectCommand("exec spSelectADMIN");
            if (data.Tables[0].Rows.Count == 0)
            {
                return null;
            }
            else
            {
                List<Admin> admins = new List<Admin>();
                foreach (DataRow admin in data.Tables[0].Rows)
                {
                    admins.Add(new Admin
                    {
                        AdminId = Convert.ToInt32(admin[0]),
                        WorkHour = Convert.ToInt32(admin[1]),
                        UserId = Convert.ToInt32(admin[2])
                    });
                }
                return admins;
            }
        }
        public static void DeleteAdminByID(int id)//Delete by ID
        {
            DBClass.InsertCommand("exec spDeleteADMINbyID " + id);
        }
        public static int getUserIdByAdminId(int adminId)
        {
            DataSet data = DBClass.SelectCommand("exec spGetUserByAdminId " + adminId);
            if (data.Tables[0].Rows.Count == 0)
            {
                return 0;
            }
            else
            {
                User user = new User();

                DataRow row = data.Tables[0].Rows[0];
                return Convert.ToInt32(row[2].ToString());
            }
        }
        public static void UpdateAdmins(Admin admin)//Update
        {
            DBClass.InsertCommand("exec spUpdateADMIN " + admin.AdminId + "," + admin.WorkHour + "," + admin.UserId);
        }
        public static int getUserIdByNickName(string nickName)
        {
            DataSet data = DBClass.SelectCommand("exec spUserIdByName '" + nickName + "'");
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
        public static void InsertAdmin(Admin admin)//Insert
        {
            DBClass.InsertCommand("exec spInsertADMIN " + admin.WorkHour + "," + admin.UserId);
        }
    }
}
