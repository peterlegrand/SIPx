using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ContentTypeCreatePost : IContentTypeCreatePost
    {
        [Key]
        public int ContentTypeGroupID { get; set; }
        public int ProcessTemplateID { get; set; }
        public int SecurityLevelID { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string MenuName { get; set; }
        public string MouseOver { get; set; }
        public string UserId { get; set; }
        public List<ContentTypeCreatePostClassification> ContentTypeClassifications { get; set; }

    }
}
