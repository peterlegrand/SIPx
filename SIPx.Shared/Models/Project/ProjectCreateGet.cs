using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ProjectCreateGet
    {
        [Key]
        public int? ParentProjectId { get; set; }
        public string CodePrefix { get; set; }
        public int CodeInt { get; set; }
        public string CodeSuffix { get; set; }
        public string Code { get; set; }
        public string ProjectParentName { get; set; }
        public int StatusId { get; set; }
        public int ProjectTypeId { get; set; }
        public int LanguageId { get; set; }
        public string LanguageName { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string MenuName { get; set; }
        public int SecurityLevelId { get; set; }
        public string MouseOver { get; set; }
        public string UserId { get; set; }
        public List<StatusList> Statuses { get; set; }
        public List<ProjectTypeList> ProjectTypes { get; set; }
        public List<SecurityLevelList> SecurityLevels { get; set; }
    }
}
