
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
    public class OrganizationTypePropertyProvider : IOrganizationTypePropertyProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public OrganizationTypePropertyProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }

        public async Task<List<ErrorMessage>> CreatePostCheck(ObjectTypePropertyCreateGet OrganizationTypeProperty)
        {
            string usp = "usp_OrganizationTypePropertyCreatePostCheck @OrganizationTypeId, @PropertyId , @ObjectTypePropertyStatusId, @UserId  ";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, OrganizationTypeProperty);
            return ErrorMessages;
        }

        public async Task<string> CreatePost(ObjectTypePropertyCreateGet OrganizationTypeProperty)
        {
            string usp = "usp_OrganizationTypePropertyCreatePost @OrganizationTypeId, @PropertyId , @ObjectTypePropertyStatusId, @UserId  ";
            var String = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, OrganizationTypeProperty);
            return String;
        }

        public Task<List<ObjectTypePropertyIndexGet>> IndexGet(string UserId, int OrganizationTypeId)
        {
            string usp = "usp_OrganizationTypePropertyIndexGet @UserID, @OrganizationTypeId";
            return _sqlDataAccess.LoadData<ObjectTypePropertyIndexGet, dynamic>(usp, new { UserId = UserId, OrganizationTypeId = OrganizationTypeId });

        }

        public Task<ObjectTypePropertyUpdateGet> UpdateGet(string UserId, int OrganizationTypePropertyId)
        {
            string usp = "usp_OrganizationTypePropertyUpdateGet @UserId, @OrganizationTypePropertyID";
            return _sqlDataAccess.LoadSingleRecord<ObjectTypePropertyUpdateGet, dynamic>(usp, new { UserId = UserId, OrganizationTypePropertyId = OrganizationTypePropertyId });

        }
        public async Task<List<ErrorMessage>> UpdatePostCheck(ObjectTypePropertyUpdateGet OrganizationTypeProperty)
        {
            string usp = "usp_OrganizationTypePropertyUpdatePostCheck @OrganizationTypePropertyId , @PropertyId, @OrganizationTypePropertyStatusId, @UserId ";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, OrganizationTypeProperty);
            return ErrorMessages;
        }

        public bool UpdatePost(ObjectTypePropertyUpdateGet OrganizationTypeProperty)
        {
            string usp = "usp_OrganizationTypePropertyUpdatePost @OrganizationTypePropertyId ,  @PropertyId, @OrganizationTypePropertyStatusId, @UserId ";
            _sqlDataAccess.SaveData<ObjectTypePropertyUpdateGet>(usp, OrganizationTypeProperty);
            return true;
        }

        public Task<ObjectTypePropertyDeleteGet> DeleteGet(string UserId, int OrganizationTypePropertyId)
        {
            string usp = "usp_OrganizationTypePropertyDeleteGet @UserId, @OrganizationTypePropertyID";
            return _sqlDataAccess.LoadSingleRecord<ObjectTypePropertyDeleteGet, dynamic>(usp, new { UserId, OrganizationTypePropertyId });

        }

        public bool DeletePost(string UserId, int OrganizationTypePropertyId)
        {
            string usp = "usp_OrganizationTypePropertyDeletePost @UserId, @OrganizationTypePropertyID";
            _sqlDataAccess.SaveData<dynamic>(usp, new { UserId, OrganizationTypePropertyId });
            return true;
        }

        public async Task<List<ErrorMessage>> DeletePostCheck(string UserId, int OrganizationTypePropertyId)
        {
            string usp = "usp_OrganizationTypePropertyDeletePostCheck @UserId, @OrganizationTypePropertyID";
            _sqlDataAccess.SaveData<dynamic>(usp, new { UserId, OrganizationTypePropertyId });
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, new { UserId, OrganizationTypePropertyId });
            return ErrorMessages;
        }

        //PETER TODO Not sure when this is used.
        public async Task<List<ObjectTypePropertyList>> List(string UserId)
        {
            string usp = "usp_OrganizationTypePropertyList @UserID";
            var x = await _sqlDataAccess.LoadData<ObjectTypePropertyList, dynamic>(usp, new { UserId = UserId });
            return x;
        }

    }
}
