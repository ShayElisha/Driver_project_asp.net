using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using DAL;

namespace Delivery_Project.AdminManager
{
    public partial class UsersAddEdit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string Uid = Request["Uid"] + "";
                if (string.IsNullOrEmpty(Uid))
                {
                    Uid = "-1";
                }
                else
                {
                    int uId = int.Parse(Uid);
                    List<Users> Client = (List<Users>)Application["Clients"];
                    for (int i = 0; i < Client.Count; i++)
                    {
                        if (Client[i].Uid == uId)
                        {
                            userName.Text = Client[i].UserName;
                            password.Text = Client[i].Password;
                            isAdmin.Text = Client[i].IsAdmin + "";
                            STATUS.Text = Client[i].status + "";
                            hidCus.Value = Uid;
                        }
                    }
                }
            }
        }
        protected void BtnUser(object sender, EventArgs e)
        {
            Users Client = new Users();

            if (hidCus.Value == "-1")
            {
                if (IsUserIdExists(userId.Text))
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('תעודת הזהות כבר קיימת במערכת.');", true);
                    return;
                }
                Client.Uid = -1;
            }
            else
            {
                Client.Uid = int.Parse(hidCus.Value);
            }

            // בדיקה אם תעודת הזהות מכילה רק מספרים
            foreach (char c in userId.Text)
            {
                if (!char.IsDigit(c))
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('תעודת הזהות חייבת להכיל מספרים בלבד.');", true);
                    return;
                }
            }
            if (userId.Text.Length != 10)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('תעודת הזהות חייבת להכיל בדיוק 10 תווים.');", true);
                return;
            }
            // בדיקה אם מספר הטלפון עומד בתנאים הנדרשים
            if (phone.Text.Length != 10 || !phone.Text.StartsWith("05") || !IsDigitsOnly(phone.Text.Substring(2)))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('מספר הטלפון חייב להתחיל ב-050 עד 059 ואחר כך להכיל 7 ספרות.');", true);
                return;
            }
            Client.UserId = userId.Text;
            Client.UserName = userName.Text;
            Client.Password = password.Text;
            Client.IsAdmin = int.Parse(isAdmin.Text);
            Client.Phone = phone.Text;
            Client.status = int.Parse(STATUS.Text);

            Client.Save();

            Application["Clients"] = Users.GetAll();

            Response.Redirect("UsersList.aspx");
        }

        private bool IsDigitsOnly(string str)
        {
            foreach (char c in str)
            {
                if (!char.IsDigit(c))
                {
                    return false;
                }
            }
            return true;
        }
        private bool IsUserIdExists(string userId)
        {
            // כאן תתבצע בדיקה מול בסיס הנתונים כדי לוודא שתעודת הזהות לא קיימת כבר
            // דוגמה:
            // return Users.GetByUserId(userId) != null;
            return Users.GetAll().Any(u => u.UserId == userId);
        }
    }
}
