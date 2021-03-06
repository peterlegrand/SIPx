﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ProjectTypeMatrixToUpdateGet 
    {
        [Key]
       public int ProjectTypeMatrixId { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string MenuName { get; set; }
        public string MouseOver { get; set; }
        public int ToProjectTypeId { get; set; }
        public string ToProjectTypeName { get; set; }
        public int FromProjectTypeId { get; set; }
        public int ProjectMatrixTypeId { get; set; }
        public List<ProjectTypeList> ProjectTypes { get; set; }
        public List<ProjectMatrixTypeList> ProjectMatrixTypes { get; set; }
        public string CreatorName { get; set; }
        public int CreatorId { get; set; }
        public DateTime CreatedDate { get; set; }
        public string ModifierName { get; set; }
        public int ModifierId { get; set; }
        public DateTime ModifiedDate { get; set; }
        public List<IconList> Icons { get; set; }
        public string UserId { get; set; }
    }
}
