using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class PageSectionContentConditionCreateGet
    {
        [Key]
        public int PageSectionId { get; set; }
        public int PageSectionContentConditionTypeId { get; set; }
        public string PageSectionContentConditionTypeIdExtended { get; set; }
        public int PageSectionContentConditionInt { get; set; }
        public DateTime PageSectionContentConditionDate { get; set; }
        public string PageSectionContentConditionString { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string MenuName { get; set; }
        public string MouseOver { get; set; }
        public string UserId { get; set; }
        public int ContentTypeId { get; set; }
        public string SelectedUserId { get; set; }
        public string SelectedCreatorId { get; set; }
        public string SelectedModifierId { get; set; }
        public int OrganizationId { get; set; }
        public int SecurityLevelId { get; set; }
        public int ProjectId { get; set; }
        public int ContentStatusId { get; set; }
        public int LanguageId { get; set; }
        public DateTime CreatedFromDate { get; set; }
        public DateTime CreatedToDate { get; set; }
        public DateTime ModifiedFromDate { get; set; }
        public DateTime ModifiedToDate { get; set; }
        public List<PageSectionContentConditionTypeListExtended> PageSectionContentConditionTypes { get; set; }
        public List<UserList> Users { get; set; }
        public List<OrganizationList> Organizations { get; set; }
        public List<SecurityLevelList> SecurityLevels { get; set; }
        public List<ProjectList> Projects { get; set; }
        public List<ContentTypeList> ContentTypes { get; set; }
        public List<ContentStatusList> ContentStatuses { get; set; }
        public List<LanguageList> Languages { get; set; }
        public List<PageSectionContentConditionCreateGetClassifications> Classifications { get; set; }
    }
}
