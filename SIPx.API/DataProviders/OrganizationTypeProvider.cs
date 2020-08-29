
using Dapper;
using SIPx.Shared;
//using SIPx.Shared;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public class OrganizationTypeProvider : IOrganizationTypeProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public OrganizationTypeProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }

        public async Task<string> CreatePostCheck(OrganizationTypeCreatePost OrganizationType)
        {
            string usp = "usp_OrganizationTypeCreatePostCheck @LanguageId, @Name, @UserId ";
            var CheckString = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, OrganizationType);
            return CheckString;
        }

        public async Task<string> CreatePost(OrganizationTypeCreatePost OrganizationType)
        {
            string usp = "usp_OrganizationTypeCreatePost @Internal, @LegalEntity,  @LanguageId, @Name, @Description, @MenuName, @MouseOver, @UserId ";
            var String = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, OrganizationType);
            return String;
        }

        public Task<List<OrganizationTypeIndexGet>> IndexGet(string UserId)
        {
            string usp = "usp_OrganizationTypeIndexGet @UserID";
            return _sqlDataAccess.LoadData<OrganizationTypeIndexGet, dynamic>(usp, new { UserId = UserId });

        }

        public Task<OrganizationType> UpdateGet(string UserId, int OrganizationTypeId)
        {
            string usp = "usp_OrganizationTypeUpdateGet @UserId, @OrganizationTypeID";
            return _sqlDataAccess.LoadSingleRecord<OrganizationType, dynamic>(usp, new { UserId = UserId, OrganizationTypeId = OrganizationTypeId });

        }

        public bool UpdatePost(OrganizationTypeUpdateGet OrganizationType)
        {
            string usp = "usp_OrganizationTypeUpdatePost @OrganizationTypeId,  @Internal, @LegalEntity,  @LanguageId, @Name, @Description, @MenuName, @MouseOver,  @ModifierId";
            _sqlDataAccess.SaveData<OrganizationTypeUpdateGet>(usp, OrganizationType);
            return true;
        }

        public Task<OrganizationTypeDeleteGet> DeleteGet(string UserId, int OrganizationTypeId)
        {
            string usp = "usp_OrganizationTypeDeleteGet @UserId, @OrganizationTypeID";
            return _sqlDataAccess.LoadSingleRecord<OrganizationTypeDeleteGet, dynamic>(usp, new { UserId, OrganizationTypeId });

        }

        public bool DeletePost(int OrganizationTypeId)
        {
            string usp = "usp_OrganizationTypeDeletePost @OrganizationTypeId";
            _sqlDataAccess.SaveData<dynamic>(usp, new { OrganizationTypeId = OrganizationTypeId });
            return true;
        }

        public Task<List<OrganizationTypeLanguage>> LanguageIndexGet(string UserId, int OrganizationTypeId)
        {
            string usp = "usp_OrganizationTypeLanguageIndexGet @UserId, @OrganizationTypeID";
            return _sqlDataAccess.LoadData<OrganizationTypeLanguage, dynamic>(usp, new { UserId = UserId, OrganizationTypeId = OrganizationTypeId });

        }

        public Task<OrganizationTypeLanguage> LanguageUpdateGet(string UserId, int OrganizationTypeLanguageId)
        {
            string usp = "usp_OrganizationTypeLanguageUpdateGet @UserId, @OrganizationTypeLanguageID";
            return _sqlDataAccess.LoadSingleRecord<OrganizationTypeLanguage, dynamic>(usp, new { UserId = UserId, OrganizationTypeLanguageId = OrganizationTypeLanguageId });

        }

        public async Task<List<OrganizationTypeList>> List(string UserId)
        {
            string usp = "usp_OrganizationTypeList @UserID";
            var x = await _sqlDataAccess.LoadData<OrganizationTypeList, dynamic>(usp, new { UserId = UserId });
            return x;
        }
    }
}
