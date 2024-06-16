using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BLL
{
    public class Customers
    {
        public int CusID {  get; set; }
        public string FullName { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
        public string Address { get; set; }
        public string City { get; set; }
        public string Company { get; set; }
        public int status { get; set; }
        public string AddDate { get; set; }
    }
    
}