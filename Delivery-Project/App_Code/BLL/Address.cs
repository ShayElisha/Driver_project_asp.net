using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;

namespace BLL
{
    public class Address
    {
        public int AddId {  get; set; }
        public string address { get; set; }
        public string CityName { get; set; }
        public string corddWidth {  get; set; }
        public string corddHeight { get; set; }
        public int status { get; set; }
        public string AddDate { get; set; }
        public static List<Address> GetAll()
        {
            return AddressDAL.GetAll();
        }
        public static Address GetById(int id)
        {
            return AddressDAL.GetById(id);
        }
        public async Task<bool> Save()
        {
            if (string.IsNullOrEmpty(corddWidth) && string.IsNullOrEmpty(corddHeight))
            {
                (corddWidth, corddHeight) = await AddressDAL.GetCoordinatesFromAddressAsync(CityName, address);
                if (string.IsNullOrEmpty(corddWidth) || string.IsNullOrEmpty(corddHeight))
                {
                    return false; // כתובת לא נמצאה
                }
            }
            AddressDAL.Save(this);
            return true; // שמירה הצליחה
        }
    }

}