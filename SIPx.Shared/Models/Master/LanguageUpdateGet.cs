using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class LanguageUpdateGet 
    {
        [Key]
        public int LanguageId { get; set; }
        public string Name { get; set; }
        public string ForeignName { get; set; }
        public string ISO6391 { get; set; }
        public string ISO6392 { get; set; }
        public int StatusId { get; set; }
        public string Modifier { get; set; }
        public DateTime ModifiedDate { get; set; }

        public List<StatusList> Statuses { get; set; }
    }
}
