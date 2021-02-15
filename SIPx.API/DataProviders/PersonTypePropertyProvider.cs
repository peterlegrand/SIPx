
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
    public class PersonTypePropertyProvider : IPersonTypePropertyProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public PersonTypePropertyProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }

        public async Task<List<ErrorMessage>> CreatePostCheck(ObjectTypePropertyCreateGet PersonTypeProperty)
        {
            string usp = "usp_PersonTypePropertyCreatePostCheck @ObjectTypeId, @PropertyId , @ObjectTypePropertyStatusId, @UserId  ";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, PersonTypeProperty);
            return ErrorMessages;
        }

        public async Task<string> CreatePost(ObjectTypePropertyCreateGet PersonTypeProperty)
        {
            string usp = "usp_PersonTypePropertyCreatePost @ObjectTypeId, @PropertyId , @ObjectTypePropertyStatusId, @UserId  ";
            var String = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, PersonTypeProperty);
            return String;
        }

        public Task<List<ObjectTypePropertyIndexGetGrid>> IndexGet(string UserId, int PersonTypeId)
        {
            string usp = "usp_PersonTypePropertyIndexGet @UserID, @PersonTypeId";
            return _sqlDataAccess.LoadData<ObjectTypePropertyIndexGetGrid, dynamic>(usp, new { UserId = UserId, PersonTypeId = PersonTypeId });

        }

        public Task<ObjectTypePropertyUpdateGet> UpdateGet(string UserId, int PersonTypePropertyId)
        {
            string usp = "usp_PersonTypePropertyUpdateGet @UserId, @PersonTypePropertyID";
            return _sqlDataAccess.LoadSingleRecord<ObjectTypePropertyUpdateGet, dynamic>(usp, new { UserId = UserId, PersonTypePropertyId = PersonTypePropertyId });

        }
        public async Task<List<ErrorMessage>> UpdatePostCheck(ObjectTypePropertyUpdateGet PersonTypeProperty)
        {
            string usp = "usp_PersonTypePropertyUpdatePostCheck @PersonTypePropertyId , @PropertyId, @PersonTypePropertyStatusId, @UserId ";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, PersonTypeProperty);
            return ErrorMessages;
        }

        public bool UpdatePost(ObjectTypePropertyUpdateGet PersonTypeProperty)
        {
            string usp = "usp_PersonTypePropertyUpdatePost @PersonTypePropertyId ,  @PropertyId, @PersonTypePropertyStatusId, @UserId ";
            _sqlDataAccess.SaveData<ObjectTypePropertyUpdateGet>(usp, PersonTypeProperty);
            return true;
        }

        public Task<ObjectTypePropertyDeleteGet> DeleteGet(string UserId, int PersonTypePropertyId)
        {
            string usp = "usp_PersonTypePropertyDeleteGet @UserId, @PersonTypePropertyID";
            return _sqlDataAccess.LoadSingleRecord<ObjectTypePropertyDeleteGet, dynamic>(usp, new { UserId, PersonTypePropertyId });

        }

        public bool DeletePost(string UserId, int PersonTypePropertyId)
        {
            string usp = "usp_PersonTypePropertyDeletePost @UserId, @PersonTypePropertyID";
            _sqlDataAccess.SaveData<dynamic>(usp, new { UserId, PersonTypePropertyId });
            return true;
        }

        public async Task<List<ErrorMessage>> DeletePostCheck(string UserId, int PersonTypePropertyId)
        {
            string usp = "usp_PersonTypePropertyDeletePostCheck @UserId, @PersonTypePropertyID";
            _sqlDataAccess.SaveData<dynamic>(usp, new { UserId, PersonTypePropertyId });
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, new { UserId, PersonTypePropertyId });
            return ErrorMessages;
        }

        //PETER TODO Not sure when this is used.
        public async Task<List<ObjectTypePropertyList>> List(string UserId)
        {
            string usp = "usp_PersonTypePropertyList @UserID";
            var x = await _sqlDataAccess.LoadData<ObjectTypePropertyList, dynamic>(usp, new { UserId = UserId });
            return x;
        }

    }
}
