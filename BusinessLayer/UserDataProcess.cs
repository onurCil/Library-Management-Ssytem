using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataLayer;

namespace BusinessLayer
{
    public class UserDataProcess
    {
        public static List<User> GetUsers()//List
        {
            DataSet data = DBClass.SelectCommand("exec spSelectUSER");
            if (data.Tables[0].Rows.Count == 0)
            {
                return null;
            }
            else
            {
                List<User> users = new List<User>();
                foreach (DataRow user in data.Tables[0].Rows)
                {
                    bool active = false;
                    if (Convert.ToInt32(user[6]) == 1)
                    {
                        active = true;
                    }
                    users.Add(new User
                    {
                        UserId = Convert.ToInt32(user[0]),
                        Name = user[1].ToString(),
                        Gender = user[2].ToString(),
                        Address = user[3].ToString(),
                        Password = user[4].ToString(),
                        NickName = user[5].ToString(),
                        IsOnline = active,
                        Mail = user[7].ToString()
                    });
                }
                return users;
            }
        }

        public static User getUserByID(int id)
        {
            User user = new User();
            DataSet data = DBClass.SelectCommand("exec spGetUserByID " + id);
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

        public static User controlUser(string nick,string password)
        {
            User user = new User();
            DataSet data = DBClass.SelectCommand("exec spControlUser '" + nick +"','"+password+"'");
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

        public static void InsertUser(User user)//Insert
        {
            DBClass.InsertCommand("exec spInsertUSER '" + user.Name + "','" + user.Gender + "','" + user.Address + "','" + user.Password + "', '" + user.NickName + "'," + user.IsOnline + ",'" + user.Mail + "'");
        }
        public static void DeleteUserByID(int id)//Delete by ID
        {
            DBClass.InsertCommand("exec spDeleteUSERbyID " + id);
        }
        public static void UpdateUsers(User user)//Update
        {
            DBClass.InsertCommand("exec spUpdateUSER " + user.UserId + ",'" + user.Name + "','" + user.Gender + "','" + user.Address + "','" + user.Password + "','" + user.NickName + "'," + user.IsOnline + ",'" + user.Mail + "'");
        }
        public static void UpdateUserOnline(int userId, bool isOnline)//Update
        {
            DBClass.InsertCommand("exec spUpdateUserOnline " + userId + "," + isOnline);
        }

    }
}
