using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BLL
{
    public class Users
    {
        public int Uid { get; set; }
        public string UserId{ get; set; }
        public string UserName { get; set; }
        public string Password { get; set; }
        public int IsAdmin { get; set; }
        public string Phone {  get; set; }
        public int status { get; set; }
        public string AddDate { get; set; }

        public static List<Users> GetAll()
        {
            return UsersDAL.GetAll();
        }

        public static Users GetById(int id)
        {
            return UsersDAL.GetById(id);
        }

        public void Save()
        {
            UsersDAL.Save(this);
        }

    }
}