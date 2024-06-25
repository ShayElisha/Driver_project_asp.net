using BLL;
using Delivery_Project.CustomerSide;
using Google.Apis.Admin.Directory.directory_v1.Data;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Delivery_Project.AdminManager
{
    public partial class shipmentAddEdit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                List<Driver> driver = (List<Driver>)Application["Drivers"];
                ddlDriverId.Items.Clear();  // מנקה את כל הפריטים הקיימים
                ddlDriverId.Items.Add(new ListItem("בחר נהג", "0"));  // מוסיף את פריט ברירת המחדל

                for (int i = 0; i < driver.Count; i++)
                {
                    ddlDriverId.Items.Add(new ListItem(driver[i].Id + " - " + driver[i].FullName, driver[i].Id.ToString()));
                }

                string OrderId = Request["OrderId"] + "";
                if (string.IsNullOrEmpty(OrderId))
                {
                    OrderId = "-1";
                }
                else
                {
                    int oID = int.Parse(OrderId);
                    List<Orders> order = (List<Orders>)Application["Orders"];
                    for (int i = 0; i < order.Count; i++)
                    {
                        if (order[i].OrderID == oID)
                        {
                            OrderID.Text = order[i].OrderID.ToString();
                            CustomerID.Text = order[i].CustomerID + "";
                            CustomerID.Text = order[i].CustomerID + "";
                            DestinationAdd.Text = order[i].FullName + "";
                            DestinationCity.Text = order[i].Address;
                            customerName.Text = order[i].CityId + "";
                            Phone.Text = order[i].Address;
                            Quantity.Text = order[i].CityId + "";
                            Phone.Text = order[i].Phone + "";
                            hidShipId.Value = OrderId;
                        }
                    }
                }
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(OrderID.Text) ||
                string.IsNullOrEmpty(CustomerID.Text) ||
                string.IsNullOrEmpty(SourceAdd.Text) ||
                string.IsNullOrEmpty(SourceCity.Text) ||
                string.IsNullOrEmpty(DestinationAdd.Text) ||
                string.IsNullOrEmpty(DestinationCity.Text) ||
                string.IsNullOrEmpty(customerName.Text) ||
                string.IsNullOrEmpty(Phone.Text) ||
                ddlDriverId.SelectedValue == "0" ||
                string.IsNullOrEmpty(Quantity.Text))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('אנא מלא את כל השדות');", true);
                return;
            }

            Shipments shipment = new Shipments();
            shipment.ShipId = -1;
            shipment.OrderID = OrderID.Text;
            shipment.CustomerID = CustomerID.Text;
            shipment.SourceAdd = SourceAdd.Text;
            shipment.SourceCity = SourceCity.Text;
            shipment.DestinationAdd = DestinationAdd.Text;
            shipment.DestinationCity = DestinationCity.Text;
            shipment.CustomerName = customerName.Text;
            shipment.Phone = Phone.Text;
            shipment.DriverId = int.Parse(ddlDriverId.SelectedValue);
            shipment.Quantity = int.Parse(Quantity.Text);

            shipment.Save();

            Application["Shipments"] = Shipments.GetAll();

            // שליחת ה-OrderID בעמוד ה-Redirect
            Response.Redirect("OrderList.aspx?hideOrderId=" + OrderID.Text);
        }

    }
}