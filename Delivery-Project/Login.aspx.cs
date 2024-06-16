using DATA;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Delivery_Project
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            DbContext Db = new DbContext();
            string sql = "SELECT * FROM T_Users";
            SqlCommand cmd = new SqlCommand(sql, Db.conn);
            SqlDataReader Dr = cmd.ExecuteReader();
            while (Dr.Read())
            {
                if (userId.Text == Dr["UserId"].ToString() && UserPass.Text == Dr["Password"].ToString())
                {
                    // ניצור סשן ונשמור את האובייקט של המשתמש 
                    Session["Login"] = Dr;
                    // נעביר את המשתמש לעמוד מוצרים
                    Response.Redirect("/driverPage.aspx");
                }
            }
            LtlMsg.Text = "מייל או סיסמה אינם תקינים";
        }
    }
}