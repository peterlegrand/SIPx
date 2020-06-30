using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ContentTypeList
    {
        [Key]
        public int ContentTypeId { get; set; }
        public string Name { get; set; }

    }
}
