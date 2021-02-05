using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class PageSectionProcessConditionUpdateGet
    {
        [Key]
        public int PageSectionId { get; set; }
        public int PageSectionProcessConditionId { get; set; }
        public int PageSectionProcessConditionTypeId { get; set; }
        public string PageSectionProcessConditionTypeName { get; set; }
        public string PageSectionProcessConditionTypeIdExtended { get; set; }
        public int PageSectionProcessConditionInt { get; set; }
        public DateTime PageSectionProcessConditionDate { get; set; }
        public string PageSectionProcessConditionString { get; set; }
        public bool PageSectionProcessConditionBit { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string MenuName { get; set; }
        public string MouseOver { get; set; }


        public int ProcessTypeId { get; set; }
        public int ProcessTypeGroupId { get; set; }
        public bool MyCalendar { get; set; }
        public bool PersonalCalendar { get; set; }
        public bool OrganizationCalendar { get; set; }
        public bool ProjectCalendar { get; set; }
        public bool EventCalendar { get; set; }
        public bool IsPersonal { get; set; }
        public bool ShowNew { get; set; }
        public bool ShowSearch { get; set; }
        public bool ShowReport { get; set; }
        public int OrganizationId { get; set; }
        public int ProjectId { get; set; }
        public bool CreatorIsUser { get; set; }
        public string RoleId { get; set; }
        public int SecurityLevelId { get; set; }
        public bool OrganizationOfUser { get; set; }
        public bool OrganizationRoleOfUser { get; set; }
        public string SpecificOrganizationRoleOfUserId { get; set; }
        public bool ProjectRoleOfUser { get; set; }
        public string SpecificProjectRoleOfUserId { get; set; }
        public int RelationUserId { get; set; }
        public int RelationToClassificationValueId { get; set; }
        public int RelationToClassificationId { get; set; }
        public int ContentId { get; set; }
        public int ContentTypeId { get; set; }
        public int ContentTypeGroupId { get; set; }
        public int PersonId { get; set; }


        public string SelectedUserId { get; set; }
        public string UserId { get; set; }
        public int ProcessStageId { get; set; }
        public int ProcessStageTypeId { get; set; }
        public int LanguageId { get; set; }
        public DateTime FromDate { get; set; }
        public DateTime ToDate { get; set; }


        public string CreatorName { get; set; }
        public int CreatorId { get; set; }
        public DateTime CreatedDate { get; set; }
        public string ModifierName { get; set; }
        public int ModifierId { get; set; }
        public DateTime ModifiedDate { get; set; }

        public List<PageSectionProcessConditionTypeListExtended> PageSectionProcessConditionTypes { get; set; }


        public List<ProcessTypeList> ProcessTypes { get; set; }
        public List<ProcessTypeGroupList> ProcessTypeGroups { get; set; }
        public List<OrganizationList> Organizations { get; set; }
        public List<ProjectList> Projects { get; set; }
        public List<RoleList> Roles { get; set; }
        public List<SecurityLevelList> SecurityLevels { get; set; }
        public List<UserList> Users { get; set; }
        public List<ProcessTypeStageTypeList> ProcessTypeStageTypes { get; set; }
        public List<LanguageList> Languages { get; set; }
        public List<PersonList> Persons { get; set; }
        public List<ContentList> Contents { get; set; }
        public List<ContentTypeList> ContentTypes { get; set; }
        public List<ContentTypeGroupList> ContentTypeGroups { get; set; }
        public List<PageSectionProcessConditionCreateGetClassifications> Classifications { get; set; }
    }
}
