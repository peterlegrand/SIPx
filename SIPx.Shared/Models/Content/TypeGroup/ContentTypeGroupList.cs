using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ContentTypeGroupList
    {
        [Key]
        public int ContentTypeGroupId { get; set; }
        public string Name { get; set; }

    }
}
