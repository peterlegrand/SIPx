
using Dapper;
using SIPx.API.Models;
using SIPx.Shared;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public class CheckProvider : ICheckProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public CheckProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }

        public async Task<List<int>> NewProcessGetInitialTemplateList()
        {
            string usp = "usp_NewProcessGetInitialTemplateFlowList";
            var x = await _sqlDataAccess.LoadData<int>(usp);
            return x;
        }

        public async Task<bool> CheckClassification(int ClassificationID)
        {
            string usp = "usp_CheckClassification @ClassificationID";
            var x = await _sqlDataAccess.LoadData<bool, dynamic>(usp, new { ClassificationID = ClassificationID });
            return x.First();
        }
        public async Task<bool> CheckClassificationValue(int ClassificationValueID)
        {
            string usp = "usp_CheckClassificationValue @ClassificationValueID";
            var x = await _sqlDataAccess.LoadData<bool, dynamic>(usp, new { ClassificationValueID = ClassificationValueID });
            return x.First();
        }
        public async Task<bool> CheckContent(int ContentID)
        {
            string usp = "usp_CheckContent @ContentID";
            var x = await _sqlDataAccess.LoadData<bool, dynamic>(usp, new { ContentID = ContentID });
            return x.First();
        }
        public async Task<bool> CheckCountry(int CountryID)
        {
            string usp = "usp_CheckCountry @CountryID";
            var x = await _sqlDataAccess.LoadData<bool, dynamic>(usp, new { CountryID = CountryID });
            return x.First();
        }
        public async Task<bool> CheckLanguage(int LanguageID)
        {
            string usp = "usp_CheckLanguage @LanguageID";
            var x = await _sqlDataAccess.LoadData<bool, dynamic>(usp, new { LanguageID = LanguageID });
            return x.First();
        }
        public async Task<bool> CheckOrganization(int OrganizationID)
        {
            string usp = "usp_CheckOrganization @OrganizationID";
            var x = await _sqlDataAccess.LoadData<bool, dynamic>(usp, new { OrganizationID = OrganizationID });
            return x.First();
        }
        public async Task<bool> CheckOrganizationRole(string RoleID)
        {
            string usp = "usp_CheckOrganizationRole RoleID";
            var x = await _sqlDataAccess.LoadData<bool, dynamic>(usp, new { RoleID = RoleID });
            return x.First();
        }
        public async Task<bool> CheckProject(int ProjectID)
        {
            string usp = "usp_CheckProject @ProjectID";
            var x = await _sqlDataAccess.LoadData<bool, dynamic>(usp, new { ProjectID = ProjectID });
            return x.First();
        }
        public async Task<bool> CheckProjectRole(string RoleID)
        {
            string usp = "usp_CheckProjectRole RoleID";
            var x = await _sqlDataAccess.LoadData<bool, dynamic>(usp, new { RoleID = RoleID });
            return x.First();
        }
        public async Task<bool> CheckRole(string RoleID)
        {
            string usp = "usp_CheckRole @RoleID";
            var x = await _sqlDataAccess.LoadData<bool, dynamic>(usp, new { RoleID = RoleID });
            return x.First();
        }
        public async Task<bool> CheckSecurityLevel(int SecurityLevelID)
        {
            string usp = "usp_CheckSecurityLevel @SecurityLevelID";
            var x = await _sqlDataAccess.LoadData<bool, dynamic>(usp, new { SecurityLevelID = SecurityLevelID });
            return x.First();
        }
        public async Task<bool> CheckUser(string UserID)
        {
            string usp = "usp_CheckUser @UserID";
            var x = await _sqlDataAccess.LoadData<bool, dynamic>(usp, new { UserID = UserID });
            return x.First();
        }
        public async Task<bool> CheckUserRelation(int PersonRelationID)
        {
            string usp = "usp_CheckUserRelation @PersonRelationID";
            var x = await _sqlDataAccess.LoadData<bool, dynamic>(usp, new { PersonRelationID = PersonRelationID });
            return x.First();
        }
    }
}
