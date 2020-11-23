using SIPx.Shared;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace SIPx.Shared
{
    public class PropertyCreateGet
    {
        [Key]
        public int PropertyTypeId { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string MenuName { get; set; }
        public string MouseOver { get; set; }
        public string UserId { get; set; }

        public List<PropertyTypeList> PropertyTypes { get; set; }

    }
}
