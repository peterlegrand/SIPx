using Microsoft.AspNetCore.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SIPx.API.Models
{
    public class SipUser: IdentityUser
    {
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public int LanguageID { get; set; }
        public DateTime CreatedDate { get; set; }
        public DateTime ModifiedDate { get; set; }
    }
}
