using System;

namespace SIPx.Shared
{
    public interface IContentType
    {
        int ContentTypeId { get; set; }
        string Name { get; set; }
        string Description { get; set; }
        string MenuName { get; set; }
        string MouseOver { get; set; }
        string GroupName { get; set; }
        string SecurityLevelName { get; set; }
        string ProcessName { get; set; }
        string ProcessGroupName { get; set; }
    }
}