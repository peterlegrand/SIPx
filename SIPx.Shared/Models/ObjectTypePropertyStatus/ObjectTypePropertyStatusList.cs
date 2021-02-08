using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ObjectTypePropertyStatusList
    {
        [Key]
        public int ObjectTypePropertyStatusId { get; set; }
        public string Name { get; set; }
    }
}
