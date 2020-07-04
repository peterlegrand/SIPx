using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class PageSectionDataTypeList
    {
        [Key]
        public int PageSectionTypeId { get; set; }
        public string Name { get; set; }

    }
}
