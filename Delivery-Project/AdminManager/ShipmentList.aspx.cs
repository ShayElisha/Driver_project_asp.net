using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Delivery_Project.AdminManager
{
    public partial class ShipmentList : System.Web.UI.Page
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
        protected void RptAddresses_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Delete")
            {
                int shipmentsId = Convert.ToInt32(e.CommandArgument);
                DeleteShipment(shipmentsId);
                List<Shipments> shipments = Shipments.GetAll();
                RptProd.DataSource = shipments;
                RptProd.DataBind();
            }
        }

        private void DeleteShipment(int shipmentsId)
        {
            Shipments.Delete(shipmentsId);
        }
    }
}