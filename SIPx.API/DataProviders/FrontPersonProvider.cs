
using Dapper;
using SIPx.Shared;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public class FrontPersonProvider : IFrontPersonProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public FrontPersonProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }

        public async Task<FrontPersonAdvancedSearchGet> FrontPersonAdvancedSearchGet(string UserId)
        {
            var AdvancedPersonSearch = new FrontPersonAdvancedSearchGet();

            string GenderUsp = "usp_GenderList @UserId";
            AdvancedPersonSearch.Genders = await _sqlDataAccess.LoadData<GenderList, dynamic>(GenderUsp, new { UserId = UserId });
            AdvancedPersonSearch.Genders.Insert(0, new GenderList { GenderId = 0, Name = "Select a gender" });

            string OrganizationUsp = "usp_OrganizationList @UserId";
            AdvancedPersonSearch.Organizations = await _sqlDataAccess.LoadData<OrganizationList, dynamic>(OrganizationUsp, new { UserId = UserId });
            AdvancedPersonSearch.Organizations.Insert(0, new OrganizationList { OrganizationId = 0, Name = "Select an organization" });


            string ProjectUsp = "usp_ProjectListCheckSecurityLevel @UserId";
            AdvancedPersonSearch.Projects = await _sqlDataAccess.LoadData<ProjectList, dynamic>(ProjectUsp, new { UserId = UserId });
            AdvancedPersonSearch.Projects.Insert(0, new ProjectList { ProjectId = 0, Name = "Select an project" });

            string CountriesUsp = "usp_CountryList @UserId";
            AdvancedPersonSearch.Countries = await _sqlDataAccess.LoadData<CountryList, dynamic>(CountriesUsp, new { UserId = UserId });
            AdvancedPersonSearch.Countries.Insert(0, new CountryList { CountryId = 0, Name = "Select an organization type" });


            string RelationWithPersonsUsp = "usp_PersonListWithRelations";
            AdvancedPersonSearch.RelationWithPersons = await _sqlDataAccess.LoadData<PersonList>(RelationWithPersonsUsp);
            AdvancedPersonSearch.RelationWithPersons.Insert(0, new PersonList { PersonId = 0, Name = "Select person" });

            return AdvancedPersonSearch;
        }
        public async Task<List<FrontPersonSearchResult>> FrontPersonAdvancedSearchPost(FrontPersonAdvancedSearchGet SearchData)
        {
            string usp = "usp_FrontPersonAdvancedSearchPost @UserId, @FirstName, @LastName, @NickName, @GenderId, @FromAge, @ToAge, @OrganizationId, @IsUser, @RelationWithPersonId, @ProjectId,@CountryId, @PersonProvinceState , @PersonCity ";
            var x = await _sqlDataAccess.LoadData<FrontPersonSearchResult, dynamic>(usp, SearchData);
            return x;
        }
    }
}
