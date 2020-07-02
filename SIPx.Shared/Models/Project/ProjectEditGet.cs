using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ProjectEditGet : IProjectEditGet
    {
        [Key]
        public int ProjectId { get; set; }
        public int ProjectLanguageId { get; set; }
        public int? ParentProjectId { get; set; }
        public int StatusId { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string MenuName { get; set; }
        public string MouseOver { get; set; }
        public string Creator { get; set; }
        public DateTime CreatedDate { get; set; }
        public string Modifier { get; set; }
        public DateTime ModifiedDate { get; set; }

        public List<ProjectList> Projects { get; set; }
        public List<StatusList> Statuses { get; set; }
    }
}
