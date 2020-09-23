using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ContentAdvancedSearchPost
    {
        [Key]
        public string UserId { get; set; }
        public string Contains { get; set; }
        public int OrganizationId { get; set; }
        public int ProjectId { get; set; }
        public int ContentTypeId { get; set; }
        public int SecurityLevelId { get; set; }
        public int ContentStatusId { get; set; }
        public int LanguageId { get; set; }
        public int NoOfClassifications { get; set; }
        public List<int> ClassificationValueIds { get; set; }
        public List<ClassificationValueList> ClassificationValues { get; set; }
        public List<OrganizationList> Organizations { get; set; }
        public List<ProjectList> Projects { get; set; }
        public List<ContentTypeList> ContentTypes { get; set; }
        public List<ContentStatusList> ContentStatuses { get; set; }
        public List<LanguageList> Languages { get; set; }
        public List<SecurityLevelList> SecurityLevels { get; set; }

    }
}
