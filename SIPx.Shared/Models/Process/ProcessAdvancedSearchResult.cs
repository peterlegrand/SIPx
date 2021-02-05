using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace SIPx.Shared
{
    public class ProcessAdvancedSearchResult
    {
        [Key]
        public int ProcessId { get; set; }
        public string Subject { get; set; }
        public string ProcessTypeName { get; set; }
        public string ProcessTypeStageName { get; set; }
        public string ProcessTypeIcon { get; set; }
        public string ProcessTypeStageTypeColor { get; set; }
        public DateTime CreatedDate { get; set; }
        public string CreatorName { get; set; }
        public int CreatorId { get; set; }
    }
}
