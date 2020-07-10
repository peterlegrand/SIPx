using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace SIPx.Shared { 
    public class ContentWithDescription
    {
        [Key]
        public int ContentId { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public string ContentypeName { get; set; }
        public string StatusName { get; set; }
        public string LanguageName { get; set; }
        public string SecurityLevelName { get; set; }
        public string OrganiztionName { get; set; }
        public string ProjectName { get; set; }
        public string ProcessSubject { get; set; }
        public string CreatorName { get; set; }
        public string CreatorId { get; set; }
        public DateTime CreatedDate { get; set; }
        public string ModifierName { get; set; }
        public string ModifierId { get; set; }
        public DateTime ModifiedDate { get; set; }
    }
}
