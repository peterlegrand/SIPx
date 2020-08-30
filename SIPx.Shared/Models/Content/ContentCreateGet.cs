using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ContentCreateGet
    {
        [Key]
        public int? ParentContentId { get; set; }
        public string ParentTitle { get; set; }
        public int ContentTypeId { get; set; }
        public string ContentTypeName { get; set; }
        public int ContentStatusId { get; set; }
        public int LanguageId { get; set; }
        public string LanguageName { get; set; }
        public string Title{ get; set; }
        public string Description { get; set; }
        public int SecurityLevelId { get; set; }
        public int OrganizationId { get; set; }
        public int? ProjectId { get; set; }
        public int ProcessId { get; set; }
        public string CreatorId { get; set; }
        //public List<ContentTypeList> ContentTypes { get; set; }
        //The content type is selected in the first step
        public List<ContentStatusList> ContentStatuses { get; set; }
        public List<SecurityLevelList> SecurityLevels { get; set; }
        public List<OrganizationList> Organizations { get; set; }
        public List<ProjectList> Projects { get; set; }
        public List<ClassificationValueList>[] ClassificationvaluesLists { get; set; }
        //PETER TO DO a list of classification matrix with values based on the type.
    }
}
