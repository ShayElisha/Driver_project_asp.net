using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Delivery_Project.AdminManager
{
    public partial class DriverjobAddEdit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            List<Users> user = (List<Users>)Application["Clients"];
            for (int i = 0; i < user.Count; i++)
            {
                if (user[i].IsAdmin==0)
                    DDlUser.Items.Add(new ListItem(user[i].UserId+" - "+ user[i].UserName)); // שימוש בשם העיר בתור ערך
            }
            List<Address> add = (List<Address>)Application["address"];
            for (int i = 0; i < add.Count; i++)
            {
                ddlCities.Items.Add(new ListItem(add[i].CityName+" , "+ add[i].address)); // שימוש בשם העיר בתור ערך
            }
        }
        protected async void btnSave_Click(object sender, EventArgs e)
        {
            
        }
    }
}