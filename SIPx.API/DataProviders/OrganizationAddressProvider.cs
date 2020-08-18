
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

        public async Task<string> CreatePostCheck(OrganizationAddressCreatePost OrganizationAddress)
        {
            string usp = "usp_OrganizationAddressCreatePostCheck @OrganizationId, @AddressTypeId  , @CountryId, @UserId ";
            var CheckString = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, OrganizationAddress);
            return CheckString;
        }

        public async Task<string> CreatePost(OrganizationAddressCreatePost OrganizationAddress)
        {
            string usp = "usp_OrganizationAddressCreatePost @OrganizationId, AddressTypeId, @AttnName, @Address1, @Address2, @HouseNumber, @HouseNumberExt, @Location, @City, @PostalCode, @PostalCodeExt, @CountryId, @ProvinceState, @County, @CreatorId ";
            var CheckString = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, OrganizationAddress);
            return CheckString;
        }
        public async Task<List<OrganizationAddress>> IndexGet(string UserId, int OrganizationId)
        {
            string usp = "usp_OrganizationAddressIndexGet @UserId, @OrganizationID";
            var x = await _sqlDataAccess.LoadData<OrganizationAddress, dynamic>(usp, new { UserId = UserId, OrganizationId = OrganizationId });
            return x;
        }
        
        public Task<OrganizationAddress> UpdateGet(string UserId, int OrganizationAddressId)
        {
            string usp = "usp_OrganizationAddressUpdateGet @UserId, @OrganizationAddressID";
            return _sqlDataAccess.LoadSingleRecord<OrganizationAddress, dynamic>(usp, new { UserId = UserId, OrganizationAddressId = OrganizationAddressId });

        }

        public bool UpdatePost(OrganizationAddressUpdateGet OrganizationAddress)
        {
            string usp = "usp_OrganizationAddressUpdatePost @OrganizationAddressId , AddressTypeId, @AttnName, @Address1, @Address2, @HouseNumber, @HouseNumberExt, @Location, @City, @PostalCode, @PostalCodeExt, @CountryId, @ProvinceState, @County, @ModifierId";
            _sqlDataAccess.SaveData<OrganizationAddressUpdateGet>(usp, OrganizationAddress);
            return true;
        }


    }
}
