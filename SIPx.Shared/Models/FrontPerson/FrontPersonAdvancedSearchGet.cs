using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class FrontPersonAdvancedSearchGet
    {
        public string UserId { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string NickName { get; set; }
        public int GenderId { get; set; }
        public string GenderName { get; set; }
        public int FromAge { get; set; }
        public int ToAge { get; set; }
        public int OrganizationId { get; set; }
        public string OrganizationName { get; set; }
        public int IsUser { get; set; }
        public int RelationWithPersonId { get; set; }
        public string RelationWithPersonName { get; set; }
        public int ProjectId { get; set; }
        public string ProjectName { get; set; }
        public int CountryId { get; set; }
        public string CountryName { get; set; }
        public string PersonProvinceState { get; set; }
        public string PersonCity { get; set; }
        public List<GenderList> Genders { get; set; }
        public List<OrganizationList> Organizations { get; set; }
        public List<ProjectList> Projects { get; set; }
        public List<CountryList> Countries { get; set; }
        public List<PersonList> RelationWithPersons { get; set; }
        public List<FrontPersonSearchResult> SearchResult { get; set; }
    }
}
