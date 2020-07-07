using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace SIPx.Shared
{
    public class ClassificationCreateGetSequence
    {
        [Key]
        public int Sequence { get; set; }
        public string Name { get; set; }
    }
}
