using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ClassificationValueUserCreatePost : IClassificationValueUserCreatePost
    {
        [Key]
        public string @UserOfClassificationId { get; set; }
        public int ClassificationValueId { get; set; }
        public int ClassificationId { get; set; }
        public int ClassificationRelationTypeId { get; set; }
        public string UserId { get; set; }
    }
}
