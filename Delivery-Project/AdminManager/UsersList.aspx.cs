using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
namespace Delivery_Project.AdminManager
{
    public partial class UsersList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            List<Users> lsCclient = (List<Users>)Application["Clients"];
            RptProd.DataSource = lsCclient;
            RptProd.DataBind();
        }
    }
}