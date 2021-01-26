using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class FrontContentContentNew
    {
        [Key]
        public int ContentTypeId { get; set; }
        public int NewId { get; set; }
        public int ContentStatusId { get; set; }
        public int LanguageId { get; set; }

        public string ContentTypeName { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public int SecurityLevelId { get; set; }
        public int OrganizationId { get; set; }
        public int ProjectId { get; set; }
        public int CreatorId { get; set; }
        public DateTime CreatedDate { get; set; }
        public string UserId { get; set; }
        public List<FrontContentContentNewClassification> Classifications { get; set; }
        public List<OrganizationList> Organizations { get; set; }
        public List<ProjectList> Projects { get; set; }
        public List<SecurityLevelList> SecurityLevels { get; set; }
        public List<ContentStatusList> ContentStatuses { get; set; }
        public List<LanguageList> Languages { get; set; }
    }
}
