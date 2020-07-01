using System;
using System.Collections.Generic;

namespace SIPx.Shared
{
    public interface IContentTypeEditGet
    {
        int ContentTypeGroupId { get; set; }
        List<ContentTypeGroupList> ContentTypeGroups { get; set; }
        int ContentTypeId { get; set; }
        DateTime CreatedDate { get; set; }
        string Creator { get; set; }
        string Description { get; set; }
        string MenuName { get; set; }
        DateTime ModifiedDate { get; set; }
        string Modifier { get; set; }
        string MouseOver { get; set; }
        string Name { get; set; }
        int ProcessTemplateId { get; set; }
        List<ProcessTemplateList> ProcessTemplates { get; set; }
        int SecurityLevelId { get; set; }
        List<SecurityLevelList> SecurityLevels { get; set; }
    }
}