using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ClassificationValueUserDeleteGet
    {
        [Key]
        public int ClassificationValueUserId { get; set; }
        public int ClassificationValueId { get; set; }
        public string UserName { get; set; }
        public string ClassificationRelationTypeName { get; set; }
        public string CreatorName { get; set; }
        public string CreatorId { get; set; }
        public DateTime CreatedDate { get; set; }
        public string ModifierName { get; set; }
        public string ModifierId { get; set; }
        public DateTime ModifiedDate { get; set; }
    }
}
