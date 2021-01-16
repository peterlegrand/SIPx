using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class FrontContentShowContent
    {
        [Key]
        public int ContentId { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public string ParentContentTitle { get; set; }
        public string ContentStatusName { get; set; }
        public string LanguageName { get; set; }
        public string SecurityLevelName { get; set; }
        public string OrganizationName { get; set; }
        public string ProjectName { get; set; }
        public int ProjectId { get; set; }
        public int OrganizationId { get; set; }
        public bool IsOwner { get; set; }
        public int ContentTypeId { get; set; }
        public string ContentTypeName { get; set; }
        public string CreatorName { get; set; }
        public int CreatorId { get; set; }
        public DateTime CreatedDate { get; set; }
        public string ModifierName { get; set; }
        public int ModifierId { get; set; }
        public DateTime ModifiedDate { get; set; }
        public List<FrontContentShowContentClassificationValue> ClassificationValues { get; set; }
    }
}
