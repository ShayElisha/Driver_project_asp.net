using BLL;
using DATA;
using System;
using System.Collections.Generic;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Delivery_Project.AdminManager
{
    public partial class OrderList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                List<Orders> orders = Orders.GetAll();
                if (orders != null && orders.Count > 0)
                {
                    foreach (var order in orders)
                    {
                        order.HasShipment = CheckOrderShipment(order.OrderID);
                    }
                    RptProd.DataSource = orders;
                    RptProd.DataBind();
                    NoShipmentsPanel.Visible = false;
                }
                else
                {
                    NoShipmentsPanel.Visible = true;
                }
            }
        }

        private bool CheckOrderShipment(int orderId)
        {
            DbContext db = new DbContext();
            string sql = $"select COUNT(*) FROM T_Orders o INNER JOIN T_Shipments s ON o.OrderID = s.OrderID WHERE o.OrderID = {orderId}";
            int count = (int)db.ExecuteScalar(sql);
            return count > 0;
        }

        protected void RptProd_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                var order = (Orders)e.Item.DataItem;
                var linkButton = (HyperLink)e.Item.FindControl("ExportButton");

                if (order.HasShipment)
                {
                    linkButton.Text = "הזמנה נמצאת במשלוחים";
                    linkButton.Attributes.Add("class", "disabled-link");
                    linkButton.NavigateUrl = "#"; // Prevent navigation
                }
                else
                {
                    linkButton.Text = "ייצא לנהג";
                }
            }
        }
    }
}
