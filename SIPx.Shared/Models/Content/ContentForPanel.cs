using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ContentForPanel 
    {
        [Key]
        public int ContentId { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public string ContentTypeName { get; set; }
        public string CreatorName { get; set; }
        public int CreatorId { get; set; }
        public DateTime CreatedDate { get; set; }
        public string ModifierName { get; set; }
        public int ModifierId { get; set; }
        public DateTime ModifiedDate { get; set; }
        public String ControlId { get; set; }

    }
}
