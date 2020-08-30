using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ClassificationPageSectionList
    {
        [Key]
        public int ClassificationPageSectionId { get; set; }
        public string Name { get; set; }
    }
}
