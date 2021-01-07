
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
            string usp = "usp_FrontPersonAdvancedSearchPost @UserId, @Contains, @Age, @Birthdate, @MainOrganizationId, @IsUser, @RoleId, @OrganizationId, @ProjectId, @CountryId, @ProvinceState , @County , @City, @ClassificationId, @ClassificationValueId ";
            var x = await _sqlDataAccess.LoadData<FrontPersonSearchResult, dynamic>(usp, SearchData);
            return x;
        }

        public async Task<List<ErrorMessage>> CreatePostCheck(FrontPersonCreateGet Person)
        {
            string usp = "usp_FrontPersonCreatePostCheck @Salutation, @FirstName, @MiddleName, @LastName, @PersonalTitle, @Suffix, @NickName, @FirstNameLocal, @MiddleNameLocal, @LastNameLocal, @GenderId, @Birthdate, @DefaultOrganizationId, @UserId ";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, Person);
            return ErrorMessages;
        }

        public async Task<string> CreatePost(FrontPersonCreateGet Person)
        {
            string usp = "usp_FrontPersonCreatePost @Salutation, @FirstName, @MiddleName, @LastName, @PersonalTitle, @Suffix, @NickName, @FirstNameLocal, @MiddleNameLocal, @LastNameLocal, @GenderId, @Birthdate, @DefaultOrganizationId, @UserId ";
            var CheckString = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, Person);
            return CheckString;
        }

        public async Task<int> UpdateGetCheckIfNonUser(int SelectedPersonId)
        {
            string usp = "usp_FrontPersonUpdateGetCheckIfNotUser @SelectedPersonId ";
            var CheckInt = await _sqlDataAccess.LoadSingleRecord<int, dynamic>(usp, new { SelectedPersonId });
            return CheckInt;
        }


        public Task<FrontPersonUpdateGet> UpdateGet(string UserId, int PersonId)
        {
            string usp = "usp_PersonUpdateGet @UserId, @PersonID";
            return _sqlDataAccess.LoadSingleRecord<FrontPersonUpdateGet, dynamic>(usp, new { UserId = UserId, PersonId = PersonId });
        }
        public async Task<List<ErrorMessage>> UpdatePostCheck(FrontPersonUpdateGet Person)
        {
            string usp = "usp_FrontPersonUpdatePostCheck @PersonId , @Salutation, @FirstName, @MiddleName, @LastName, @PersonalTitle, @Suffix, @NickName, @FirstNameLocal, @MiddleNameLocal, @LastNameLocal, @GenderId, @Birthdate, @DeceasedDate, @DefaultOrganizationId, @UserId";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, Person);
            return ErrorMessages;
        }
        public bool UpdatePost(FrontPersonUpdateGet Person)
        {
            string usp = "usp_FrontPersonUpdatePost @PersonId , @Salutation, @FirstName, @MiddleName, @LastName, @PersonalTitle, @Suffix, @NickName, @FirstNameLocal, @MiddleNameLocal, @LastNameLocal, @GenderId, @Birthdate, @DeceasedDate, @DefaultOrganizationId, @UserId ";
            _sqlDataAccess.SaveData<FrontPersonUpdateGet>(usp, Person);
            return true;
        }
        public async Task<FrontPersonDashboard> Dashboard(string CurrentUserId, int SelectedPersonId)
        {
            string usp = "usp_FrontPersonDashboard @CurrentUserId  , @SelectedPersonId";
            var User = await _sqlDataAccess.LoadSingleRecord<FrontPersonDashboard, dynamic>(usp, new { CurrentUserId = CurrentUserId, SelectedPersonId = SelectedPersonId });
            return User;
        }

        public async Task<List<FrontPersonDashboardAddress>> DashboardAddress(string CurrentUserId, int SelectedPersonId)
        {
            string usp = "usp_FrontPersonDashboardAddress @CurrentUserId  , @SelectedPersonId";
            var x = await _sqlDataAccess.LoadData<FrontPersonDashboardAddress, dynamic>(usp, new { CurrentUserId = CurrentUserId, SelectedPersonId = SelectedPersonId });
            return x;
        }

        public async Task<List<FrontPersonDashboardTelecom>> DashboardTelecom(string CurrentUserId, int SelectedPersonId)
        {
            string usp = "usp_FrontPersonDashboardTelecom @CurrentUserId  , @SelectedPersonId";
            var x = await _sqlDataAccess.LoadData<FrontPersonDashboardTelecom, dynamic>(usp, new { CurrentUserId = CurrentUserId, SelectedPersonId = SelectedPersonId });
            return x;
        }

        public async Task<List<FrontPersonDashboardOrganizationRole>> DashboardOrganizationRole(string CurrentUserId, int SelectedPersonId)
        {
            string usp = "usp_FrontPersonDashboardOrganizationRole @CurrentUserId  , @SelectedPersonId";
            var x = await _sqlDataAccess.LoadData<FrontPersonDashboardOrganizationRole, dynamic>(usp, new { CurrentUserId = CurrentUserId, SelectedPersonId = SelectedPersonId });
            return x;
        }
        public async Task<List<FrontPersonDashboardOrganizationPosition>> DashboardOrganizationPosition(string UserId, int SelectedPersonId)
        {
            string usp = "usp_FrontPersonDashboardOrganizationPosition @UserId  , @SelectedPersonId";
            var x = await _sqlDataAccess.LoadData<FrontPersonDashboardOrganizationPosition, dynamic>(usp, new { UserId = UserId, SelectedPersonId = SelectedPersonId });
            return x;
        }

        public async Task<List<FrontPersonDashboardProject>> DashboardProject(string CurrentUserId, int SelectedPersonId)
        {
            string usp = "usp_FrontPersonDashboardProject @CurrentUserId  , @SelectedPersonId";
            var x = await _sqlDataAccess.LoadData<FrontPersonDashboardProject, dynamic>(usp, new { CurrentUserId = CurrentUserId, SelectedPersonId = SelectedPersonId });
            return x;
        }

        public async Task<List<FrontPersonDashboardContent>> DashboardContent(string CurrentUserId, int SelectedPersonId)
        {
            string usp = "usp_FrontPersonDashboardContent  @CurrentUserId  , @SelectedPersonId";
            var x = await _sqlDataAccess.LoadData<FrontPersonDashboardContent, dynamic>(usp, new { CurrentUserId = CurrentUserId, SelectedPersonId = SelectedPersonId });
            return x;
        }

        public async Task<List<FrontPersonDashboardProcess>> DashboardProcess(string CurrentUserId, int SelectedPersonId)
        {
            string usp = "usp_FrontPersonDashboardProcess  @CurrentUserId  , @SelectedPersonId";
            var x = await _sqlDataAccess.LoadData<FrontPersonDashboardProcess, dynamic>(usp, new { CurrentUserId = CurrentUserId, SelectedPersonId = SelectedPersonId });
            return x;
        }



    }
}
