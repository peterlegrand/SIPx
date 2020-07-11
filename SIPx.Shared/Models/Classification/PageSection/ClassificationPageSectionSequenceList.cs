using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ClassificationPageSectionSequenceList
    {
        [Key]
        public int Sequence { get; set; }
        public string Name { get; set; }
    }
}
