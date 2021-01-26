using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class MetaContentTypeList
    {
        [Key]
        public int MetaContentTypeId { get; set; }
        public string Name { get; set; }
    }
}
