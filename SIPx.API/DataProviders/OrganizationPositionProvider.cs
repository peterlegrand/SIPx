
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
    public class OrganizationPositionProvider : IOrganizationPositionProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public OrganizationPositionProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }


        public Task<string> CreateGet(string UserId, int OrganizationId)
        {
            string usp = "usp_OrganizationPositionCreateGet @UserId, @OrganizationID";
            return _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, new { UserId = UserId, OrganizationId = OrganizationId });

        }
        public async Task<List<ErrorMessage>> CreatePostCheck(OrganizationPositionCreateGet OrganizationPosition)
        {
            string usp = "usp_OrganizationPositionCreatePostCheck @OrganizationId, @PersonId, @PositionId, @UserId ";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, OrganizationPosition);
            return ErrorMessages;
        }

        public async Task<string> CreatePost(OrganizationPositionCreateGet OrganizationPosition)
        {
            string usp = "usp_OrganizationPositionCreatePost @OrganizationId, @PersonId, @PositionId, @UserId ";
            var CheckString = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, OrganizationPosition);
            return CheckString;
        }

        public async Task<List<OrganizationPositionIndexGet>> IndexGet(string UserId, int OrganizationId)
        {
            string usp = "usp_OrganizationPositionIndexGet @UserId, @OrganizationID";
            var x = await _sqlDataAccess.LoadData<OrganizationPositionIndexGet, dynamic>(usp, new { UserId = UserId, OrganizationId = OrganizationId });
            return x;
        }

        public Task<OrganizationPositionUpdateGet> UpdateGet(string UserId, int OrganizationPersonID)
        {
            string usp = "usp_OrganizationPositionUpdateGet @UserId, @OrganizationPersonID";
            return _sqlDataAccess.LoadSingleRecord<OrganizationPositionUpdateGet, dynamic>(usp, new { UserId = UserId, OrganizationPersonID = OrganizationPersonID });

        }

        public async Task<List<ErrorMessage>> UpdatePostCheck(OrganizationPositionUpdateGet OrganizationPosition)
        {
            string usp = "usp_OrganizationPositionUpdatePostCheck @OrganizationPersonId ,@PersonId,  @PositionId, @UserId";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, OrganizationPosition);
            return ErrorMessages;
        }
        public bool UpdatePost(OrganizationPositionUpdateGet OrganizationPosition)
        {
            string usp = "usp_OrganizationPositionUpdatePost @OrganizationPersonId ,@PersonId,  @PositionId, @UserId";
            _sqlDataAccess.SaveData<OrganizationPositionUpdateGet>(usp, OrganizationPosition);
            return true;
        }

        public Task<OrganizationPositionDeleteGet> DeleteGet(string UserId, int OrganizationPersonId)
        {
            string usp = "usp_OrganizationPositionDeleteGet @UserId, @OrganizationPersonId";
            return _sqlDataAccess.LoadSingleRecord<OrganizationPositionDeleteGet, dynamic>(usp, new { UserId, OrganizationPersonId });

        }

        public Task<OrganizationPositionDeleteGet> ViewGet(string UserId, int OrganizationPersonId)
        {
            string usp = "usp_OrganizationPositionDeleteGet @UserId, @OrganizationPersonId";
            return _sqlDataAccess.LoadSingleRecord<OrganizationPositionDeleteGet, dynamic>(usp, new { UserId, OrganizationPersonId });

        }

        public bool DeletePost(string UserId, int OrganizationPersonId)
        {
            string usp = "usp_OrganizationPositionDeletePost @UserId, @OrganizationPersonId";
            _sqlDataAccess.SaveData<dynamic>(usp, new { UserId, OrganizationPersonId });
            return true;
        }

        public async Task<List<ErrorMessage>> DeletePostCheck(string UserId, int OrganizationPersonId)
        {
            string usp = "usp_OrganizationPositionDeletePostCheck @UserId, @OrganizationPersonId";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, new { UserId, OrganizationPersonId });
            return ErrorMessages;
        }


    }
}
