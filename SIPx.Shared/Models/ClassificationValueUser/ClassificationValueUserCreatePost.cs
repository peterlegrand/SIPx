using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ClassificationValueUserCreatePost 
    {
        [Key]
        public string UserOfClassificationValueId { get; set; }
        public int ClassificationValueId { get; set; }
        public int ClassificationId { get; set; }
        public int ClassificationRelationTypeId { get; set; }
        public string UserId { get; set; }
    }
}
