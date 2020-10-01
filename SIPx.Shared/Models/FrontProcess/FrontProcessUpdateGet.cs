using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Net.Http.Headers;
using System.Text;

namespace SIPx.Shared
{
    public class FrontProcessUpdateGet 
    {
        [Key]
        public int ProcessId { get; set; }
        public int ProcessTemplateStageId { get; set; }
        public int ProcessTemplateFlowId { get; set; }
        public string TemplateName { get; set; }
        public string CreatorName { get; set; }
        public int CreatorId { get; set; }
        public DateTime CreatedDate { get; set; }
        public string ModifierName { get; set; }
        public int ModifierId { get; set; }
        public DateTime ModifiedDate { get; set; }
        public List<FrontProcessUpdateGetField> Fields { get; set; }
        public List<UserList> Users { get; set; }
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
    }
}
