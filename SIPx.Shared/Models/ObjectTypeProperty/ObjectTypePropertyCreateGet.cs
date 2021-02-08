using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ObjectTypePropertyCreateGet
    {
        public int ObjectTypePropertyId { get; set; }
        public int ObjectTypeId { get; set; }
        public string ObjectTypeName { get; set; }
        public int PropertyId { get; set; }
        public string ObjectTypePropertyStatusId { get; set; }
        public string UserId { get; set; }
        public List<PropertyList> Properties { get; set; }
        public List<ObjectTypePropertyStatusList> Statuses { get; set; }

    }
}
