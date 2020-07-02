using System;

namespace SIPx.Shared
{
    public interface IClassificationValueEditGet
    {
        int ClassificationId { get; set; }
        int ClassificationLanguageId { get; set; }
        int ClassificationValueId { get; set; }
        DateTime CreatedDate { get; set; }
        string Creator { get; set; }
        DateTime DateFrom { get; set; }
        DateTime DateTo { get; set; }
        string Description { get; set; }
        string HeaderDescription { get; set; }
        string HeaderName { get; set; }
        string MenuName { get; set; }
        DateTime ModifiedDate { get; set; }
        string Modifier { get; set; }
        string MouseOver { get; set; }
        string ParentValueName { get; set; }
        string Name { get; set; }
        string PageDescription { get; set; }
        string PageName { get; set; }
        string TopicName { get; set; }
    }
}