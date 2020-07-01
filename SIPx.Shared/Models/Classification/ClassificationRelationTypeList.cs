using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ClassificationRelationTypeList
    {
        [Key]
        public int ClassificationRelationTypeId { get; set; }
        public string Name { get; set; }

    }
}
