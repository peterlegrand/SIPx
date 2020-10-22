using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class PageSectionConditionCreateGet
    {
        [Key]
        public int PageSectionId { get; set; }
        public int PageSectionConditionTypeId { get; set; }
        public int PageSectionConditionInt { get; set; }
        public DateTime PageSectionConditionDate { get; set; }
        public string PageSectionConditionString { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string MenuName { get; set; }
        public string MouseOver { get; set; }
        public string CreatorId { get; set; }
        public List<PageSectionConditionTypeList> PageSectionConditionTypes { get; set; }
        public List<UserList> Users { get; set; }
        public List<OrganizationList> Organizations { get; set; }
        public List<SecurityLevelList> SecurityLevels { get; set; }
        public List<ProjectList> Projects { get; set; }
        public List<ContentTypeList> ContentTypes { get; set; }
        public List<ContentStatusList> ContentStatuses { get; set; }
        public List<LanguageList> Languages { get; set; }
        public List<PageSectionConditionCreateGetClassifications> Classifications { get; set; }
    }
}
