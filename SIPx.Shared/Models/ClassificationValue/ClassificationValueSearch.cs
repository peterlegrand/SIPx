using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ClassificationValueSearch
    {
        [Key]
        public int ClassificationValueId { get; set; }
        public string ClassificationValueName { get; set; }
        public string ClassificationValueDescription { get; set; }
        public string ClassificationName { get; set; }
        public string CreatorName { get; set; }
        public DateTime CreatedDate { get; set; }
        public int CreatorId { get; set; }
    }
}
