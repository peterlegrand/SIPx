
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
    public class PersonRelationTypeProvider : IPersonRelationTypeProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public PersonRelationTypeProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }
        public async Task<List<ErrorMessage>> CreatePostCheck(PersonRelationTypeCreateGet PersonRelationType)
        {
            string usp = "usp_PersonRelationTypeCreatePostCheck @Name, @Description , @MenuName, @MouseOver, @FromIsAnXOfTo, @ToIsAnXOfFrom, @SeePersonal, @Color, @IconId, @UserId";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, PersonRelationType);
            return ErrorMessages;
        }

        public async Task<string> CreatePost(PersonRelationTypeCreateGet PersonRelationType)
        {
            string usp = "usp_PersonRelationTypeCreatePost @Name, @Description , @MenuName, @MouseOver, @FromIsAnXOfTo, @ToIsAnXOfFrom, @SeePersonal, @Color, @IconId, @UserId";
            var CheckString = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, PersonRelationType);
            return CheckString;
        }
        public Task<List<PersonRelationTypeIndexGet>> IndexGet(string UserId)
        {
            string usp = "usp_PersonRelationTypeIndexGet @UserID";
            return _sqlDataAccess.LoadData<PersonRelationTypeIndexGet, dynamic>(usp, new { UserId = UserId });

        }

        public Task<PersonRelationTypeUpdateGet> UpdateGet(string UserId, int PersonRelationTypeId)
        {
            string usp = "usp_PersonRelationTypeUpdateGet @UserId, @PersonRelationTypeID";
            return _sqlDataAccess.LoadSingleRecord<PersonRelationTypeUpdateGet, dynamic>(usp, new { UserId = UserId, PersonRelationTypeId = PersonRelationTypeId });

        }
        public async Task<List<ErrorMessage>> UpdatePostCheck(PersonRelationTypeUpdateGet PersonRelationType)
        {
            string usp = "usp_PersonRelationTypeUpdatePostCheck @PersonRelationTypeId, @Name, @Description, @MenuName, @MouseOver, @FromIsAnXOfTo, @ToIsAnXOfFrom,@SeePersonal, @Color, @IconId, @ModifierId";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, PersonRelationType);
            return ErrorMessages;
        }
        public bool UpdatePost(PersonRelationTypeUpdateGet PersonRelationType)
        {
            string usp = "usp_PersonRelationTypeUpdatePost @PersonRelationTypeId, @Name, @Description, @MenuName, @MouseOver, @FromIsAnXOfTo, @ToIsAnXOfFrom,@SeePersonal, @Color, @IconId, @ModifierId";
            _sqlDataAccess.SaveData<PersonRelationTypeUpdateGet>(usp, PersonRelationType);
            return true;
        }

        public Task<PersonRelationTypeDeleteGet> DeleteGet(string UserId, int PersonRelationTypeId)
        {
            string usp = "usp_PersonRelationTypeDeleteGet string UserId, int PersonRelationTypeId";
            return _sqlDataAccess.LoadSingleRecord<PersonRelationTypeDeleteGet, dynamic>(usp, new { UserId, PersonRelationTypeId });

        }

        public bool DeletePost(string UserId, int PersonRelationTypeId)
        {
            string usp = "usp_PersonRelationTypeDeletePost string UserId, int PersonRelationTypeId";
            _sqlDataAccess.SaveData<dynamic>(usp, new { UserId, PersonRelationTypeId });
            return true;
        }

        public async Task<List<ErrorMessage>> DeletePostCheck(string UserId, int PersonRelationTypeId)
        {
            string usp = "usp_PersonRelationTypeDeletePostCheck string UserId, int PersonRelationTypeId";
            _sqlDataAccess.SaveData<dynamic>(usp, new { UserId, PersonRelationTypeId });
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, new { UserId, PersonRelationTypeId });
            return ErrorMessages;
        }



        public Task<List<PersonRelationTypeList>> List(string UserId)
        {
            string usp = "usp_PersonRelationTypeList @UserID";
            return _sqlDataAccess.LoadData<PersonRelationTypeList, dynamic>(usp, new { UserId = UserId });
        }

    }
}
