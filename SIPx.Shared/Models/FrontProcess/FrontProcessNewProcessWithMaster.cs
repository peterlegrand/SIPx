using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Net.Http.Headers;
using System.Text;

namespace SIPx.Shared
{
    public class FrontProcessNewProcessWithMaster : INewProcessWithMaster
    {

        public List<FrontProcessNewProcessField> ProcessFields { get; set; }
      //  public List<FrontProcessNewProcessDefaultValues> DefaultFieldValues { get; set; }
        public List<UserList> Users { get; set; }
        public List<ProjectList> Projects { get; set; }
        public List<OrganizationList> Organizations { get; set; }
        public List<LanguageList> Languages { get; set; }
        public List<ClassificationList> Classifications { get; set; }
        public List<ClassificationValueList> ClassificationValues { get; set; }
        public List<ContentList> Contents { get; set; }
        public List<CountryList> Countries { get; set; }
        public List<SecurityLevelList> SecurityLevels { get; set; }
        public List<RoleList> Roles { get; set; }
        public List<PersonList> Persons { get; set; }
        public int ProcessTemplateId { get; set; }
        public string UserId { get; set; }
        public int ProcessTemplateFlowId { get; set; }
        public string ErrorHandlingScript { get; set; }
    }
}
