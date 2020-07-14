
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

        public async Task<List<RoleClaim>> RoleClaimIndexGet(string UserId, string RoleId)
        {
            string usp = "usp_RoleClaimIndexGet @UserId, @RoleID";
            var x = await _sqlDataAccess.LoadData<RoleClaim, dynamic>(usp, new { UserId = UserId, RoleId = RoleId });
            return x;
        }
        //public async Task<RoleClaim> GetRoleClaim(string UserId, int RoleId)
        //{
        //    string usp = "usp_RoleClaims @UserId, @RoleID";
        //    var x = await _sqlDataAccess.LoadSingleRecord<RoleClaim, dynamic>(usp, new { UserId = UserId, RoleId = RoleId });
        //    return x;
        //}
        public async Task<List<Role>> RoleIndexGet(string UserId)
        {
            string usp = "usp_RoleIndexGet @UserID";
            var x = await _sqlDataAccess.LoadData<Role, dynamic>(usp, new { UserId = UserId });
            return x;
        }
        public Task<Role> RoleUpdateGet(string UserId, string RoleId)
        {
            string usp = "usp_roleUpdateGet @UserId, @RoleID";
            return _sqlDataAccess.LoadSingleRecord<Role, dynamic>(usp, new { UserId = UserId, roleId = RoleId });

        }
        public async Task<List<UserRole>> UserRoleIndexGet(string UserId, string UserRoleUserId)
        {
            string usp = "usp_UserRoleIndexGet @UserId, @UserRoleUserID";
            var x = await _sqlDataAccess.LoadData<UserRole, dynamic>(usp, new { UserId = UserId, UserRoleUserId = UserRoleUserId });
            return x;
        }
        public async Task<List<User>> UserIndexGet(string UserId)
        {
            string usp = "usp_UserIndexGet @UserID";
            var x = await _sqlDataAccess.LoadData<User, dynamic>(usp, new { UserId = UserId });
            return x;
        }
        public Task<User> UserUpdateGet(string UserId, string SelectedUserId)
        {
            string usp = "usp_UserUpdateGet @UserId, @SelectedUserID";
            return _sqlDataAccess.LoadSingleRecord<User, dynamic>(usp, new { UserId = UserId, SelectedUserId = SelectedUserId });

        }
        public async Task<List<ClaimGroup>> ClaimGroupIndexGet(string UserId)
        {
            string usp = "usp_ClaimGroupIndexGet @UserID";
            var x = await _sqlDataAccess.LoadData<ClaimGroup, dynamic>(usp, new { UserId = UserId });
            return x;
        }
        public Task<ClaimGroup> ClaimGroupUpdateGet(string UserId, int ClaimGroupId)
        {
            string usp = "usp_ClaimGroupUpdateGet @UserId, @ClaimGroupID";
            return _sqlDataAccess.LoadSingleRecord<ClaimGroup, dynamic>(usp, new { UserId = UserId, ClaimGroupId = ClaimGroupId });

        }
        public async Task<List<Claim>> ClaimIndexGet(string UserId)
        {
            string usp = "usp_ClaimIndexGet @UserID";
            var x = await _sqlDataAccess.LoadData<Claim, dynamic>(usp, new { UserId = UserId });
            return x;
        }
        public Task<Claim> ClaimUpdateGet(string UserId, int ClaimId)
        {
            string usp = "usp_ClaimUpdateGet @UserId, @ClaimID";
            return _sqlDataAccess.LoadSingleRecord<Claim, dynamic>(usp, new { UserId = UserId, ClaimId = ClaimId });

        }
        public Task<List<PersonAddress>> PersonAddressIndexGet(string UserId, int PersonId)
        {
            string usp = "usp_PersonAddressIndexGet @UserId, @PersonID";
            return _sqlDataAccess.LoadData<PersonAddress, dynamic>(usp, new { UserId = UserId, PersonId = PersonId });

        }
        public Task<PersonAddress> PersonAddressUpdateGet(string UserId, int PersonAddressId)
        {
            string usp = "usp_PersonAddressUpdateGet @UserId, @PersonAddressID";
            return _sqlDataAccess.LoadSingleRecord<PersonAddress, dynamic>(usp, new { UserId = UserId, PersonAddressId = PersonAddressId });

        }
        public Task<List<PersonRelation>> PersonRelationIndexGet(string UserId, int PersonId)
        {
            string usp = "usp_PersonRelationIndexGet @UserId, @PersonID";
            return _sqlDataAccess.LoadData<PersonRelation, dynamic>(usp, new { UserId = UserId, PersonId = PersonId });

        }
        public Task<PersonRelation> PersonRelationUpdateGet(string UserId, int PersonRelationId)
        {
            string usp = "usp_PersonRelationUpdateGet @UserId, @PersonRelationID";
            return _sqlDataAccess.LoadSingleRecord<PersonRelation, dynamic>(usp, new { UserId = UserId, PersonRelationId = PersonRelationId });

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
        public Task<List<Person>> PersonIndexGet(string UserId)
        {
            string usp = "usp_PersonIndexGet @UserID";
            return _sqlDataAccess.LoadData<Person, dynamic>(usp, new { UserId = UserId });

        }
        public Task<Person> PersonUpdateGet(string UserId, int PersonId)
        {
            string usp = "usp_PersonUpdateGet @UserId, @PersonID";
            return _sqlDataAccess.LoadSingleRecord<Person, dynamic>(usp, new { UserId = UserId, PersonId = PersonId });

        }
        public Task<List<PersonTelecom>> PersonTelecomIndexGet(string UserId, int PersonId)
        {
            string usp = "usp_PersonIndexGet @UserId, @PersonID";
            return _sqlDataAccess.LoadData<PersonTelecom, dynamic>(usp, new { UserId = UserId, PersonId = PersonId });

        }
        public Task<PersonTelecom> PersonTelecomUpdateGet(string UserId, int PersonTelecomId)
        {
            string usp = "usp_PersonTelecomUpdateGet @UserId, @PersonTelecomID";
            return _sqlDataAccess.LoadSingleRecord<PersonTelecom, dynamic>(usp, new { UserId = UserId, PersonTelecomId = PersonTelecomId });

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
        public Task<List<RoleGroup>> RoleGroupIndexGet(string UserId)
        {
            string usp = "usp_RoleGroupIndexGet @UserID";
            return _sqlDataAccess.LoadData<RoleGroup, dynamic>(usp, new { UserId = UserId });

        }
        public Task<RoleGroup> RoleGroupUpdateGet(string UserId, int RoleGroupId)
        {
            string usp = "usp_RoleGroupUpdateGet @UserId, @RoleGroupID";
            return _sqlDataAccess.LoadSingleRecord<RoleGroup, dynamic>(usp, new { UserId = UserId, RoleGroupId = RoleGroupId });

        }
        public Task<List<RoleLanguage>> RoleLanguageIndexGet(string UserId, string RoleId)
        {
            string usp = "usp_RoleLanguageIndexGet @UserId, @RoleID";
            return _sqlDataAccess.LoadData<RoleLanguage, dynamic>(usp, new { UserId = UserId, RoleId = RoleId });

        }
        public Task<RoleLanguage> RoleLanguageUpdateGet(string UserId, int RoleLanguageId)
        {
            string usp = "usp_RoleLanguageUpdateGet @UserId, @RoleLanguageID";
            return _sqlDataAccess.LoadSingleRecord<RoleLanguage, dynamic>(usp, new { UserId = UserId, RoleLanguageId = RoleLanguageId });

        }
        public Task<List<SecurityLevel>> SecurityLevelIndexGet(string UserId)
        {
            string usp = "usp_SecurityLevelIndexGet @UserID";
            return _sqlDataAccess.LoadData<SecurityLevel, dynamic>(usp, new { UserId = UserId });

        }
        public Task<SecurityLevel> SecurityLevelUpdateGet(string UserId, int SecurityLevelId)
        {
            string usp = "usp_SecurityLevelUpdateGet @UserId, @SecurityLevelID";
            return _sqlDataAccess.LoadSingleRecord<SecurityLevel, dynamic>(usp, new { UserId = UserId, SecurityLevelId = SecurityLevelId });

        }
        public Task<List<UserPreference>> UserPreferenceIndexGet(string UserId, string SelectedUserId)
        {
            string usp = "usp_UserPreferenceIndexGet @UserId, @SelectedUserID";
            return _sqlDataAccess.LoadData<UserPreference, dynamic>(usp, new { UserId = UserId, SelectedUserId = SelectedUserId });

        }
        public Task<UserPreference> UserPreferenceUpdateGet(string UserId, int UserPreferenceId)
        {
            string usp = "usp_UserPreferenceUpdateGet @UserId, @UserPreferenceID";
            return _sqlDataAccess.LoadSingleRecord<UserPreference, dynamic>(usp, new { UserId = UserId, UserPreferenceId = UserPreferenceId });

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
    }
}
