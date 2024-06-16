using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Delivery_Project.AdminManager
{
    public partial class AddressAddEdit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                List<Cities> cities = (List<Cities>)Application["cities"];
                for (int i = 0; i < cities.Count; i++)
                {
                    ddlCities.Items.Add(new ListItem(cities[i].CityName, cities[i].CityName)); // שימוש בשם העיר בתור ערך
                }
                string AddId = Request["AddId"] + "";
                if (string.IsNullOrEmpty(AddId))
                {
                    AddId = "-1";
                }
                else
                {
                    int addId = int.Parse(AddId);
                    List<Address> address = (List<Address>)Application["address"];
                    for (int i = 0; i < address.Count; i++)
                    {
                        if (address[i].AddId == addId)
                        {
                            Addresses.Text = address[i].address;
                            ddlCities.SelectedValue = address[i].CityName; // הגדרת הערך הנבחר לשם העיר
                            STATUS.Text = address[i].status + "";
                            hidCus.Value = AddId;
                        }
                    }
                }
            }
        }

        protected async void btnSave_Click(object sender, EventArgs e)
        {
            Address address = new Address();

            if (hidCus.Value == "-1")
            {
                address.AddId = -1;
            }
            else
            {
                address.AddId = int.Parse(hidCus.Value);
            }
            address.address = Addresses.Text;
            address.CityName = ddlCities.SelectedValue; // שימוש בשם העיר מה-SelectedValue
            address.status = int.Parse(STATUS.Text);

            bool isSaved = await address.Save();
            if (!isSaved)
            {
                // הצגת הודעה למשתמש שהכתובת לא נמצאה
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('הכתובת לא נמצאה. נא לבדוק את הכתובת ולנסות שוב.');", true);
                return;
            }
            Application["address"] = Address.GetAll();

            Response.Redirect("AddressList.aspx");
        }
    }
}
