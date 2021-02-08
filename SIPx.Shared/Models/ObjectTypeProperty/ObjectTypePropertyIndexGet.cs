using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ObjectTypePropertyIndexGet
    {
        [Key]
        public int ObjectTypeId { get; set; }
        public string ObjectTypeName { get; set; }
        public List<ObjectTypePropertyIndexGetGrid> ObjectTypePropertyIndexGetGrid { get; set; }
    }
}
