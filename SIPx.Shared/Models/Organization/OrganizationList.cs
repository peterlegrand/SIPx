using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class OrganizationList 
    {
        [Key]
        public int OrganizationId { get; set; }
        public string Name { get; set; }

    }
}
