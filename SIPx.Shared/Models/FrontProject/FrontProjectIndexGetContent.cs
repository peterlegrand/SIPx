using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class FrontProjectIndexGetContent
    {
        [Key]
        public int ContentId { get; set; }
        public int ContentTypeId { get; set; }
        public int OrganizationId { get; set; }
        public int LanguageId { get; set; }
        public int ParentContentId { get; set; }
        public int SecurityLevelId { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public string OrganizationName { get; set; }
        public string TypeName { get; set; }
        public string StatusName { get; set; }
        public string SecurityLevelName { get; set; }
        public string LanguagesName { get; set; }
        public int CreatorId { get; set; }
        public string CreatorName { get; set; }
        public DateTime CreatedDate { get; set; }
        public int ModifierId { get; set; }
        public string ModifierName { get; set; }
        public DateTime ModifiedDate { get; set; }

    }
}
