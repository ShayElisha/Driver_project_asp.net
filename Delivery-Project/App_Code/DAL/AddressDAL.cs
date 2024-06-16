using BLL;
using DATA;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net;
using System.Threading.Tasks;
using System.Web;

namespace DAL
{
    public class AddressDAL
    {
        public static List<Address> GetAll()
        {
            DbContext Db = new DbContext();
            string sql = "SELECT * FROM T_Address";
            DataTable Dt = Db.Execute(sql);
            List<Address> Addresss = new List<Address>();

            for (int i = 0; i < Dt.Rows.Count; i++)
            {
                Address Cus = new Address()
                {
                    AddId = int.Parse(Dt.Rows[i]["AddId"].ToString()),
                    address = Dt.Rows[i]["address"].ToString(),
                    CityName = Dt.Rows[i]["CityName"].ToString(),
                    corddWidth = Dt.Rows[i]["corddWidth"].ToString(),
                    corddHeight = Dt.Rows[i]["corddHeight"].ToString(),
                    status = int.Parse(Dt.Rows[i]["status"].ToString()),
                    AddDate = Dt.Rows[i]["AddDate"].ToString()
                };
                Addresss.Add(Cus);
            }
            Db.Close();
            return Addresss;
        }

        public static Address GetById(int Id)
        {
            DbContext Db = new DbContext();
            string sql = $"SELECT * FROM T_Address WHERE AddId={Id}"; // שינוי שם השדה
            DataTable Dt = Db.Execute(sql);
            Address Clients = null;

            if (Dt.Rows.Count > 0)
            {
                Clients = new Address()
                {
                    AddId = int.Parse(Dt.Rows[0]["AddId"].ToString()), // המרה נכונה ממחרוזת למספר שלם
                    address = Dt.Rows[0]["address"].ToString(), // המרת מחרוזת
                    CityName = Dt.Rows[0]["CityName"].ToString(), // המרת מחרוזת
                    corddWidth = Dt.Rows[0]["corddWidth"].ToString(), // המרה נכונה ממחרוזת לצף
                    corddHeight = Dt.Rows[0]["corddHeight"].ToString(), // המרה נכונה ממחרוזת לצף
                    status = int.Parse(Dt.Rows[0]["status"].ToString()), // המרה נכונה ממחרוזת למספר שלם
                    AddDate = Dt.Rows[0]["AddDate"].ToString() // המרת מחרוזת
                };
            }
            Db.Close();
            return Clients;
        }

        public static void Save(Address Client)
        {
            string sql = "";
            if (Client.AddId == -1)
            {
                sql = "INSERT INTO T_Address (address, CityName, corddWidth, corddHeight, status) VALUES ";
                sql += $"(N'{Client.address}', N'{Client.CityName}', {Client.corddWidth}, {Client.corddHeight}, {Client.status})";
            }
            else
            {
                sql = "UPDATE T_Address SET ";
                sql += $"address=N'{Client.address}', ";
                sql += $"CityName=N'{Client.CityName}', ";
                sql += $"corddWidth={Client.corddWidth}, ";
                sql += $"corddHeight={Client.corddHeight}, ";
                sql += $"status={Client.status} ";
                sql += $"WHERE AddId={Client.AddId}";
            }

            DbContext Db = new DbContext();
            Db.ExecuteNonQuery(sql);
        }

        public static async Task<(string, string)> GetCoordinatesFromAddressAsync(string city, string address)
        {
            string query = $"{Uri.EscapeDataString(address)}, {Uri.EscapeDataString(city)}";
            string url = $"https://nominatim.openstreetmap.org/search?format=json&q={query}";

            using (WebClient client = new WebClient())
            {
                client.Headers.Add("User-Agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36");

                try
                {
                    string content = await client.DownloadStringTaskAsync(url);
                    JArray json = JArray.Parse(content);
                    if (json.Count > 0)
                    {
                        string lat = json[0]["lat"].ToString();
                        string lon = json[0]["lon"].ToString();
                        return (lat, lon);
                    }
                }
                catch (WebException ex)
                {
                    Console.WriteLine($"Error fetching coordinates: {ex.Message}");
                }
            }
            return (string.Empty, string.Empty); // ערך מיוחד במקרה שהכתובת לא נמצאה
        }


    }
}


