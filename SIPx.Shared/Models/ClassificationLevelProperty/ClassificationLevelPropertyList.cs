using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace SIPx.Shared
{
    public class ClassificationLevelPropertyList
    {
        [Key]
        public int ClassificationLevelPropertyId { get; set; }
        public string Name { get; set; }
    }
}
