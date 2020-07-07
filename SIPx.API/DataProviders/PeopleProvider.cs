
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

        public async Task<List<RoleClaim>> GetRoleClaims(string UserId, string RoleId)
        {
            string usp = "usp_RoleClaims @UserId, @RoleID";
            var x = await _sqlDataAccess.LoadData<RoleClaim, dynamic>(usp, new { UserId = UserId, RoleId = RoleId });
            return x;
        }
        //public async Task<RoleClaim> GetRoleClaim(string UserId, int RoleId)
        //{
        //    string usp = "usp_RoleClaims @UserId, @RoleID";
        //    var x = await _sqlDataAccess.LoadSingleRecord<RoleClaim, dynamic>(usp, new { UserId = UserId, RoleId = RoleId });
        //    return x;
        //}
        public async Task<List<Role>> GetRoles(string UserId)
        {
            string usp = "usp_Roless @UserID";
            var x = await _sqlDataAccess.LoadData<Role, dynamic>(usp, new { UserId = UserId });
            return x;
        }
        public Task<Role> GetRole(string UserId, string RoleId)
        {
            string usp = "usp_role @UserId, @RoleID";
            return _sqlDataAccess.LoadSingleRecord<Role, dynamic>(usp, new { UserId = UserId, roleId = RoleId });

        }
        public async Task<List<UserRole>> GetUserRoles(string UserId, string UserRoleUserId)
        {
            string usp = "usp_UserRoles @UserId, @UserRoleUserID";
            var x = await _sqlDataAccess.LoadData<UserRole, dynamic>(usp, new { UserId = UserId, UserRoleUserId = UserRoleUserId });
            return x;
        }
        public async Task<List<User>> GetUsers(string UserId)
        {
            string usp = "usp_Users @UserID";
            var x = await _sqlDataAccess.LoadData<User, dynamic>(usp, new { UserId = UserId });
            return x;
        }
        public Task<User> GetUser(string UserId, string SelectedUserId)
        {
            string usp = "usp_User @UserId, @SelectedUserID";
            return _sqlDataAccess.LoadSingleRecord<User, dynamic>(usp, new { UserId = UserId, SelectedUserId = SelectedUserId });

        }
        public async Task<List<ClaimGroup>> GetClaimGroups(string UserId)
        {
            string usp = "usp_ClaimGroups @UserID";
            var x = await _sqlDataAccess.LoadData<ClaimGroup, dynamic>(usp, new { UserId = UserId });
            return x;
        }
        public Task<ClaimGroup> GetClaimGroup(string UserId, int ClaimGroupId)
        {
            string usp = "usp_ClaimGroup @UserId, @ClaimGroupID";
            return _sqlDataAccess.LoadSingleRecord<ClaimGroup, dynamic>(usp, new { UserId = UserId, ClaimGroupId = ClaimGroupId });

        }
        public async Task<List<Claim>> GetClaims(string UserId)
        {
            string usp = "usp_Claims @UserID";
            var x = await _sqlDataAccess.LoadData<Claim, dynamic>(usp, new { UserId = UserId });
            return x;
        }
        public Task<Claim> GetClaim(string UserId, int ClaimId)
        {
            string usp = "usp_Claim @UserId, @ClaimID";
            return _sqlDataAccess.LoadSingleRecord<Claim, dynamic>(usp, new { UserId = UserId, ClaimId = ClaimId });

        }
        public Task<List<PersonAddress>> GetPersonAddresses(string UserId, int PersonId)
        {
            string usp = "usp_PersonAddresses @UserId, @PersonID";
            return _sqlDataAccess.LoadData<PersonAddress, dynamic>(usp, new { UserId = UserId, PersonId = PersonId });

        }
        public Task<PersonAddress> GetPersonAddress(string UserId, int PersonAddressId)
        {
            string usp = "usp_PersonAddress @UserId, @PersonAddressID";
            return _sqlDataAccess.LoadSingleRecord<PersonAddress, dynamic>(usp, new { UserId = UserId, PersonAddressId = PersonAddressId });

        }
        public Task<List<PersonRelation>> GetPersonRelations(string UserId, int PersonId)
        {
            string usp = "usp_PersonRelations @UserId, @PersonID";
            return _sqlDataAccess.LoadData<PersonRelation, dynamic>(usp, new { UserId = UserId, PersonId = PersonId });

        }
        public Task<PersonRelation> GetPersonRelation(string UserId, int PersonRelationId)
        {
            string usp = "usp_PersonRelation @UserId, @PersonRelationID";
            return _sqlDataAccess.LoadSingleRecord<PersonRelation, dynamic>(usp, new { UserId = UserId, PersonAddressId = PersonRelationId });

        }
        public Task<List<PersonRelationTypeLanguage>> GetPersonRelationTypeLanguages(string UserId, int PersonRelationTypeId)
        {
            string usp = "usp_PersonRelationTypeLanguages @UserId, @PersonRelationTypeID";
            return _sqlDataAccess.LoadData<PersonRelationTypeLanguage, dynamic>(usp, new { UserId = UserId, PersonRelationTypeId = PersonRelationTypeId });

        }
        public Task<PersonRelationTypeLanguage> GetPersonRelationTypeLanguage(string UserId, int PersonRelationTypeLanguageId)
        {
            string usp = "usp_PersonRelationTypeLanguage @UserId, @PersonRelationTypeLanguageID";
            return _sqlDataAccess.LoadSingleRecord<PersonRelationTypeLanguage, dynamic>(usp, new { UserId = UserId, PersonRelationTypeLanguageId = PersonRelationTypeLanguageId });

        }
        public Task<List<PersonRelationType>> GetPersonRelationTypes(string UserId)
        {
            string usp = "usp_PersonRelationTypes @UserID";
            return _sqlDataAccess.LoadData<PersonRelationType, dynamic>(usp, new { UserId = UserId });

        }
        public Task<PersonRelationType> GetPersonRelationType(string UserId, int PersonRelationTypeId)
        {
            string usp = "usp_PersonRelationType @UserId, @PersonRelationTypeID";
            return _sqlDataAccess.LoadSingleRecord<PersonRelationType, dynamic>(usp, new { UserId = UserId, PersonRelationTypeId = PersonRelationTypeId });

        }
        public Task<List<Person>> GetPersons(string UserId)
        {
            string usp = "usp_Persons @UserID";
            return _sqlDataAccess.LoadData<Person, dynamic>(usp, new { UserId = UserId });

        }
        public Task<Person> GetPerson(string UserId, int PersonId)
        {
            string usp = "usp_Person @UserId, @PersonID";
            return _sqlDataAccess.LoadSingleRecord<Person, dynamic>(usp, new { UserId = UserId, PersonId = PersonId });

        }
        public Task<List<PersonTelecom>> GetPersonTelecoms(string UserId, int PersonId)
        {
            string usp = "usp_Persons @UserId, @PersonID";
            return _sqlDataAccess.LoadData<PersonTelecom, dynamic>(usp, new { UserId = UserId, PersonId = PersonId });

        }
        public Task<PersonTelecom> GetPersonTelecom(string UserId, int PersonTelecomId)
        {
            string usp = "usp_PersonTelecom @UserId, @PersonTelecomID";
            return _sqlDataAccess.LoadSingleRecord<PersonTelecom, dynamic>(usp, new { UserId = UserId, PersonTelecomId = PersonTelecomId });

        }
        public Task<List<PreferenceType>> GetPreferenceTypes(string UserId)
        {
            string usp = "usp_PreferenceTypes @UserID";
            return _sqlDataAccess.LoadData<PreferenceType, dynamic>(usp, new { UserId = UserId });

        }
        public Task<PreferenceType> GetPreferenceType(string UserId, int PreferenceTypeId)
        {
            string usp = "usp_PreferenceType @UserId, @PreferenceTypeID";
            return _sqlDataAccess.LoadSingleRecord<PreferenceType, dynamic>(usp, new { UserId = UserId, PreferenceTypeId = PreferenceTypeId });

        }
        public Task<List<RoleGroupLanguage>> GetRoleGroupLanguages(string UserId, int RoleGroupId)
        {
            string usp = "usp_RoleGroupLanguages @UserId, @RoleGroupID";
            return _sqlDataAccess.LoadData<RoleGroupLanguage, dynamic>(usp, new { UserId = UserId, RoleGroupId = RoleGroupId });

        }
        public Task<RoleGroupLanguage> GetRoleGroupLanguage(string UserId, int RoleGroupLanguageId)
        {
            string usp = "usp_RoleGroupLanguage @UserId, @RoleGroupLanguageID";
            return _sqlDataAccess.LoadSingleRecord<RoleGroupLanguage, dynamic>(usp, new { UserId = UserId, RoleGroupLanguageId = RoleGroupLanguageId });

        }
        public Task<List<RoleGroup>> GetRoleGroups(string UserId)
        {
            string usp = "usp_RoleGroups @UserID";
            return _sqlDataAccess.LoadData<RoleGroup, dynamic>(usp, new { UserId = UserId });

        }
        public Task<RoleGroup> GetRoleGroup(string UserId, int RoleGroupId)
        {
            string usp = "usp_RoleGroup @UserId, @RoleGroupID";
            return _sqlDataAccess.LoadSingleRecord<RoleGroup, dynamic>(usp, new { UserId = UserId, RoleGroupId = RoleGroupId });

        }
        public Task<List<RoleLanguage>> GetRoleLanguages(string UserId, string RoleId)
        {
            string usp = "usp_RoleLanguages @UserId, @RoleID";
            return _sqlDataAccess.LoadData<RoleLanguage, dynamic>(usp, new { UserId = UserId, RoleId = RoleId });

        }
        public Task<RoleLanguage> GetRoleLanguage(string UserId, int RoleLanguageId)
        {
            string usp = "usp_RoleLanguage @UserId, @RoleLanguageID";
            return _sqlDataAccess.LoadSingleRecord<RoleLanguage, dynamic>(usp, new { UserId = UserId, RoleLanguageId = RoleLanguageId });

        }
        public Task<List<SecurityLevel>> GetSecurityLevels(string UserId)
        {
            string usp = "usp_SecurityLevels @UserID";
            return _sqlDataAccess.LoadData<SecurityLevel, dynamic>(usp, new { UserId = UserId });

        }
        public Task<SecurityLevel> GetSecurityLevel(string UserId, int SecurityLevelId)
        {
            string usp = "usp_SecurityLevel @UserId, @SecurityLevelID";
            return _sqlDataAccess.LoadSingleRecord<SecurityLevel, dynamic>(usp, new { UserId = UserId, SecurityLevelId = SecurityLevelId });

        }
        public Task<List<UserPreference>> GetUserPreferences(string UserId, string SelectedUserId)
        {
            string usp = "usp_UserPreferences @UserId, @SelectedUserID";
            return _sqlDataAccess.LoadData<UserPreference, dynamic>(usp, new { UserId = UserId, SelectedUserId = SelectedUserId });

        }
        public Task<UserPreference> GetUserPreference(string UserId, int UserPreferenceId)
        {
            string usp = "usp_UserPreference @UserId, @UserPreferenceID";
            return _sqlDataAccess.LoadSingleRecord<UserPreference, dynamic>(usp, new { UserId = UserId, UserPreferenceId = UserPreferenceId });

        }
    }
}
