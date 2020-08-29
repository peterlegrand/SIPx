
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
    public class FrontOrganizationProvider : IFrontOrganizationProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public FrontOrganizationProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }

        public async Task<FrontOrganizationIndexGet> IndexGet(string UserId, int OrganizationId)
        {
            string usp = "usp_FrontOrganizationIndexGet @UserId  , @OrganizationId";
            var Organization = await _sqlDataAccess.LoadSingleRecord<FrontOrganizationIndexGet, dynamic>(usp, new { UserId = UserId, OrganizationId = OrganizationId });
            return Organization;
        }

        public async Task<List<FrontOrganizationIndexGetSubOrganization>> IndexGetSubOrganization(string UserId, int OrganizationId)
        {
            string usp = "usp_FrontOrganizationIndexGetSubOrganization @UserId, @OrganizationId";
            var x = await _sqlDataAccess.LoadData<FrontOrganizationIndexGetSubOrganization, dynamic>(usp, new { UserId = UserId, OrganizationId = OrganizationId });
            return x;
        }

        public async Task<List<FrontOrganizationIndexGetMember>> IndexGetMember(string UserId, int OrganizationId)
        {
            string usp = "usp_FrontOrganizationIndexGetMember @UserId, @OrganizationId";
            var x = await _sqlDataAccess.LoadData<FrontOrganizationIndexGetMember, dynamic>(usp, new { UserId = UserId, OrganizationId = OrganizationId });
            return x;
        }

        public async Task<List<FrontOrganizationIndexGetContent>> IndexGetContent(string UserId, int OrganizationId)
        {
            string usp = "usp_FrontOrganizationIndexGetContent @UserId, @OrganizationId";
            var x = await _sqlDataAccess.LoadData<FrontOrganizationIndexGetContent, dynamic>(usp, new { UserId = UserId, OrganizationId = OrganizationId });
            return x;
        }

        public async Task<List<FrontOrganizationIndexGetProcess>> IndexGetProcess(string UserId, int OrganizationId)
        {
            string usp = "usp_FrontOrganizationIndexGetProcess @UserId, @OrganizationId";
            var x = await _sqlDataAccess.LoadData<FrontOrganizationIndexGetProcess, dynamic>(usp, new { UserId = UserId, OrganizationId = OrganizationId });
            return x;
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
            AdvancedOrganizationSearch.ParentOrganizations.Insert(0, new OrganizationList {OrganizationId= 0, Name= "Select a parent organization" });

            string StatusesUsp = "usp_StatusList @UserId";
            AdvancedOrganizationSearch.Statuses = await _sqlDataAccess.LoadData<StatusList, dynamic>(StatusesUsp, new { UserId = UserId });
            AdvancedOrganizationSearch.Statuses.Insert(0,new StatusList { StatusId = 0, Name = "Select a status" });


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
            var x = await _sqlDataAccess.LoadData<OrganizationList, dynamic>(usp, SearchData );
            return x;
        }
    }
}
