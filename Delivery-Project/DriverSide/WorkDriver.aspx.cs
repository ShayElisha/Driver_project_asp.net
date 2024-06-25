using System;
using System.Collections.Generic;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using DAL;

namespace Delivery_Project.DriverSide
{
    public partial class WorkDriver : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                List<Shipments> shipment = Shipments.GetAll();
                RptProd.DataSource = shipment;
                RptProd.DataBind();
            }
        }

        [System.Web.Services.WebMethod]
        public static List<Shipments> GetShipments()
        {
            return Shipments.GetAll();
        }

        protected void Unnamed_Click(object sender, EventArgs e)
        {
            var button = (Button)sender;
            var dataItem = (RepeaterItem)button.NamingContainer;
            var sourceCity = ((Literal)dataItem.FindControl("SourceCity")).Text;
            var sourceAdd = ((Literal)dataItem.FindControl("SourceAdd")).Text;
            var destinationCity = ((Literal)dataItem.FindControl("DestinationCity")).Text;
            var destinationAdd = ((Literal)dataItem.FindControl("DestinationAdd")).Text;

            string script = $"navigateFromServer('{sourceCity}', '{sourceAdd}', '{destinationCity}', '{destinationAdd}');";
            ClientScript.RegisterStartupScript(this.GetType(), "navigate", script, true);
        }
        protected void SendWhatsAppButton_Click(object sender, EventArgs e)
        {
            string customerPhone = ((Button)sender).CommandArgument;

            // Ensure the phone number is in international format
            if (!customerPhone.StartsWith("+"))
            {
                customerPhone = "+972" + customerPhone.TrimStart('0');
            }

            string messageBody = "החבילה נאספה והיא בדרך אלייך";
            string url = $"https://wa.me/{customerPhone}?text={Uri.EscapeDataString(messageBody)}";

            // Register a script to open the URL in a new tab
            ClientScript.RegisterStartupScript(this.GetType(), "openWhatsApp", $"window.open('{url}', '_blank');", true);
        }
        protected void DeliverOrderButton_Click(object sender, EventArgs e)
        {
            var button = (Button)sender;
            string[] arguments = button.CommandArgument.Split(',');
            int shipId = Convert.ToInt32(arguments[0]);
            string phone = arguments[1];
            int OrderID = Convert.ToInt32(arguments[2]);
            UpdateShipmentStatusAndDate(shipId, OrderID, 3);
            SendWhatsAppMessage(phone, "החבילה נמסרה תודה שהשתמשתם בשירותים שלנו חברת FHD");

        }
        protected void AddToTruckButton_Click(object sender, EventArgs e)
        {
            var button = (Button)sender;
            string[] arguments = button.CommandArgument.Split(',');
            int shipId = Convert.ToInt32(arguments[0]);
            int OrderID = Convert.ToInt32(arguments[1]);
            UpdateOrderStatusAndDate(shipId, OrderID, 2);

            // לאחר העדכון, החלפת הכפתורים תתבצע
            ClientScript.RegisterStartupScript(this.GetType(), "showHiddenButtons", "showHiddenButtons(document.getElementById('" + button.ClientID + "'));", true);
        }
        private void UpdateOrderStatusAndDate(int shipId, int OrderId, int status)
        {
            Shipments shipment = Shipments.GetById(shipId);

            if (shipment == null)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "OrderNotFound", "alert('המשלוח לא נמצא');", true);
                return;
            }

            shipment.Status = status;
            shipment.ReleaseDate = DateTime.Now;
            ShipmentsDAL.Save(shipment);

            Orders order = Orders.GetById(OrderId);

            if (order == null)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "OrderNotFound", "alert('המשלוח לא נמצא');", true);
                return;
            }

            order.status = status;
            order.DeliveryTime = DateTime.Now;
            order.Save();

            // Display success message
            ClientScript.RegisterStartupScript(this.GetType(), "UpdateSuccess", "alert('המשלוח עודכן בהצלחה');", true);
        }

        private void UpdateShipmentStatusAndDate(int shipId, int OrderId, int status)
        {
            Shipments shipment = Shipments.GetById(shipId);

            if (shipment == null)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "OrderNotFound", "alert('המשלוח לא נמצא');", true);
                return;
            }

            shipment.Status = status;
            shipment.CollectionDate = DateTime.Now;
            ShipmentsDAL.Save(shipment);
            Orders order = Orders.GetById(OrderId);

            if (order == null)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "OrderNotFound", "alert('המשלוח לא נמצא');", true);
                return;
            }

            order.status = status;
            order.Datedelivery = DateTime.Now;
            order.Save();

            // Display success message
            ClientScript.RegisterStartupScript(this.GetType(), "DeliverySuccess", "alert('המשלוח נמסר בהצלחה');", true);
        }

        private void SendWhatsAppMessage(string phone, string message)
        {
            string customerPhone = phone;
            if (!customerPhone.StartsWith("+"))
            {
                customerPhone = "+972" + customerPhone.TrimStart('0');
            }

            string url = $"https://wa.me/{customerPhone}?text={Uri.EscapeDataString(message)}";

            ClientScript.RegisterStartupScript(this.GetType(), "openWhatsApp", $"window.open('{url}', '_blank');", true);
        }
    }

}