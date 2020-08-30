using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ClassificationValueUserIndexGet 
    {
        [Key]
        public int ClassificationValueUserId { get; set; }
        public string UserId { get; set; }
        public string UserFirstName { get; set; }
        public string UserLastName { get; set; }
        public int ClassificationId { get; set; }
        public int ClassificationValueId { get; set; }
        public int ClassificationRelationTypeId { get; set; }
        public string ClassificationRelationTypeName { get; set; }
        public string CreatorId { get; set; }
        public string CreatorName { get; set; }
        public DateTime CreatedDate { get; set; }
        public string ModifierId { get; set; }
        public string ModifierName { get; set; }
        public DateTime ModifiedDate { get; set; }


    }
}
