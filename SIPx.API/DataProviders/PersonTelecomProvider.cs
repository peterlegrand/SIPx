
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
    public class PersonTelecomProvider : IPersonTelecomProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public PersonTelecomProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }

        public async Task<List<ErrorMessage>> CreatePostCheck(PersonTelecomCreateGet PersonTelecom)
        {
            string usp = "usp_PersonTelecomCreatePostCheck @PersonId , @TelecomTypeId , @TelecomValue, @CountryCode, @AreaCode, @ExtensionCode,@AskForName, @UserId ";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, PersonTelecom);
            return ErrorMessages;
        }

        public async Task<string> CreatePost(PersonTelecomCreateGet PersonTelecom)
        {
            string usp = "usp_PersonTelecomCreatePost  @PersonId , @TelecomTypeId , @TelecomValue, @CountryCode, @AreaCode, @ExtensionCode,@AskForName, @UserId ";
            var CheckString = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, PersonTelecom);
            return CheckString;
        }

        public Task<List<PersonTelecomIndexGet>> IndexGet(string UserId, int PersonId)
        {
            string usp = "usp_PersonTelecomIndexGet @UserId, @PersonID";
            return _sqlDataAccess.LoadData<PersonTelecomIndexGet, dynamic>(usp, new { UserId = UserId, PersonId = PersonId });

        }

        public Task<PersonTelecomUpdateGet> UpdateGet(string UserId, int PersonTelecomId)
        {
            string usp = "usp_PersonTelecomUpdateGet @UserId, @PersonTelecomID";
            return _sqlDataAccess.LoadSingleRecord<PersonTelecomUpdateGet, dynamic>(usp, new { UserId = UserId, PersonTelecomId = PersonTelecomId });
        }
        public async Task<List<ErrorMessage>> UpdatePostCheck(PersonTelecomUpdateGet PersonTelecom)
        {
            string usp = "usp_PersonTelecomUpdatePostCheck @PersonTelecomId  , @TelecomValue,@CountryCode, @AreaCode, @ExtensionCode,@AskForName, @UserId";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, PersonTelecom);
            return ErrorMessages;
        }

        public bool UpdatePost(PersonTelecomUpdateGet PersonTelecom)
        {
            string usp = "usp_PersonTelecomUpdatePost @PersonTelecomId  , @TelecomValue,@CountryCode, @AreaCode, @ExtensionCode,@AskForName, @UserId";
            _sqlDataAccess.SaveData<PersonTelecomUpdateGet>(usp, PersonTelecom);
            return true;
        }

        public Task<PersonTelecomDeleteGet> DeleteGet(string UserId, int PersonTelecomId)
        {
            string usp = "usp_PersonTelecomDeleteGet @UserId, @PersonTelecomID";
            return _sqlDataAccess.LoadSingleRecord<PersonTelecomDeleteGet, dynamic>(usp, new { UserId, PersonTelecomId });

        }

        public bool DeletePost(string UserId, int PersonTelecomId)
        {
            string usp = "usp_PersonTelecomDeletePost @UserId, @PersonTelecomID";
            _sqlDataAccess.SaveData<dynamic>(usp, new { UserId, PersonTelecomId });
            return true;
        }
        public async Task<List<ErrorMessage>> DeletePostCheck(string UserId, int PersonTelecomId)
        {
            string usp = "usp_PersonTelecomDeletePostCheck @UserId, @PersonTelecomID";
            _sqlDataAccess.SaveData<dynamic>(usp, new { UserId, PersonTelecomId });
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, new { UserId, PersonTelecomId });
            return ErrorMessages;
        }

    }
}
