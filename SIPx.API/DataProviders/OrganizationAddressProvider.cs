
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
    public class OrganizationAddressProvider : IOrganizationAddressProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public OrganizationAddressProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }

        public async Task<List<ErrorMessage>> CreatePostCheck(OrganizationAddressCreateGet OrganizationAddress)
        {
            string usp = "usp_OrganizationAddressCreatePostCheck @OrganizationId, @AddressTypeId  , @CountryId, @UserId ";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, OrganizationAddress);
            return ErrorMessages;
        }

        public async Task<string> CreatePost(OrganizationAddressCreateGet OrganizationAddress)
        {
            string usp = "usp_OrganizationAddressCreatePost @OrganizationId, @AddressTypeId, @AttnName, @Address1, @Address2, @HouseNumber, @HouseNumberExt, @City, @PostalCode, @PostalCodeExt, @CountryId, @ProvinceState, @County, @UserId ";
            var CheckString = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, OrganizationAddress);
            return CheckString;
        }

        public async Task<List<OrganizationAddressIndexGet>> IndexGet(string UserId, int OrganizationId)
        {
            string usp = "usp_OrganizationAddressIndexGet @UserId, @OrganizationID";
            var x = await _sqlDataAccess.LoadData<OrganizationAddressIndexGet, dynamic>(usp, new { UserId = UserId, OrganizationId = OrganizationId });
            return x;
        }

        public Task<OrganizationAddressUpdateGet> UpdateGet(string UserId, int OrganizationAddressId)
        {
            string usp = "usp_OrganizationAddressUpdateGet @UserId, @OrganizationAddressID";
            return _sqlDataAccess.LoadSingleRecord<OrganizationAddressUpdateGet, dynamic>(usp, new { UserId = UserId, OrganizationAddressId = OrganizationAddressId });

        }

        public async Task<List<ErrorMessage>> UpdatePostCheck(OrganizationAddressUpdateGet OrganizationAddress)
        {
            string usp = "usp_OrganizationAddressUpdatePostCheck @OrganizationAddressId , @AddressTypeId, @AttnName, @Address1, @Address2, @HouseNumber, @HouseNumberExt, @City, @PostalCode, @PostalCodeExt, @CountryId, @ProvinceState, @County, @UserId";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, OrganizationAddress);
            return ErrorMessages;
        }
        public bool UpdatePost(OrganizationAddressUpdateGet OrganizationAddress)
        {
            string usp = "usp_OrganizationAddressUpdatePost @OrganizationAddressId , @AddressTypeId, @AttnName, @Address1, @Address2, @HouseNumber, @HouseNumberExt, @City, @PostalCode, @PostalCodeExt, @CountryId, @ProvinceState, @County, @UserId";
            _sqlDataAccess.SaveData<OrganizationAddressUpdateGet>(usp, OrganizationAddress);
            return true;
        }

        public Task<OrganizationAddressDeleteGet> DeleteGet(string UserId, int OrganizationAddressId)
        {
            string usp = "usp_OrganizationAddressDeleteGet @UserId, @OrganizationAddressID";
            return _sqlDataAccess.LoadSingleRecord<OrganizationAddressDeleteGet, dynamic>(usp, new { UserId, OrganizationAddressId });

        }

        public bool DeletePost(string UserId, int OrganizationAddressId)
        {
            string usp = "usp_OrganizationAddressDeletePost @UserId, @OrganizationAddressID";
            _sqlDataAccess.SaveData<dynamic>(usp, new { UserId, OrganizationAddressId });
            return true;
        }

        public async Task<List<ErrorMessage>> DeletePostCheck(string UserId, int OrganizationAddressId)
        {
            string usp = "usp_OrganizationAddressDeletePostCheck @UserId, @OrganizationAddressID";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, new { UserId, OrganizationAddressId });
            return ErrorMessages;
        }


    }
}
