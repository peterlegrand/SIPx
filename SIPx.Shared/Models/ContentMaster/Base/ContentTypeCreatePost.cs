using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ContentTypeCreatePost : IContentTypeCreatePost
    {
        [Key]
        public int ContentTypeGroupId { get; set; }
        public int ProcessTemplateId { get; set; }
        public int SecurityLevelId { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string MenuName { get; set; }
        public string MouseOver { get; set; }
        public string UserId { get; set; }
        public List<ContentTypeCreatePostClassification> ContentTypeClassifications { get; set; }

    }
}
