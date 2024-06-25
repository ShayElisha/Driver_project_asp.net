using DATA;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;

namespace Delivery_Project.CustomerSide
{
    public partial class OrderStatus : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                List<Orders> orders = Orders.GetAll();
                if (orders != null && orders.Count > 0)
                {
                    RptProd.DataSource = orders;
                    RptProd.DataBind();
                    NoOrdersPanel.Visible = false;
                }
                else
                {
                    NoOrdersPanel.Visible = true;
                }
            }
        }
        
    }
}