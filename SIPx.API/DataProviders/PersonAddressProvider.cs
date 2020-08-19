
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
    public class PersonAddressProvider : IPersonAddressProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public PersonAddressProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }

        public async Task<string> CreatePostCheck(PersonAddressCreatePost PersonAddress)
        {
            string usp = "usp_PersonAddressCreateCheck @PersonId, @AddressTypeId  , @CountryId, @CreatorId ";
            var CheckString = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, PersonAddress);
            return CheckString;
        }
        public async Task<string> CreatePost(PersonAddressCreatePost PersonAddress)
        {
            string usp = "usp_PersonAddressCreate @PersonId, AddressTypeId, @AttnName, @Address1, @Address2, @HouseNumber, @HouseNumberExt, @Location, @City, @PostalCode, @PostalCodeExt, @CountryId, @ProvinceState, @County, @CreatorId ";
            var CheckString = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, PersonAddress);
            return CheckString;
        }
        public Task<List<PersonAddressIndexGet>> IndexGet(string UserId, int PersonId)
        {
            string usp = "usp_PersonAddressIndexGet @UserId, @PersonID";
            var x = _sqlDataAccess.LoadData<PersonAddressIndexGet, dynamic>(usp, new { UserId = UserId, PersonId = PersonId });
            return x;

        }
        public Task<PersonAddressUpdateGet> UpdateGet(string UserId, int PersonAddressId)
        {
            string usp = "usp_PersonAddressUpdateGet @UserId, @PersonAddressID";
            return _sqlDataAccess.LoadSingleRecord<PersonAddressUpdateGet, dynamic>(usp, new { UserId = UserId, PersonAddressId = PersonAddressId });

        }
        public bool UpdatePost(PersonAddressUpdateGet PersonAddress)
        {
            string usp = "usp_PersonAddressUpdatePost @PersonAddressId , AddressTypeId, @AttnName, @Address1, @Address2, @HouseNumber, @HouseNumberExt, @Location, @City, @PostalCode, @PostalCodeExt, @CountryId, @ProvinceState, @County, @ModifierId";
            _sqlDataAccess.SaveData<PersonAddressUpdateGet>(usp, PersonAddress);
            return true;
        }
        public Task<PersonAddressDeleteGet> DeleteGet(string UserId, int PersonAddressId)
        {
            string usp = "usp_PersonAddressDeleteGet @UserId, @PersonAddressID";
            return _sqlDataAccess.LoadSingleRecord<PersonAddressDeleteGet, dynamic>(usp, new { UserId, PersonAddressId });

        }
        public bool DeletePost(int PersonAddressId)
        {
            string usp = "usp_PersonAddressDeletePost @PersonAddressId";
            _sqlDataAccess.SaveData<dynamic>(usp, new { PersonAddressId = PersonAddressId });
            return true;
        }

    }
}
