
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
    public class PeopleProvider : IPeopleProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public PeopleProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }

        public async Task<List<RoleClaimIndexGet>> RoleClaimIndexGet(string UserId, string RoleId)
        {
            string usp = "usp_RoleClaimIndexGet @UserId, @RoleID";
            var x = await _sqlDataAccess.LoadData<RoleClaimIndexGet, dynamic>(usp, new { UserId = UserId, RoleId = RoleId });
            return x;
        }
        //public async Task<RoleClaim> GetRoleClaim(string UserId, int RoleId)
        //{
        //    string usp = "usp_RoleClaims @UserId, @RoleID";
        //    var x = await _sqlDataAccess.LoadSingleRecord<RoleClaim, dynamic>(usp, new { UserId = UserId, RoleId = RoleId });
        //    return x;
        //}
        public async Task<List<RoleIndexGet>> RoleIndexGet(string UserId)
        {
            string usp = "usp_RoleIndexGet @UserID";
            var x = await _sqlDataAccess.LoadData<RoleIndexGet, dynamic>(usp, new { UserId = UserId });
            return x;
        }
        public Task<RoleUpdateGet> RoleUpdateGet(string UserId, string RoleId)
        {
            string usp = "usp_roleUpdateGet @UserId, @RoleID";
            return _sqlDataAccess.LoadSingleRecord<RoleUpdateGet, dynamic>(usp, new { UserId = UserId, roleId = RoleId });

        }
        public async Task<List<UserRoleIndexGet>> UserRoleIndexGet(string UserId, string UserRoleUserId)
        {
            string usp = "usp_UserRoleIndexGet @UserId, @UserRoleUserID";
            var x = await _sqlDataAccess.LoadData<UserRoleIndexGet, dynamic>(usp, new { UserId = UserId, UserRoleUserId = UserRoleUserId });
            return x;
        }
        public async Task<List<UserIndexGet>> UserIndexGet(string UserId)
        {
            string usp = "usp_UserIndexGet @UserID";
            var x = await _sqlDataAccess.LoadData<UserIndexGet, dynamic>(usp, new { UserId = UserId });
            return x;
        }
        public Task<UserUpdateGet> UserUpdateGet(string UserId, string SelectedUserId)
        {
            string usp = "usp_UserUpdateGet @UserId, @SelectedUserID";
            return _sqlDataAccess.LoadSingleRecord<UserUpdateGet, dynamic>(usp, new { UserId = UserId, SelectedUserId = SelectedUserId });

        }
        public async Task<List<ClaimGroupIndexGet>> ClaimGroupIndexGet(string UserId)
        {
            string usp = "usp_ClaimGroupIndexGet @UserID";
            var x = await _sqlDataAccess.LoadData<ClaimGroupIndexGet, dynamic>(usp, new { UserId = UserId });
            return x;
        }
        public Task<ClaimGroupUpdateGet> ClaimGroupUpdateGet(string UserId, int ClaimGroupId)
        {
            string usp = "usp_ClaimGroupUpdateGet @UserId, @ClaimGroupID";
            return _sqlDataAccess.LoadSingleRecord<ClaimGroupUpdateGet, dynamic>(usp, new { UserId = UserId, ClaimGroupId = ClaimGroupId });

        }
        public async Task<List<ClaimIndexGet>> ClaimIndexGet(string UserId)
        {
            string usp = "usp_ClaimIndexGet @UserID";
            var x = await _sqlDataAccess.LoadData<ClaimIndexGet, dynamic>(usp, new { UserId = UserId });
            return x;
        }
        public Task<ClaimUpdateGet> ClaimUpdateGet(string UserId, int ClaimId)
        {
            string usp = "usp_ClaimUpdateGet @UserId, @ClaimID";
            return _sqlDataAccess.LoadSingleRecord<ClaimUpdateGet, dynamic>(usp, new { UserId = UserId, ClaimId = ClaimId });

        }
        public Task<List<PersonAddressIndexGet>> PersonAddressIndexGet(string UserId, int PersonId)
        {
            string usp = "usp_PersonAddressIndexGet @UserId, @PersonID";
            var x = _sqlDataAccess.LoadData<PersonAddressIndexGet, dynamic>(usp, new { UserId = UserId, PersonId = PersonId });
            return x;

        }
        public Task<PersonAddressUpdateGet> PersonAddressUpdateGet(string UserId, int PersonAddressId)
        {
            string usp = "usp_PersonAddressUpdateGet @UserId, @PersonAddressID";
            return _sqlDataAccess.LoadSingleRecord<PersonAddressUpdateGet, dynamic>(usp, new { UserId = UserId, PersonAddressId = PersonAddressId });

        }
        public Task<List<PersonRelationIndexGet>> PersonRelationIndexGet(string UserId, int PersonId)
        {
            string usp = "usp_PersonRelationIndexGet @UserId, @PersonID";
            return _sqlDataAccess.LoadData<PersonRelationIndexGet, dynamic>(usp, new { UserId = UserId, PersonId = PersonId });

        }
        public Task<PersonRelationUpdateGet> PersonRelationUpdateGet(string UserId, int PersonRelationId)
        {
            string usp = "usp_PersonRelationUpdateGet @UserId, @PersonRelationID";
            return _sqlDataAccess.LoadSingleRecord<PersonRelationUpdateGet, dynamic>(usp, new { UserId = UserId, PersonRelationId = PersonRelationId });

        }
        public Task<List<PersonRelationTypeLanguage>> PersonRelationTypeLanguageIndexGet(string UserId, int PersonRelationTypeId)
        {
            string usp = "usp_PersonRelationTypeLanguageIndexGet @UserId, @PersonRelationTypeID";
            return _sqlDataAccess.LoadData<PersonRelationTypeLanguage, dynamic>(usp, new { UserId = UserId, PersonRelationTypeId = PersonRelationTypeId });

        }
        public Task<PersonRelationTypeLanguage> PersonRelationTypeLanguageUpdateGet(string UserId, int PersonRelationTypeLanguageId)
        {
            string usp = "usp_PersonRelationTypeLanguageUpdateGet @UserId, @PersonRelationTypeLanguageID";
            return _sqlDataAccess.LoadSingleRecord<PersonRelationTypeLanguage, dynamic>(usp, new { UserId = UserId, PersonRelationTypeLanguageId = PersonRelationTypeLanguageId });

        }
        public Task<List<PersonRelationType>> PersonRelationTypeIndexGet(string UserId)
        {
            string usp = "usp_PersonRelationTypeIndexGet @UserID";
            return _sqlDataAccess.LoadData<PersonRelationType, dynamic>(usp, new { UserId = UserId });

        }
        public Task<PersonRelationType> PersonRelationTypeUpdateGet(string UserId, int PersonRelationTypeId)
        {
            string usp = "usp_PersonRelationTypeUpdateGet @UserId, @PersonRelationTypeID";
            return _sqlDataAccess.LoadSingleRecord<PersonRelationType, dynamic>(usp, new { UserId = UserId, PersonRelationTypeId = PersonRelationTypeId });

        }
        public Task<List<PersonIndexGet>> PersonIndexGet(string UserId)
        {
            string usp = "usp_PersonIndexGet @UserID";
            return _sqlDataAccess.LoadData<PersonIndexGet, dynamic>(usp, new { UserId = UserId });

        }
        public Task<PersonUpdateGet> PersonUpdateGet(string UserId, int PersonId)
        {
            string usp = "usp_PersonUpdateGet @UserId, @PersonID";
            return _sqlDataAccess.LoadSingleRecord<PersonUpdateGet, dynamic>(usp, new { UserId = UserId, PersonId = PersonId });

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
        public Task<List<PreferenceType>> PreferenceTypeIndexGet(string UserId)
        {
            string usp = "usp_PreferenceTypeIndexGet @UserID";
            return _sqlDataAccess.LoadData<PreferenceType, dynamic>(usp, new { UserId = UserId });

        }
        public Task<PreferenceType> PreferenceTypeUpdateGet(string UserId, int PreferenceTypeId)
        {
            string usp = "usp_PreferenceTypeUpdateGet @UserId, @PreferenceTypeID";
            return _sqlDataAccess.LoadSingleRecord<PreferenceType, dynamic>(usp, new { UserId = UserId, PreferenceTypeId = PreferenceTypeId });

        }
        public Task<List<RoleGroupLanguage>> RoleGroupLanguageIndexGet(string UserId, int RoleGroupId)
        {
            string usp = "usp_RoleGroupLanguageIndexGet @UserId, @RoleGroupID";
            return _sqlDataAccess.LoadData<RoleGroupLanguage, dynamic>(usp, new { UserId = UserId, RoleGroupId = RoleGroupId });

        }
        public Task<RoleGroupLanguage> RoleGroupLanguageUpdateGet(string UserId, int RoleGroupLanguageId)
        {
            string usp = "usp_RoleGroupLanguageUpdateGet @UserId, @RoleGroupLanguageID";
            return _sqlDataAccess.LoadSingleRecord<RoleGroupLanguage, dynamic>(usp, new { UserId = UserId, RoleGroupLanguageId = RoleGroupLanguageId });

        }
        public Task<List<RoleGroupIndexGet>> RoleGroupIndexGet(string UserId)
        {
            string usp = "usp_RoleGroupIndexGet @UserID";
            return _sqlDataAccess.LoadData<RoleGroupIndexGet, dynamic>(usp, new { UserId = UserId });

        }
        public Task<RoleGroupUpdateGet> RoleGroupUpdateGet(string UserId, int RoleGroupId)
        {
            string usp = "usp_RoleGroupUpdateGet @UserId, @RoleGroupID";
            return _sqlDataAccess.LoadSingleRecord<RoleGroupUpdateGet, dynamic>(usp, new { UserId = UserId, RoleGroupId = RoleGroupId });

        }
        public Task<List<RoleLanguageIndexGet>> RoleLanguageIndexGet(string UserId, string RoleId)
        {
            string usp = "usp_RoleLanguageIndexGet @UserId, @RoleID";
            return _sqlDataAccess.LoadData<RoleLanguageIndexGet, dynamic>(usp, new { UserId = UserId, RoleId = RoleId });

        }
        public Task<RoleLanguageUpdateGet> RoleLanguageUpdateGet(string UserId, int RoleLanguageId)
        {
            string usp = "usp_RoleLanguageUpdateGet @UserId, @RoleLanguageID";
            return _sqlDataAccess.LoadSingleRecord<RoleLanguageUpdateGet, dynamic>(usp, new { UserId = UserId, RoleLanguageId = RoleLanguageId });

        }
        public Task<List<SecurityLevelIndexGet>> SecurityLevelIndexGet(string UserId)
        {
            string usp = "usp_SecurityLevelIndexGet @UserID";
            return _sqlDataAccess.LoadData<SecurityLevelIndexGet, dynamic>(usp, new { UserId = UserId });

        }
        public Task<SecurityLevelUpdateGet> SecurityLevelUpdateGet(string UserId, int SecurityLevelId)
        {
            string usp = "usp_SecurityLevelUpdateGet @UserId, @SecurityLevelID";
            return _sqlDataAccess.LoadSingleRecord<SecurityLevelUpdateGet, dynamic>(usp, new { UserId = UserId, SecurityLevelId = SecurityLevelId });

        }
        public Task<List<UserPreferenceIndexGet>> UserPreferenceIndexGet(string UserId, string SelectedUserId)
        {
            string usp = "usp_UserPreferenceIndexGet @UserId, @SelectedUserID";
            return _sqlDataAccess.LoadData<UserPreferenceIndexGet, dynamic>(usp, new { UserId = UserId, SelectedUserId = SelectedUserId });

        }
        public Task<UserPreferenceUpdateGet> UserPreferenceUpdateGet(string UserId, int UserPreferenceId)
        {
            string usp = "usp_UserPreferenceUpdateGet @UserId, @UserPreferenceID";
            return _sqlDataAccess.LoadSingleRecord<UserPreferenceUpdateGet, dynamic>(usp, new { UserId = UserId, UserPreferenceId = UserPreferenceId });

        }
        public Task<List<RoleList>> RoleList(string UserId)
        {
            string usp = "usp_RoleList @UserID";
            return _sqlDataAccess.LoadData<RoleList, dynamic>(usp, new { UserId = UserId });

        }
        public Task<List<UserList>> UserList()
        {
            string usp = "usp_UserList";
            return _sqlDataAccess.LoadData<UserList>(usp);

        }
        public Task<List<GenderList>> GenderList(string UserId)
        {
            string usp = "usp_GenderList @UserID";
            return _sqlDataAccess.LoadData<GenderList, dynamic>(usp, new { UserId = UserId });

        }
    }
}
