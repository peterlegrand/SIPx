using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace SIPx.API.ViewModels
{
    public class ClassificationValueUser
    {
        [Key]
        public String UserID { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string RelationTypeName { get; set; }
        public string OrganizationName { get; set; }
        public string Creator { get; set; }
        public DateTime CreatedDate { get; set; }
        public string Modifier { get; set; }
        public DateTime ModifiedDate { get; set; }

    }
}
