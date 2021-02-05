using System.Collections.Generic;

namespace SIPx.Shared
{
    public interface IContentTypeCreatePost
    {
        List<ContentTypeCreatePostClassification> ContentTypeClassifications { get; set; }
        int ContentTypeGroupId { get; set; }
        string Description { get; set; }
        string MenuName { get; set; }
        string MouseOver { get; set; }
        string Name { get; set; }
        int ProcessTypeId { get; set; }
        int SecurityLevelId { get; set; }
        string UserId { get; set; }
    }
}