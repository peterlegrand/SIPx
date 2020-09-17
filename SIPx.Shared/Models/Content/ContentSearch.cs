using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ContentSearch
    {
        [Key]
        public int ContentId { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public string OrganizationName { get; set; }
        public int OrganizationId { get; set; }
        public string CreatorName { get; set; }
        public int CreatorId { get; set; }
        public DateTime CreatedDate { get; set; }

    }
}
