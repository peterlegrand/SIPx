using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class FrontProjectIndexGet
    {
        [Key]
        public int ProjectId { get; set; }
        public int? ParentProjectId { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string ParentProjectName { get; set; }
        public string StatusName { get; set; }
        public int ProjectTypeId { get; set; }
        public string ProjectTypeName { get; set; }
        public int SecurityLevelId { get; set; }
        public string SecurityLevelName { get; set; }
        public bool CanEdit { get; set; }
        public bool CanCreate { get; set; }

        public int CreatorId { get; set; }
        public string CreatorName { get; set; }
        public DateTime CreatedDate { get; set; }
        public int ModifierId { get; set; }
        public string ModifierName { get; set; }
        public DateTime ModifiedDate { get; set; }

        public List<FrontOrganizationIndexGetSubProject> SubProjects { get; set; }
        public List<FrontProjectIndexGetMember> Members { get; set; }
        public List<FrontProjectIndexGetContent> Contents { get; set; }
        public List<FrontProjectIndexGetProcess> Processes { get; set; }
        public JObject SubProjectTree { get; set; }
    }
}
