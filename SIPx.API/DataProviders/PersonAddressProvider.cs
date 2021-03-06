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
    public class PersonAddressProvider : IPersonAddressProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public PersonAddressProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }

        public async Task<List<ErrorMessage>> CreatePostCheck(PersonAddressCreateGet PersonAddress)
        {
            string usp = "usp_PersonAddressCreatePostCheck @PersonId, @AddressTypeId, @AttnName, @Address1, @Address2, @HouseNumber, @HouseNumberExt, @City, @PostalCode, @PostalCodeExt, @CountryId, @ProvinceState, @County, @UserId ";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, PersonAddress);
            return ErrorMessages;
        }

        public async Task<string> CreatePost(PersonAddressCreateGet PersonAddress)
        {
            string usp = "usp_PersonAddressCreatePost @PersonId, @AddressTypeId, @AttnName, @Address1, @Address2, @HouseNumber, @HouseNumberExt, @City, @PostalCode, @PostalCodeExt, @CountryId, @ProvinceState, @County, @UserId ";
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
        public async Task<List<ErrorMessage>> UpdatePostCheck(PersonAddressUpdateGet PersonAddress)
        {
            string usp = "usp_PersonAddressUpdatePostCheck " +
                " @PersonAddressId " +
                ", @AddressTypeId" +
                ", @AttnName" +
                ", @Address1" +
                ", @Address2" +
                ", @HouseNumber" +
                ", @HouseNumberExt" +
                ", @City" +
                ", @PostalCode" +
                ", @PostalCodeExt" +
                ", @CountryId" +
                ", @ProvinceState" +
                ", @County" +
                ", @UserId";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, PersonAddress);
            return ErrorMessages;
        }
        public bool UpdatePost(PersonAddressUpdateGet PersonAddress)
        {
            string usp = "usp_PersonAddressUpdatePost " +
                " @PersonAddressId " +
                ", @AddressTypeId" +
                ", @AttnName" +
                ", @Address1" +
                ", @Address2" +
                ", @HouseNumber" +
                ", @HouseNumberExt" +
                ", @City" +
                ", @PostalCode" +
                ", @PostalCodeExt" +
                ", @CountryId" +
                ", @ProvinceState" +
                ", @County" +
                ", @UserId";
            _sqlDataAccess.SaveData<PersonAddressUpdateGet>(usp, PersonAddress);
            return true;
        }

        public Task<PersonAddressDeleteGet> DeleteGet(string UserId, int PersonAddressId)
        {
            string usp = "usp_PersonAddressDeleteGet @UserId, @PersonAddressID";
            return _sqlDataAccess.LoadSingleRecord<PersonAddressDeleteGet, dynamic>(usp, new { UserId, PersonAddressId });

        }

        public bool DeletePost(string UserId, int PersonAddressId)
        {
            string usp = "usp_PersonAddressDeletePost @UserId, @PersonAddressID";
            _sqlDataAccess.SaveData<dynamic>(usp, new { UserId, PersonAddressId });
            return true;
        }

        public async Task<List<ErrorMessage>> DeletePostCheck(string UserId, int PersonAddressId)
        {
            string usp = "usp_PersonAddressDeletePostCheck @UserId, @PersonAddressID";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, new { UserId, PersonAddressId });
            return ErrorMessages;
        }

    }
}
