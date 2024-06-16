using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Delivery_Project
{
    public partial class workPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                List<Cities> cities = (List<Cities>)Application["cities"];

                // Load cities into dropdown
                foreach (var city in cities)
                {
                    ddlCities.Items.Add(new ListItem(city.CityName, city.CityName));
                }
            }
        }

        protected void ddlCities_SelectedIndexChanged(object sender, EventArgs e)
        {
            string selectedCity = ddlCities.SelectedValue;
            List<Address> addresses = Address.GetAll();
            List<Address> cityAddresses = addresses.FindAll(a => a.CityName == selectedCity);

            var cityAddressesJson = new JavaScriptSerializer().Serialize(cityAddresses);
            ScriptManager.RegisterStartupScript(this, GetType(), "showMap", $"showMap('{selectedCity}', {cityAddressesJson});", true);
        }
    }
}
