using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class OrganizationAdvancedSearchResult
    {
        [Key]
        public int OrganizationId { get; set; }
        public string OrganizationName { get; set; }
        public string OrganizationDescription { get; set; }
        public DateTime CreatedDate { get; set; }
        public string CreatorName { get; set; }
        public int CreatorId { get; set; }
    }
}
