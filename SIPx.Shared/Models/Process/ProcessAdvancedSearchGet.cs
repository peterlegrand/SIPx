using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace SIPx.Shared
{
    public class ProcessAdvancedSearchPost
    {
        [Key]
        public string UserId { get; set; }
        public string Contains { get; set; }
        public int Number { get; set; }
        public DateTime DateFrom { get; set; }
        public DateTime DateTo { get; set; }
        public string SelectedUserId { get; set; }
        public int OrganizationId { get; set; }
        public int ProjectId { get; set; }
        public int LanguageId { get; set; }
        public int ClassificationId { get; set; }
        public int ClassificationValueId { get; set; }
        public int ContentId { get; set; }
        public int CountryId { get; set; }
        public int SecurityLevelId { get; set; }
        public string RoleId { get; set; }
        public int PersonId { get; set; }
        public int ProcessTypeStageTypeId { get; set; }

        public List<UserList> SelectedUsers { get; set; }
        public List<OrganizationList> Organizations { get; set; }
        public List<ProjectList> Projects { get; set; }
        public List<LanguageList> Languages { get; set; }
        public List<ClassificationList> Classifications { get; set; }
        public List<ClassificationValueList> ClassificationValues { get; set; }
        public List<ContentList> Contents { get; set; }
        public List<CountryList> Countries { get; set; }
        public List<SecurityLevelList> SecurityLevels { get; set; }
        public List<RoleList> Roles { get; set; }
        public List<PersonList> Persons { get; set; }
        public List<ProcessTypeStageTypeList> ProcessTypeStageTypes { get; set; }


    }
}
