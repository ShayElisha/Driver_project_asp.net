using System;
using System.Collections.Generic;
using System.Data;
using BLL;
using DATA;

namespace DAL
{
    public class UsersDAL : Users
    {
        public static List<Users> GetAll()
        {
            DbContext Db = new DbContext(); // יצירת אובייקט מסוג גישה לבסיס נתונים
            string sql = "select * from T_Users"; // הגדרת משפט שאילתה
            DataTable Dt = Db.Execute(sql); // הפעלת השאילתה וקבלת התוצאות לטבלת נתונים
            List<Users> users = new List<Users>();

            for (int i = 0; i < Dt.Rows.Count; i++)
            {
                Users C = new Users();

                if (int.TryParse(Dt.Rows[i]["Uid"].ToString(), out int uid))
                {
                    C.Uid = uid ;
                }
                C.UserId = Dt.Rows[i]["UserId"].ToString();
                C.UserName = Dt.Rows[i]["UserName"].ToString();
                C.Password = Dt.Rows[i]["Password"].ToString();

                if (int.TryParse(Dt.Rows[i]["IsAdmin"].ToString(), out int isAdmin))
                {
                    C.IsAdmin = isAdmin;
                }

                C.Phone = Dt.Rows[i]["Phone"].ToString();

                if (int.TryParse(Dt.Rows[i]["status"].ToString(), out int status))
                {
                    C.status = status;
                }

                C.AddDate = Dt.Rows[i]["AddDate"].ToString();

                users.Add(C);
            }
            Db.Close();
            return users;
        }

        public static Users GetById(int Id)
        {
            DbContext Db = new DbContext(); // יצירת אובייקט מסוג גישה לבסיס נתונים
            string sql = $"select * from T_Users where Uid={Id}"; // הגדרת משפט שאילתה
            DataTable Dt = Db.Execute(sql); // הפעלת השאילתה וקבלת התוצאות לטבלת נתונים
            Users Clients = null;
            if (Dt.Rows.Count > 0)
            {
                Clients = new Users()
                {
                    Uid = int.Parse(Dt.Rows[0]["Uid"]+"") ,
                    UserName = Dt.Rows[0]["UserName"] + "",
                    Password = Dt.Rows[0]["Password"] + "",
                    IsAdmin = int.Parse(Dt.Rows[0]["IsAdmin"] + ""),
                    Phone = Dt.Rows[0]["Phone"] + "",
                    status = int.Parse(Dt.Rows[0]["status"] + ""),
                    AddDate = Dt.Rows[0]["AddDate"] + "",
                };
            }
            Db.Close();
            return Clients;
        }

        public static void Save(Users Client)
        {
            string sql = "";
            if (Client.Uid == -1)
            {

                sql = "insert into T_Users(UserId, UserName, Password, IsAdmin, Phone, status) values ";
                sql += $"(N'{Client.UserId}', N'{Client.UserName}', N'{Client.Password}', {Client.IsAdmin}, N'{Client.Phone}', {Client.status})";
            }
            else
            {
                sql = "update T_Users set ";
                sql += $"UserId=N'{Client.UserId}', ";
                sql += $"UserName=N'{Client.UserName}', ";
                sql += $"Password=N'{Client.Password}', ";
                sql += $"IsAdmin={Client.IsAdmin}, ";
                sql += $"Phone=N'{Client.Phone}', ";
                sql += $"status={Client.status} ";
                sql += $"where Uid=N'{Client.Uid}'";
            }

            DbContext Db = new DbContext();
            Db.ExecuteNonQuery(sql);
        }
       
    }
}
