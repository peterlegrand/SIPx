
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
    public class DevFrontOrganizationProvider : IFrontOrganizationProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public DevFrontOrganizationProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }

        public async Task<FrontOrganizationDashboard> Dashboard(string UserId, int OrganizationId)
        {
            FrontOrganizationDashboard Organization = new FrontOrganizationDashboard();
            Organization.CanCreate = true;
            Organization.CanEdit = true;
            Organization.CreatedDate = DateTime.Now;
            Organization.CreatorId = 1;
            Organization.CreatorName = "John Cleese";
            Organization.Description = "Absegami High School is a four-year comprehensive public high school serving students in ninth through twelfth grades in Galloway Township, Atlantic County, New Jersey, United States The student body comes from Galloway Township.";
            Organization.ModifiedDate = DateTime.Now;
            Organization.ModifierId = 1;
            Organization.ModifierName = "John Cleese";
            Organization.Name = "Absegami High School";
            Organization.OrganizationId = 1;
            Organization.OrganizationTypeId = 1;
            Organization.OrganizationTypeName = "High school";
            Organization.ParentOrganizationId = 2;
            Organization.ParentOrganizationName = "Greater Egg Harbor Regional High School District";
            Organization.SecurityLevelId = 5;
            Organization.SecurityLevelName = "Level 5";
            Organization.StatusName = "Active";
            return Organization;
        }
        public async Task<List<FrontOrganizationDashboardAddress>> DashboardAddress(string CurrentUserId, int SelectedOrganizationId)
        {
            List<FrontOrganizationDashboardAddress> Addresses = new List<FrontOrganizationDashboardAddress>();
            Addresses.Add(new FrontOrganizationDashboardAddress { Address1 = "Wrangleboro Road", AddressTypeName = "Visit address", City = "Galloway", CountryName = "United states of America", PostalCode = " NJ 08205", CreatedDate = DateTime.Now, CreatorId = 1, CreatorName = "John Cleese", HouseNumber = "201", HouseNumberExt = "S", ModifiedDate = DateTime.Now, ModifierId = 1, ModifierName = "John Cleese", ProvinceState = "New Jersey" });

            return Addresses;
        }

        public async Task<List<FrontOrganizationDashboardTelecom>> DashboardTelecom(string CurrentUserId, int SelectedOrganizationId)
        {
            List<FrontOrganizationDashboardTelecom> Telecoms = new List<FrontOrganizationDashboardTelecom>();
            Telecoms.Add(new FrontOrganizationDashboardTelecom { AreaCode = "609", CountryCode = "1", CreatedDate = DateTime.Now, CreatorId = 1, CreatorName = "John Cleese", ModifiedDate = DateTime.Now, ModifierId = 1, ModifierName = "John Cleese", OrganizationTelecomID = 1, TelecomTypeName = "Phone", TelecomValue = "652-1372" });
            Telecoms.Add(new FrontOrganizationDashboardTelecom { AreaCode = "609", CountryCode = "1", CreatedDate = DateTime.Now, CreatorId = 1, CreatorName = "John Cleese", ModifiedDate = DateTime.Now, ModifierId = 1, ModifierName = "John Cleese", OrganizationTelecomID = 1, TelecomTypeName = "Fax", TelecomValue = "652-0139"});
            return Telecoms;
        }

        public async Task<List<FrontOrganizationDashboardSubOrganization>> DashboardSubOrganization(string UserId, int OrganizationId)
        {
            List<FrontOrganizationDashboardSubOrganization> SubOrganizations = new List<FrontOrganizationDashboardSubOrganization>();
            SubOrganizations.Add(new FrontOrganizationDashboardSubOrganization { CreatedDate = DateTime.Now, CreatorId = 1, CreatorName = "John Cleese", Description = "Grade 9 class", ModifiedDate = DateTime.Now, ModifierId = 1, ModifierName = "John Cleese", Name = "G9", OrganizationId = 3, OrganizationTypeId = 2, OrganizationTypeName = "Class", StatusName = "Active" });
            SubOrganizations.Add(new FrontOrganizationDashboardSubOrganization { CreatedDate = DateTime.Now, CreatorId = 1, CreatorName = "John Cleese", Description = "Grade 10 class", ModifiedDate = DateTime.Now, ModifierId = 1, ModifierName = "John Cleese", Name = "G10", OrganizationId = 4, OrganizationTypeId = 2, OrganizationTypeName = "Class", StatusName = "Active" });
            SubOrganizations.Add(new FrontOrganizationDashboardSubOrganization { CreatedDate = DateTime.Now, CreatorId = 1, CreatorName = "John Cleese", Description = "Grade 11 class", ModifiedDate = DateTime.Now, ModifierId = 1, ModifierName = "John Cleese", Name = "G11", OrganizationId = 5, OrganizationTypeId = 2, OrganizationTypeName = "Class", StatusName = "Active" });
            SubOrganizations.Add(new FrontOrganizationDashboardSubOrganization { CreatedDate = DateTime.Now, CreatorId = 1, CreatorName = "John Cleese", Description = "Grade 12 class", ModifiedDate = DateTime.Now, ModifierId = 1, ModifierName = "John Cleese", Name = "G12", OrganizationId = 6, OrganizationTypeId = 2, OrganizationTypeName = "Class", StatusName = "Active" });
            
           return SubOrganizations;
        }

        public async Task<List<FrontOrganizationDashboardPersonRole>> DashboardPersonRoles(string UserId, int OrganizationId)
        {
            List<FrontOrganizationDashboardPersonRole> PersonRoles = new List<FrontOrganizationDashboardPersonRole>();
            PersonRoles.Add(new FrontOrganizationDashboardPersonRole { DefaultOrganizationId = 1, FirstName = "Douglas", LastName = "Adams", OrganizationName = "Absegami High School", PersonId = 1, RoleId = "abc", RoleName = "Parent coordinator", UserId = "abcd1" });
            PersonRoles.Add(new FrontOrganizationDashboardPersonRole { DefaultOrganizationId = 1, FirstName = "Ford", LastName = "Prefect", OrganizationName = "Absegami High School", PersonId = 2, RoleId = "abc", RoleName = "Parent coordinator", UserId = "abcd2" });
            PersonRoles.Add(new FrontOrganizationDashboardPersonRole { DefaultOrganizationId = 1, FirstName = "Zefod", LastName = "Beeblebrox", OrganizationName = "Absegami High School", PersonId = 3, RoleId = "abc", RoleName = "Parent coordinator", UserId = "abcd3" });
            PersonRoles.Add(new FrontOrganizationDashboardPersonRole { DefaultOrganizationId = 1, FirstName = "Arthur", LastName = "Dent", OrganizationName = "Absegami High School", PersonId = 4, RoleId = "xyz", RoleName = "Library Supervisor", UserId = "abcd4" });

            return PersonRoles;
        }

        public async Task<List<FrontOrganizationDashboardPersonPosition>> DashboardPersonPositions(string UserId, int OrganizationId)
        {
            List<FrontOrganizationDashboardPersonPosition> PersonPositions = new List<FrontOrganizationDashboardPersonPosition>();
            PersonPositions.Add(new FrontOrganizationDashboardPersonPosition { DefaultOrganizationId = 1, FirstName = "Douglas", LastName = "Adams", OrganizationName = "Absegami High School", PersonId = 1, PositionId = 1, PositionName= "Teacher", UserId = "abcd1" });
            PersonPositions.Add(new FrontOrganizationDashboardPersonPosition { DefaultOrganizationId = 1, FirstName = "Ford", LastName = "Prefect", OrganizationName = "Absegami High School", PersonId = 2, PositionId = 1, PositionName = "Teacher", UserId = "abcd2" });
            PersonPositions.Add(new FrontOrganizationDashboardPersonPosition { DefaultOrganizationId = 1, FirstName = "Zefod", LastName = "Beeblebrox", OrganizationName = "Absegami High School", PersonId = 3, PositionId = 1, PositionName = "Teacher", UserId = "abcd3" });
            PersonPositions.Add(new FrontOrganizationDashboardPersonPosition { DefaultOrganizationId = 1, FirstName = "Arthur", LastName = "Dent", OrganizationName = "Absegami High School", PersonId = 4, PositionId = 2, PositionName = "Principal", UserId = "abcd4" });
            return PersonPositions;
        }

        public async Task<List<FrontOrganizationDashboardContent>> DashboardContent(string UserId, int OrganizationId)
        {
            List<FrontOrganizationDashboardContent> Contents = new List<FrontOrganizationDashboardContent>();
            Contents.Add(new FrontOrganizationDashboardContent { ContentId = 1, ContentTypeId = 1, CreatedDate = DateTime.Now, CreatorId = 1, CreatorName = "John Cleese", Description = "In A Vanishing Island lesson, students watch a 9-minute film, Isle de Jean Charles by Emmanuel Vaughan-Lee, about a tiny island community off the Louisiana coast and examine how coastal areas are impacted by the affects of climate change. The film explores the changes taking place on the island through the lives of two residents whose families are facing a future where rising seas, coastal erosion, and storms are threatening to wash their home away.", LanguageId = 41, LanguagesName = "English", ModifiedDate = DateTime.Now, ModifierId = 1, ModifierName = "John Cleese", OrganizationId = 1, OrganizationName = "Absegami High School", ParentContentId = 0, SecurityLevelId = 5, SecurityLevelName = "Level 5", StatusName = "Active", Title = "A VANISHING ISLAND | GLOBAL ONENESS PROJECT", TypeName = "Assignment Explanation" });
            Contents.Add(new FrontOrganizationDashboardContent { ContentId = 2, ContentTypeId = 1, CreatedDate = DateTime.Now, CreatorId = 1, CreatorName = "John Cleese", Description = "Scientists and engineers, including Greg Characklis at the University of North Carolina at Chapel Hill, are studying the connections between water, food and energy in the human water cycle to develop new, sustainable ways of meeting our water needs.", LanguageId = 41, LanguagesName = "English", ModifiedDate = DateTime.Now, ModifierId = 1, ModifierName = "John Cleese", OrganizationId = 1, OrganizationName = "Absegami High School", ParentContentId = 0, SecurityLevelId = 5, SecurityLevelName = "Level 5", StatusName = "Active", Title = "HUMAN WATER CYCLE: WATER, FOOD & ENERGY", TypeName = "Assignment Explanation" });
            Contents.Add(new FrontOrganizationDashboardContent { ContentId = 3, ContentTypeId = 2, CreatedDate = DateTime.Now, CreatorId = 1, CreatorName = "John Cleese", Description = "Demonstrate command of the conventions of standard English grammar and usage when writing or speaking.", LanguageId = 41, LanguagesName = "English", ModifiedDate = DateTime.Now, ModifierId = 1, ModifierName = "John Cleese", OrganizationId = 1, OrganizationName = "Absegami High School", ParentContentId = 0, SecurityLevelId = 5, SecurityLevelName = "Level 5", StatusName = "Active", Title = "CCSS.ELA-LITERACY.L.9-10.1", TypeName = "Assignment Explanation" });
            Contents.Add(new FrontOrganizationDashboardContent { ContentId = 4, ContentTypeId = 2, CreatedDate = DateTime.Now, CreatorId = 1, CreatorName = "John Cleese", Description = "Determine or clarify the meaning of unknown and multiple-meaning words and phrases based on grades 9-10 reading and content, choosing flexibly from a range of strategies.", LanguageId = 41, LanguagesName = "English", ModifiedDate = DateTime.Now, ModifierId = 1, ModifierName = "John Cleese", OrganizationId = 1, OrganizationName = "Absegami High School", ParentContentId = 0, SecurityLevelId = 5, SecurityLevelName = "Level 5", StatusName = "Active", Title = "CCSS.ELA-LITERACY.L.9-10.4", TypeName = "Assignment Explanation" });

            return Contents;
        }

        public async Task<List<FrontOrganizationDashboardProcess>> DashboardProcess(string UserId, int OrganizationId)
        {
            List<FrontOrganizationDashboardProcess> Processes = new List<FrontOrganizationDashboardProcess>();
            Processes.Add(new FrontOrganizationDashboardProcess { ProcessId = 1, ProcessTypeName = "Announcement", ProcessTypeStageTypeName = "Planned", StageTypeColor = "ffffff", StageTypeIconFileName = "Clock.png", Subject = "all disposable items are phased out in the canteen", TemplateColor = "aaaaaa", TemplateIconFileName = "Event.png" });
            Processes.Add(new FrontOrganizationDashboardProcess { ProcessId = 1, ProcessTypeName = "Announcement", ProcessTypeStageTypeName = "Completed", StageTypeColor = "ffffff", StageTypeIconFileName = "Stamp.png", Subject = "The solar array is operational", TemplateColor = "222222", TemplateIconFileName = "Event.png" });
            Processes.Add(new FrontOrganizationDashboardProcess { ProcessId = 1, ProcessTypeName = "Common core", ProcessTypeStageTypeName = "Planned", StageTypeColor = "333333", StageTypeIconFileName = "Clock.png", Subject = "New common core standards are implemented", TemplateColor = "aaaaaa", TemplateIconFileName = "Standard.png" });
            return Processes;
        }

        public async Task<string> IndexGetSubOrganizationTree(string UserId, int OrganizationId)
        {
            string usp = "usp_SubOrganizationsToJason @OrganizationId, @IsRoot, @UserId ";
            var x = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, new { OrganizationId = OrganizationId, IsRoot = 1, UserId = UserId });
            return x;
        }

        public async Task<FrontOrganizationAdvancedSearchGet> FrontOrganizationAdvancedSearchGet(string UserId)
        {
            var AdvancedOrganizationSearch = new FrontOrganizationAdvancedSearchGet();

            string ParentOrganizationsUsp = "usp_OrganizationListParentOrganizations @UserId";
            AdvancedOrganizationSearch.ParentOrganizations = await _sqlDataAccess.LoadData<OrganizationList, dynamic>(ParentOrganizationsUsp, new { UserId = UserId });
            AdvancedOrganizationSearch.ParentOrganizations.Insert(0, new OrganizationList { OrganizationId = 0, Name = "Select a parent organization" });

            string StatusesUsp = "usp_StatusList @UserId";
            AdvancedOrganizationSearch.Statuses = await _sqlDataAccess.LoadData<StatusList, dynamic>(StatusesUsp, new { UserId = UserId });
            AdvancedOrganizationSearch.Statuses.Insert(0, new StatusList { StatusId = 0, Name = "Select a status" });


            string OrganizationTypesUsp = "usp_OrganizationTypeList @UserId";
            AdvancedOrganizationSearch.OrganizationTypes = await _sqlDataAccess.LoadData<OrganizationTypeList, dynamic>(OrganizationTypesUsp, new { UserId = UserId });
            AdvancedOrganizationSearch.OrganizationTypes.Insert(0, new OrganizationTypeList { OrganizationTypeId = 0, Name = "Select an organization type" });

            string CountriesUsp = "usp_CountryList @UserId";
            AdvancedOrganizationSearch.Countries = await _sqlDataAccess.LoadData<CountryList, dynamic>(CountriesUsp, new { UserId = UserId });
            AdvancedOrganizationSearch.Countries.Insert(0, new CountryList { CountryId = 0, Name = "Select an organization type" });

            return AdvancedOrganizationSearch;
        }

        public async Task<List<OrganizationList>> FrontOrganizationAdvancedSearchPost(FrontOrganizationAdvancedSearchGet SearchData)
        {
            string usp = "usp_FrontOrganizationAdvancedSearchPost @UserId, @OrganizationName, @OrganizationParentId, @OrganizationStatusId, @OrganizationTypeId , @CountryId, @OrganizationProvinceState , @OrganizationCity , @LegalEntity, @Internal, @IAmMemberOfOrganization ";
            var x = await _sqlDataAccess.LoadData<OrganizationList, dynamic>(usp, SearchData);
            return x;
        }
    }
}
