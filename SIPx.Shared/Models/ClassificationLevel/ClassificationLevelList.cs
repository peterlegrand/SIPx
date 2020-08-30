using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace SIPx.Shared
{
    public class ClassificationLevelList
    {
        [Key]
        public int ClassificationLevelId { get; set; }
        public string Name { get; set; }
    }
}
