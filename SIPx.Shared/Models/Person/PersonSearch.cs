using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class PersonSearch
    {
        [Key]
        public int PersonId { get; set; }

        public string FirstName { get; set; }
        public string MiddleName { get; set; }
        public string LastName { get; set; }
        public string NickName { get; set; }
        public int IsUser { get; set; }
        public string OrganizationName { get; set; }
        public int OrganizationId { get; set; }
        public int CreatorId { get; set; }
        public string CreatorName { get; set; }
        public DateTime CreatedDate { get; set; }

    }
}
