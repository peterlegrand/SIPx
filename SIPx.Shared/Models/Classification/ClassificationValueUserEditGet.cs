using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ClassificationValueUserEditGet : IClassificationValueUserEditGet
    {
        [Key]
        public int ClassificationValueUserId { get; set; }
        public string UserId { get; set; }
        public int ClassificationValueId { get; set; }
        public int ClassificationRelationTypeId { get; set; }
        public string Creator { get; set; }
        public DateTime CreatedDate { get; set; }
        public string Modifier { get; set; }
        public DateTime ModifiedDate { get; set; }

        public List<RoleList> Statuses { get; set; }
        public List<ClassificationRelationTypeList> ClassificationRelationTypes { get; set; }

    }
}
