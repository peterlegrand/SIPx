
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

        public async Task<bool> CheckClassification(int ClassificationId)
        {
            string usp = "usp_CheckClassification @ClassificationID";
            var x = await _sqlDataAccess.LoadData<bool, dynamic>(usp, new { ClassificationId = ClassificationId });
            return x.First();
        }
        public async Task<bool> CheckClassificationValue(int ClassificationValueId)
        {
            string usp = "usp_CheckClassificationValue @ClassificationValueID";
            var x = await _sqlDataAccess.LoadData<bool, dynamic>(usp, new { ClassificationValueId = ClassificationValueId });
            return x.First();
        }
        public async Task<bool> CheckContent(int ContentId)
        {
            string usp = "usp_CheckContent @ContentID";
            var x = await _sqlDataAccess.LoadData<bool, dynamic>(usp, new { ContentId = ContentId });
            return x.First();
        }
        public async Task<bool> CheckCountry(int CountryId)
        {
            string usp = "usp_CheckCountry @CountryID";
            var x = await _sqlDataAccess.LoadData<bool, dynamic>(usp, new { CountryId = CountryId });
            return x.First();
        }
        public async Task<bool> CheckLanguage(int LanguageId)
        {
            string usp = "usp_CheckLanguage @LanguageID";
            var x = await _sqlDataAccess.LoadData<bool, dynamic>(usp, new { LanguageId = LanguageId });
            return x.First();
        }
        public async Task<bool> CheckOrganization(int OrganizationId)
        {
            string usp = "usp_CheckOrganization @OrganizationID";
            var x = await _sqlDataAccess.LoadData<bool, dynamic>(usp, new { OrganizationId = OrganizationId });
            return x.First();
        }
        public async Task<bool> CheckOrganizationRole(string RoleId)
        {
            string usp = "usp_CheckOrganizationRole RoleID";
            var x = await _sqlDataAccess.LoadData<bool, dynamic>(usp, new { RoleId = RoleId });
            return x.First();
        }
        public async Task<bool> CheckProject(int ProjectId)
        {
            string usp = "usp_CheckProject @ProjectID";
            var x = await _sqlDataAccess.LoadData<bool, dynamic>(usp, new { ProjectId = ProjectId });
            return x.First();
        }
        public async Task<bool> CheckProjectRole(string RoleId)
        {
            string usp = "usp_CheckProjectRole RoleID";
            var x = await _sqlDataAccess.LoadData<bool, dynamic>(usp, new { RoleId = RoleId });
            return x.First();
        }
        public async Task<bool> CheckRole(string RoleId)
        {
            string usp = "usp_CheckRole @RoleID";
            var x = await _sqlDataAccess.LoadData<bool, dynamic>(usp, new { RoleId = RoleId });
            return x.First();
        }
        public async Task<bool> CheckSecurityLevel(int SecurityLevelId)
        {
            string usp = "usp_CheckSecurityLevel @SecurityLevelID";
            var x = await _sqlDataAccess.LoadData<bool, dynamic>(usp, new { SecurityLevelId = SecurityLevelId });
            return x.First();
        }
        public async Task<bool> CheckUser(string UserId)
        {
            string usp = "usp_CheckUser @UserID";
            var x = await _sqlDataAccess.LoadData<bool, dynamic>(usp, new { UserId = UserId });
            return x.First();
        }
        public async Task<List<ErrorMessage>> NoRightsMessage(string UserId)
        {
            string usp = "usp_NoRightsMessage @UserID";
            var x = await _sqlDataAccess.LoadData<List<ErrorMessage>, dynamic>(usp, new { UserId = UserId });
            return x.First();
        }
        public async Task<bool> CheckUserRelation(int PersonRelationId)
        {
            string usp = "usp_CheckUserRelation @PersonRelationID";
            var x = await _sqlDataAccess.LoadData<bool, dynamic>(usp, new { PersonRelationId = PersonRelationId });
            return x.First();
        }
        public async Task<int> CheckIfRecordExists(string TableName, string IDField, int Id)
        {
            string usp = "usp_CheckIfRecordExists @TableName, @IDField, @ID";
            var x = await _sqlDataAccess.LoadData<int, dynamic>(usp, new { TableName = TableName, IDField = IDField, Id = Id });
            return x.First();
        }
        public async Task<int> CheckIfRecordExists(string TableName, string IDField, string Id)
        {
            string usp = "usp_CheckIfRecordExistsString @TableName, @IDField, @ID";
            var x = await _sqlDataAccess.LoadData<int, dynamic>(usp, new { TableName = TableName, IDField = IDField, Id = Id });
            return x.First();
        }
    }
}
