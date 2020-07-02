using System;
using System.Collections.Generic;

namespace SIPx.Shared
{
    public interface IProjectEditGet
    {
        DateTime CreatedDate { get; set; }
        string Creator { get; set; }
        string Description { get; set; }
        string MenuName { get; set; }
        DateTime ModifiedDate { get; set; }
        string Modifier { get; set; }
        string MouseOver { get; set; }
        string Name { get; set; }
        int? ParentProjectId { get; set; }
        int ProjectId { get; set; }
        int ProjectLanguageId { get; set; }
        List<ProjectList> Projects { get; set; }
        List<StatusList> Statuses { get; set; }
        int StatusId { get; set; }
    }
}