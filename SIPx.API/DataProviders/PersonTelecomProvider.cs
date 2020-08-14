﻿
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
        public Task<List<PersonTelecomIndexGet>> PersonTelecomIndexGet(string UserId, int PersonId)
        {
            string usp = "usp_PersonTelecomIndexGet @UserId, @PersonID";
            return _sqlDataAccess.LoadData<PersonTelecomIndexGet, dynamic>(usp, new { UserId = UserId, PersonId = PersonId });

        }
        public Task<PersonTelecomUpdateGet> PersonTelecomUpdateGet(string UserId, int PersonTelecomId)
        {
            string usp = "usp_PersonTelecomUpdateGet @UserId, @PersonTelecomID";
            return _sqlDataAccess.LoadSingleRecord<PersonTelecomUpdateGet, dynamic>(usp, new { UserId = UserId, PersonTelecomId = PersonTelecomId });
        }

        public async Task<string> PersonTelecomCreatePostCheck(PersonTelecomCreatePost PersonTelecom)
        {
            string usp = "usp_PersonTelecomCreateCheck @PersonId  , @TelecomTypeId, @CreatorId ";
            var CheckString = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, PersonTelecom);
            return CheckString;
        }
        public async Task<string> PersonTelecomCreatePost(PersonTelecomCreatePost PersonTelecom)
        {
            string usp = "usp_PersonTelecomCreate  @PersonId , @TelecomTypeId , @TelecomValue,@CountryCode, @AreaCode, @ExtensionCode,@AskFor, @CreatorId ";
            var CheckString = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, PersonTelecom);
            return CheckString;
        }
    }
}
