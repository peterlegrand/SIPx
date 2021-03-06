﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ProjectUpdateGet 
    {
        [Key]
        public int ProjectId { get; set; }
        public string CodePrefix { get; set; }
        public int CodeInt { get; set; }
        public string CodeSuffix { get; set; }
        public string Code { get; set; }
        public int ProjectLanguageId { get; set; }
        public int? ParentProjectId { get; set; }
        public string ParentProjectName { get; set; }
        public string ProjectTypeName { get; set; }
        public int ProjectTypeId { get; set; }
        public int SecurityLevelId { get; set; }
        public int StatusId { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string MenuName { get; set; }
        public string MouseOver { get; set; }
        public string CreatorName { get; set; }
        public int CreatorId { get; set; }
        public DateTime CreatedDate { get; set; }
        public string ModifierName { get; set; }
        public int ModifierId { get; set; }
        public DateTime ModifiedDate { get; set; }
        public string UserId { get; set; }
        public int CodeTypeId { get; set; }

        //public List<ProjectTypeList> ProjectTypes { get; set; }
        public List<SecurityLevelList> SecurityLevels { get; set; }
        public List<StatusList> Statuses { get; set; }
    }
}
