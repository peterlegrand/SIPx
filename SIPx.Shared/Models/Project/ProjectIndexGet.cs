using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ProjectIndexGet
    {
        [Key]
        public int ProjectId { get; set; }
        public string ProjectName { get; set; }
        public int ProjectLanguageId { get; set; }
        public int? ParentProjectId { get; set; }
        public string ParentProjectName { get; set; }
        public int StatusId { get; set; }
        public string StatusName { get; set; }
        public int LanguageId { get; set; }
        public string LanguageName { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string MenuName { get; set; }
        public string MouseOver { get; set; }
        public string CreatorId { get; set; }
        public string CreatorName { get; set; }
        public DateTime CreatedDate { get; set; }
        public string ModifierId { get; set; }
        public string ModifierName { get; set; }
        public DateTime ModifiedDate { get; set; }
    }
}
