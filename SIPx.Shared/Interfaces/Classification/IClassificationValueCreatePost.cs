using System;

namespace SIPx.Shared
{
    public interface IClassificationValueCreatePost
    {
        int ClassificationId { get; set; }
        DateTime DateFrom { get; set; }
        DateTime DateTo { get; set; }
        string Description { get; set; }
        string HeaderDescription { get; set; }
        string HeaderName { get; set; }
        int LanguageId { get; set; }
        string Location { get; set; }
        string MenuName { get; set; }
        string MouseOver { get; set; }
        string Name { get; set; }
        string PageDescription { get; set; }
        string PageName { get; set; }
        int? ParentId { get; set; }
        string TopicName { get; set; }
        string UserId { get; set; }
    }
}