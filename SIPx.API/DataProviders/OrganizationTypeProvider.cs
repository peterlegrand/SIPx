
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

        public async Task<List<ErrorMessage>> CreatePostCheck(OrganizationTypeCreateGet OrganizationType)
        {
            string usp = "usp_OrganizationTypeCreatePostCheck @Internal, @LegalEntity,@CodePrefix , @CodeSuffix , @CodeTypeId ,  @Name, @Description,  @MenuName, @MouseOver,@Color, @IconId, @UserId ";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, OrganizationType);
            return ErrorMessages;
        }
        public Task<string> ReturnName(string UserId, int OrganizationTypeId)
        {
            string usp = "usp_OrganizationTypeReturnName @UserId, @OrganizationTypeID";
            return _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, new { UserId = UserId, OrganizationTypeId = OrganizationTypeId });

        }

        public async Task<string> CreatePost(OrganizationTypeCreateGet OrganizationType)
        {
            string usp = "usp_OrganizationTypeCreatePost @Internal, @LegalEntity,@CodePrefix , @CodeSuffix , @CodeTypeId ,  @Name, @Description,  @MenuName, @MouseOver,@Color, @IconId, @UserId ";
            var String = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, OrganizationType);
            return String;
        }

        public Task<List<OrganizationTypeIndexGet>> IndexGet(string UserId)
        {
            string usp = "usp_OrganizationTypeIndexGet @UserID";
            return _sqlDataAccess.LoadData<OrganizationTypeIndexGet, dynamic>(usp, new { UserId = UserId });

        }

        public Task<OrganizationTypeUpdateGet> UpdateGet(string UserId, int OrganizationTypeId)
        {
            string usp = "usp_OrganizationTypeUpdateGet @UserId, @OrganizationTypeID";
            return _sqlDataAccess.LoadSingleRecord<OrganizationTypeUpdateGet, dynamic>(usp, new { UserId = UserId, OrganizationTypeId = OrganizationTypeId });

        }
        public async Task<List<ErrorMessage>> UpdatePostCheck(OrganizationTypeUpdateGet OrganizationType)
        {
            string usp = "usp_OrganizationTypeUpdatePostCheck @OrganizationTypeId,  @Internal, @LegalEntity,@CodePrefix , @CodeSuffix , @CodeTypeId ,  @Name, @Description, @MenuName, @MouseOver,  @ModifierId";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, OrganizationType);
            return ErrorMessages;
        }
        public bool UpdatePost(OrganizationTypeUpdateGet OrganizationType)
        {
            string usp = "usp_OrganizationTypeUpdatePost @OrganizationTypeId,  @Internal, @LegalEntity,@CodePrefix , @CodeSuffix , @CodeTypeId ,  @Name, @Description, @MenuName, @MouseOver,  @ModifierId";
            _sqlDataAccess.SaveData<OrganizationTypeUpdateGet>(usp, OrganizationType);
            return true;
        }

        public Task<OrganizationTypeDeleteGet> DeleteGet(string UserId, int OrganizationTypeId)
        {
            string usp = "usp_OrganizationTypeDeleteGet @UserId, @OrganizationTypeID";
            return _sqlDataAccess.LoadSingleRecord<OrganizationTypeDeleteGet, dynamic>(usp, new { UserId, OrganizationTypeId });

        }

        public bool DeletePost(string UserId, int OrganizationTypeId)
        {
            string usp = "usp_OrganizationTypeDeletePost @UserId, @OrganizationTypeID";
            _sqlDataAccess.SaveData<dynamic>(usp, new { UserId, OrganizationTypeId });
            return true;
        }
        public async Task<List<ErrorMessage>> DeletePostCheck(string UserId, int OrganizationTypeId)
        {
            string usp = "usp_OrganizationTypeDeletePostCheck @UserId, @OrganizationTypeID";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, new { UserId, OrganizationTypeId });
            return ErrorMessages;
        }

        public Task<List<OrganizationTypeLanguageIndexGet>> LanguageIndexGet(string UserId, int OrganizationTypeId)
        {
            string usp = "usp_OrganizationTypeLanguageIndexGet @UserId, @OrganizationTypeID";
            return _sqlDataAccess.LoadData<OrganizationTypeLanguageIndexGet, dynamic>(usp, new { UserId = UserId, OrganizationTypeId = OrganizationTypeId });

        }



        public async Task<List<OrganizationTypeList>> List(string UserId)
        {
            string usp = "usp_OrganizationTypeList @UserID";
            var x = await _sqlDataAccess.LoadData<OrganizationTypeList, dynamic>(usp, new { UserId = UserId });
            return x;
        }
        public async Task<List<OrganizationTypeList>> ListExternal(string UserId)
        {
            string usp = "usp_OrganizationTypeListExternal @UserID";
            var x = await _sqlDataAccess.LoadData<OrganizationTypeList, dynamic>(usp, new { UserId = UserId });
            return x;
        }
    }
}
