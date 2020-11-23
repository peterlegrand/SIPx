using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace SIPx.Shared
{
    public class ClassificationLevelPropertyStatusList
    {
        [Key]
        public int ClassificationLevelPropertyStatusId { get; set; }
        public string Name { get; set; }
    }
}
