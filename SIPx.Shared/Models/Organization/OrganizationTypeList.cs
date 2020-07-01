using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class OrganizationTypeList
    {
        [Key]
        public int OrganizationTypeId { get; set; }
        public string Name { get; set; }

    }
}
