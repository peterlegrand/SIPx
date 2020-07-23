using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ClassificationUserCreatePost 
    {
        [Key]
        public string UserId { get; set; }
        public int ClassificationId { get; set; }
        public int ClassificationRelationTypeId { get; set; }
        public string CreatorId { get; set; }
    }
}
