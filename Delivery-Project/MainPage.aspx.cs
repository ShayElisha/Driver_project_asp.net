using DATA;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Delivery_Project
{
    public partial class MainPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Register_Click(object sender, EventArgs e)
        {
            // לא נדרש טיפול נוסף כאן כי ה-Modal נפתח על ידי JavaScript
        }

        protected void Login_Click(object sender, EventArgs e)
        {
            // לא נדרש טיפול נוסף כאן כי ה-Modal נפתח על ידי JavaScript
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string fullName = txtFullName.Text;
            string email = txtEmail.Text;
            string password = txtPassword.Text;
            string phone = txtPhone.Text;
            string address = txtAddress.Text;
            int cityId = int.Parse(txtCityId.Text);
            string company = txtCompany.Text;

            // טיפול בהרשמה (שמירה במסד הנתונים, שליחת אימייל וכו')
        }

        protected void btnManagerLogin_Click(object sender, EventArgs e)
        {
            DbContext Db = new DbContext();
            string sql = "SELECT * FROM T_Manager";
            SqlCommand cmd = new SqlCommand(sql, Db.conn);

            SqlDataReader Dr = cmd.ExecuteReader();
            while (Dr.Read())
            {
                if (txtManagerEmail.Text == Dr["Email"].ToString() && txtManagerPassword.Text == Dr["Password"].ToString())
                {
                    // ניצור סשן ונשמור את האובייקט של המשתמש 
                    Session["Manager"] = Dr;
                    // נעביר את המשתמש לעמוד מוצרים
                    Response.Redirect("/AdminManager/ManagerList.aspx");
                }

            }
            LtlMsg.Text = "מייל או סיסמה אינם תקינים";
        }

        protected void btnDriverLogin_Click(object sender, EventArgs e)
        {
            DbContext Db = new DbContext();
            string sql = "SELECT * FROM T_Driver";
            SqlCommand cmd = new SqlCommand(sql, Db.conn);

            SqlDataReader Dr = cmd.ExecuteReader();
            while (Dr.Read())
            {
                if (txtDriverEmail.Text == Dr["Email"].ToString() && txtDriverPassword.Text == Dr["Password"].ToString())
                {
                    // ניצור סשן ונשמור את האובייקט של המשתמש 
                    Session["Driver"] = Dr;
                    // נעביר את המשתמש לעמוד מוצרים
                    Response.Redirect("/driverPage.aspx");
                }
                
            }
            LtlMsg.Text = "מייל או סיסמה אינם תקינים";
        }
        protected void btnCustomerLogin_Click(object sender, EventArgs e)
        {
            DbContext Db = new DbContext();
            string sql = "SELECT * FROM T_Customer";
            SqlCommand cmd = new SqlCommand(sql, Db.conn);

            SqlDataReader Dr = cmd.ExecuteReader();
            while (Dr.Read())
            {
                if (txtCustomerEmail.Text == Dr["Email"].ToString() && txtCustomerPassword.Text == Dr["Password"].ToString())
                {
                    // ניצור סשן ונשמור את האובייקט של המשתמש 
                    Session["CustomerID"] = Dr["CustomerID"].ToString();
                    Session["Customer"] = Dr;
                    // נעביר את המשתמש לעמוד מוצרים
                    Response.Redirect("/CustomerSide/OrderPage.aspx");
                }

            }
            LtlMsg.Text = "מייל או סיסמה אינם תקינים";
        } 
    }
}