using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ContentStatusList
    {
        [Key]
        public int ContentStatusId { get; set; }
        public string Name { get; set; }

    }
}
