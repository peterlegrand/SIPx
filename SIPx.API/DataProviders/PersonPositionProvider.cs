
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
    public class PersonPositionProvider : IPersonPositionProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public PersonPositionProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }

        public Task<PersonPositionCreateGet> CreateGet(string UserId, int PersonId)
        {
            string usp = "usp_PersonPositionCreateGet @UserId, @PersonID";
            return _sqlDataAccess.LoadSingleRecord<PersonPositionCreateGet, dynamic>(usp, new { UserId = UserId, PersonId = PersonId });

        }
        public async Task<List<ErrorMessage>> CreatePostCheck(PersonPositionCreateGet PersonPosition)
        {
            string usp = "usp_PersonPositionCreatePostCheck @PersonId, @OrganizationId, @PositionId, @UserId ";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, PersonPosition);
            return ErrorMessages;
        }

        public async Task<string> CreatePost(PersonPositionCreateGet PersonPosition)
        {
            string usp = "usp_PersonPositionCreatePost @PersonId, @OrganizationId, @PositionId, @UserId ";
            var CheckString = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, PersonPosition);
            return CheckString;
        }

        public async Task<List<PersonPositionIndexGet>> IndexGet(string UserId, int PersonId)
        {
            string usp = "usp_PersonPositionIndexGet @UserId, @PersonID";
            var x = await _sqlDataAccess.LoadData<PersonPositionIndexGet, dynamic>(usp, new { UserId = UserId, PersonId = PersonId });
            return x;
        }

        public Task<PersonPositionUpdateGet> UpdateGet(string UserId, int OrganizationPersonId)
        {
            string usp = "usp_PersonPositionUpdateGet @UserId, @OrganizationPersonID";
            return _sqlDataAccess.LoadSingleRecord<PersonPositionUpdateGet, dynamic>(usp, new { UserId = UserId, OrganizationPersonId = OrganizationPersonId });

        }

        public async Task<List<ErrorMessage>> UpdatePostCheck(PersonPositionUpdateGet PersonPosition)
        {
            string usp = "usp_PersonPositionUpdatePostCheck @OrganizationPersonId ,@OrganizationId,  @PositionId, @UserId";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, PersonPosition);
            return ErrorMessages;
        }
        public bool UpdatePost(PersonPositionUpdateGet PersonPosition)
        {
            string usp = "usp_PersonPositionUpdatePost @OrganizationPersonId ,@OrganizationId,  @PositionId, @UserId";
            _sqlDataAccess.SaveData<PersonPositionUpdateGet>(usp, PersonPosition);
            return true;
        }

        public Task<PersonPositionDeleteGet> DeleteGet(string UserId, int OrganizationPersonId)
        {
            string usp = "usp_PersonPositionDeleteGet @UserId, @OrganizationPersonId";
            return _sqlDataAccess.LoadSingleRecord<PersonPositionDeleteGet, dynamic>(usp, new { UserId, OrganizationPersonId });

        }

        public Task<PersonPositionDeleteGet> ViewGet(string UserId, int OrganizationPersonId)
        {
            string usp = "usp_PersonPositionDeleteGet @UserId, @OrganizationPersonId";
            return _sqlDataAccess.LoadSingleRecord<PersonPositionDeleteGet, dynamic>(usp, new { UserId, OrganizationPersonId });

        }

        public bool DeletePost(string UserId, int OrganizationPersonId)
        {
            string usp = "usp_PersonPositionDeletePost @UserId, @OrganizationPersonId";
            _sqlDataAccess.SaveData<dynamic>(usp, new { UserId, OrganizationPersonId });
            return true;
        }

        public async Task<List<ErrorMessage>> DeletePostCheck(string UserId, int OrganizationPersonId)
        {
            string usp = "usp_PersonPositionDeletePostCheck @UserId, @OrganizationPersonId";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, new { UserId, OrganizationPersonId });
            return ErrorMessages;
        }


    }
}
