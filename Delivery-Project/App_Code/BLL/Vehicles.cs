using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BLL
{
    public class Vehicles
    {
        public int vehicleID { get; set; }
        public string Model { get; set; }
        public int Year {  get; set; }
        public string LisencePlate { get; set; }
        public DateTime PurchaseDate { get; set; }
        public DateTime LastServiseDate { get; set; }
        public int status { get; set; }
        public string AddDate { get; set; }
    }
}