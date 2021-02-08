
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
    public class ProjectTypePropertyProvider : IProjectTypePropertyProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public ProjectTypePropertyProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }

        public async Task<List<ErrorMessage>> CreatePostCheck(ObjectTypePropertyCreateGet ProjectTypeProperty)
        {
            string usp = "usp_ProjectTypePropertyCreatePostCheck @ProjectTypeId, @PropertyId , @ObjectTypePropertyStatusId, @UserId  ";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, ProjectTypeProperty);
            return ErrorMessages;
        }

        public async Task<string> CreatePost(ObjectTypePropertyCreateGet ProjectTypeProperty)
        {
            string usp = "usp_ProjectTypePropertyCreatePost @ProjectTypeId, @PropertyId , @ObjectTypePropertyStatusId, @UserId  ";
            var String = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, ProjectTypeProperty);
            return String;
        }

        public Task<List<ObjectTypePropertyIndexGetGrid>> IndexGet(string UserId, int ProjectTypeId)
        {
            string usp = "usp_ProjectTypePropertyIndexGet @UserID, @ProjectTypeId";
            return _sqlDataAccess.LoadData<ObjectTypePropertyIndexGetGrid, dynamic>(usp, new { UserId = UserId, ProjectTypeId = ProjectTypeId });

        }

        public Task<ObjectTypePropertyUpdateGet> UpdateGet(string UserId, int ProjectTypePropertyId)
        {
            string usp = "usp_ProjectTypePropertyUpdateGet @UserId, @ProjectTypePropertyID";
            return _sqlDataAccess.LoadSingleRecord<ObjectTypePropertyUpdateGet, dynamic>(usp, new { UserId = UserId, ProjectTypePropertyId = ProjectTypePropertyId });

        }
        public async Task<List<ErrorMessage>> UpdatePostCheck(ObjectTypePropertyUpdateGet ProjectTypeProperty)
        {
            string usp = "usp_ProjectTypePropertyUpdatePostCheck @ProjectTypePropertyId , @PropertyId, @ProjectTypePropertyStatusId, @UserId ";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, ProjectTypeProperty);
            return ErrorMessages;
        }

        public bool UpdatePost(ObjectTypePropertyUpdateGet ProjectTypeProperty)
        {
            string usp = "usp_ProjectTypePropertyUpdatePost @ProjectTypePropertyId ,  @PropertyId, @ProjectTypePropertyStatusId, @UserId ";
            _sqlDataAccess.SaveData<ObjectTypePropertyUpdateGet>(usp, ProjectTypeProperty);
            return true;
        }

        public Task<ObjectTypePropertyDeleteGet> DeleteGet(string UserId, int ProjectTypePropertyId)
        {
            string usp = "usp_ProjectTypePropertyDeleteGet @UserId, @ProjectTypePropertyID";
            return _sqlDataAccess.LoadSingleRecord<ObjectTypePropertyDeleteGet, dynamic>(usp, new { UserId, ProjectTypePropertyId });

        }

        public bool DeletePost(string UserId, int ProjectTypePropertyId)
        {
            string usp = "usp_ProjectTypePropertyDeletePost @UserId, @ProjectTypePropertyID";
            _sqlDataAccess.SaveData<dynamic>(usp, new { UserId, ProjectTypePropertyId });
            return true;
        }

        public async Task<List<ErrorMessage>> DeletePostCheck(string UserId, int ProjectTypePropertyId)
        {
            string usp = "usp_ProjectTypePropertyDeletePostCheck @UserId, @ProjectTypePropertyID";
            _sqlDataAccess.SaveData<dynamic>(usp, new { UserId, ProjectTypePropertyId });
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, new { UserId, ProjectTypePropertyId });
            return ErrorMessages;
        }

        //PETER TODO Not sure when this is used.
        public async Task<List<ObjectTypePropertyList>> List(string UserId)
        {
            string usp = "usp_ProjectTypePropertyList @UserID";
            var x = await _sqlDataAccess.LoadData<ObjectTypePropertyList, dynamic>(usp, new { UserId = UserId });
            return x;
        }

    }
}
