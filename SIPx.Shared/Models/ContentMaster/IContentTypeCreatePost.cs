using System.Collections.Generic;

namespace SIPx.Shared
{
    public interface IContentTypeCreatePost
    {
        List<ContentTypeCreatePostClassification> ContentTypeClassifications { get; set; }
        int ContentTypeGroupID { get; set; }
        string Description { get; set; }
        string MenuName { get; set; }
        string MouseOver { get; set; }
        string Name { get; set; }
        int ProcessTemplateID { get; set; }
        int SecurityLevelID { get; set; }
        string UserId { get; set; }
    }
}