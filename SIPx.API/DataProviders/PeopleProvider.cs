
using Dapper;
using SIPx.API.ViewModels;
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

        public async Task<List<RoleClaim>> GetRoleClaims(string UserID, string RoleID)
        {
            string usp = "usp_RoleClaims @UserID, @RoleID";
            var x = await _sqlDataAccess.LoadData<RoleClaim, dynamic>(usp, new { UserID = UserID, RoleID = RoleID });
            return x;
        }
        //public async Task<RoleClaim> GetRoleClaim(string UserID, int RoleID)
        //{
        //    string usp = "usp_RoleClaims @UserID, @RoleID";
        //    var x = await _sqlDataAccess.LoadSingleRecord<RoleClaim, dynamic>(usp, new { UserID = UserID, RoleID = RoleID });
        //    return x;
        //}
        public async Task<List<Role>> GetRoles(string UserID)
        {
            string usp = "usp_Roless @UserID";
            var x = await _sqlDataAccess.LoadData<Role, dynamic>(usp, new { UserID = UserID });
            return x;
        }
        public Task<Role> GetRole(string UserID, string RoleID)
        {
            string usp = "usp_role @UserID, @RoleID";
            return _sqlDataAccess.LoadSingleRecord<Role, dynamic>(usp, new { UserID = UserID, roleID = RoleID });

        }
        public async Task<List<UserRole>> GetUserRoles(string UserID, string UserRoleUserID)
        {
            string usp = "usp_UserRoles @UserID, @UserRoleUserID";
            var x = await _sqlDataAccess.LoadData<UserRole, dynamic>(usp, new { UserID = UserID, UserRoleUserID = UserRoleUserID });
            return x;
        }
        public async Task<List<User>> GetUsers(string UserID)
        {
            string usp = "usp_Users @UserID";
            var x = await _sqlDataAccess.LoadData<User, dynamic>(usp, new { UserID = UserID });
            return x;
        }
        public Task<User> GetUser(string UserID, string SelectedUserID)
        {
            string usp = "usp_User @UserID, @SelectedUserID";
            return _sqlDataAccess.LoadSingleRecord<User, dynamic>(usp, new { UserID = UserID, SelectedUserID = SelectedUserID });

        }
        public async Task<List<ClaimGroup>> GetClaimGroups(string UserID)
        {
            string usp = "usp_ClaimGroups @UserID";
            var x = await _sqlDataAccess.LoadData<ClaimGroup, dynamic>(usp, new { UserID = UserID });
            return x;
        }
        public Task<ClaimGroup> GetClaimGroup(string UserID, int ClaimGroupID)
        {
            string usp = "usp_ClaimGroup @UserID, @ClaimGroupID";
            return _sqlDataAccess.LoadSingleRecord<ClaimGroup, dynamic>(usp, new { UserID = UserID, ClaimGroupID = ClaimGroupID });

        }
        public async Task<List<Claim>> GetClaims(string UserID)
        {
            string usp = "usp_Claims @UserID";
            var x = await _sqlDataAccess.LoadData<Claim, dynamic>(usp, new { UserID = UserID });
            return x;
        }
        public Task<Claim> GetClaim(string UserID, int ClaimID)
        {
            string usp = "usp_Claim @UserID, @ClaimID";
            return _sqlDataAccess.LoadSingleRecord<Claim, dynamic>(usp, new { UserID = UserID, ClaimID = ClaimID });

        }
        public Task<List<PersonAddress>> GetPersonAddresses(string UserID, int PersonID)
        {
            string usp = "usp_PersonAddresses @UserID, @PersonID";
            return _sqlDataAccess.LoadData<PersonAddress, dynamic>(usp, new { UserID = UserID, PersonID = PersonID });

        }
        public Task<PersonAddress> GetPersonAddress(string UserID, int PersonAddressID)
        {
            string usp = "usp_PersonAddress @UserID, @PersonAddressID";
            return _sqlDataAccess.LoadSingleRecord<PersonAddress, dynamic>(usp, new { UserID = UserID, PersonAddressID = PersonAddressID });

        }
        public Task<List<PersonRelation>> GetPersonRelations(string UserID, int PersonID)
        {
            string usp = "usp_PersonRelations @UserID, @PersonID";
            return _sqlDataAccess.LoadData<PersonRelation, dynamic>(usp, new { UserID = UserID, PersonID = PersonID });

        }
        public Task<PersonRelation> GetPersonRelation(string UserID, int PersonRelationID)
        {
            string usp = "usp_PersonRelation @UserID, @PersonRelationID";
            return _sqlDataAccess.LoadSingleRecord<PersonRelation, dynamic>(usp, new { UserID = UserID, PersonAddressID = PersonRelationID });

        }
        public Task<List<PersonRelationTypeLanguage>> GetPersonRelationTypeLanguages(string UserID, int PersonRelationTypeID)
        {
            string usp = "usp_PersonRelationTypeLanguages @UserID, @PersonRelationTypeID";
            return _sqlDataAccess.LoadData<PersonRelationTypeLanguage, dynamic>(usp, new { UserID = UserID, PersonRelationTypeID = PersonRelationTypeID });

        }
        public Task<PersonRelationTypeLanguage> GetPersonRelationTypeLanguage(string UserID, int PersonRelationTypeLanguageID)
        {
            string usp = "usp_PersonRelationTypeLanguage @UserID, @PersonRelationTypeLanguageID";
            return _sqlDataAccess.LoadSingleRecord<PersonRelationTypeLanguage, dynamic>(usp, new { UserID = UserID, PersonRelationTypeLanguageID = PersonRelationTypeLanguageID });

        }
        public Task<List<PersonRelationType>> GetPersonRelationTypes(string UserID)
        {
            string usp = "usp_PersonRelationTypes @UserID";
            return _sqlDataAccess.LoadData<PersonRelationType, dynamic>(usp, new { UserID = UserID });

        }
        public Task<PersonRelationType> GetPersonRelationType(string UserID, int PersonRelationTypeID)
        {
            string usp = "usp_PersonRelationType @UserID, @PersonRelationTypeID";
            return _sqlDataAccess.LoadSingleRecord<PersonRelationType, dynamic>(usp, new { UserID = UserID, PersonRelationTypeID = PersonRelationTypeID });

        }
        public Task<List<Person>> GetPersons(string UserID)
        {
            string usp = "usp_Persons @UserID";
            return _sqlDataAccess.LoadData<Person, dynamic>(usp, new { UserID = UserID });

        }
        public Task<Person> GetPerson(string UserID, int PersonID)
        {
            string usp = "usp_Person @UserID, @PersonID";
            return _sqlDataAccess.LoadSingleRecord<Person, dynamic>(usp, new { UserID = UserID, PersonID = PersonID });

        }
        public Task<List<PersonTelecom>> GetPersonTelecoms(string UserID, int PersonID)
        {
            string usp = "usp_Persons @UserID, @PersonID";
            return _sqlDataAccess.LoadData<PersonTelecom, dynamic>(usp, new { UserID = UserID, PersonID = PersonID });

        }
        public Task<PersonTelecom> GetPersonTelecom(string UserID, int PersonTelecomID)
        {
            string usp = "usp_PersonTelecom @UserID, @PersonTelecomID";
            return _sqlDataAccess.LoadSingleRecord<PersonTelecom, dynamic>(usp, new { UserID = UserID, PersonTelecomID = PersonTelecomID });

        }
        public Task<List<PreferenceType>> GetPreferenceTypes(string UserID)
        {
            string usp = "usp_PreferenceTypes @UserID";
            return _sqlDataAccess.LoadData<PreferenceType, dynamic>(usp, new { UserID = UserID });

        }
        public Task<PreferenceType> GetPreferenceType(string UserID, int PreferenceTypeID)
        {
            string usp = "usp_PreferenceType @UserID, @PreferenceTypeID";
            return _sqlDataAccess.LoadSingleRecord<PreferenceType, dynamic>(usp, new { UserID = UserID, PreferenceTypeID = PreferenceTypeID });

        }
        public Task<List<RoleGroupLanguage>> GetRoleGroupLanguages(string UserID, int RoleGroupID)
        {
            string usp = "usp_RoleGroupLanguages @UserID, @RoleGroupID";
            return _sqlDataAccess.LoadData<RoleGroupLanguage, dynamic>(usp, new { UserID = UserID, RoleGroupID = RoleGroupID });

        }
        public Task<RoleGroupLanguage> GetRoleGroupLanguage(string UserID, int RoleGroupLanguageID)
        {
            string usp = "usp_RoleGroupLanguage @UserID, @RoleGroupLanguageID";
            return _sqlDataAccess.LoadSingleRecord<RoleGroupLanguage, dynamic>(usp, new { UserID = UserID, RoleGroupLanguageID = RoleGroupLanguageID });

        }
        public Task<List<RoleGroup>> GetRoleGroups(string UserID)
        {
            string usp = "usp_RoleGroups @UserID";
            return _sqlDataAccess.LoadData<RoleGroup, dynamic>(usp, new { UserID = UserID });

        }
        public Task<RoleGroup> GetRoleGroup(string UserID, int RoleGroupID)
        {
            string usp = "usp_RoleGroup @UserID, @RoleGroupID";
            return _sqlDataAccess.LoadSingleRecord<RoleGroup, dynamic>(usp, new { UserID = UserID, RoleGroupID = RoleGroupID });

        }
        public Task<List<RoleLanguage>> GetRoleLanguages(string UserID, string RoleID)
        {
            string usp = "usp_RoleLanguages @UserID, @RoleID";
            return _sqlDataAccess.LoadData<RoleLanguage, dynamic>(usp, new { UserID = UserID, RoleID = RoleID });

        }
        public Task<RoleLanguage> GetRoleLanguage(string UserID, int RoleLanguageID)
        {
            string usp = "usp_RoleLanguage @UserID, @RoleLanguageID";
            return _sqlDataAccess.LoadSingleRecord<RoleLanguage, dynamic>(usp, new { UserID = UserID, RoleLanguageID = RoleLanguageID });

        }
        public Task<List<SecurityLevel>> GetSecurityLevels(string UserID)
        {
            string usp = "usp_SecurityLevels @UserID";
            return _sqlDataAccess.LoadData<SecurityLevel, dynamic>(usp, new { UserID = UserID });

        }
        public Task<SecurityLevel> GetSecurityLevel(string UserID, int SecurityLevelID)
        {
            string usp = "usp_SecurityLevel @UserID, @SecurityLevelID";
            return _sqlDataAccess.LoadSingleRecord<SecurityLevel, dynamic>(usp, new { UserID = UserID, SecurityLevelID = SecurityLevelID });

        }
        public Task<List<UserPreference>> GetUserPreferences(string UserID, string SelectedUserID)
        {
            string usp = "usp_UserPreferences @UserID, @SelectedUserID";
            return _sqlDataAccess.LoadData<UserPreference, dynamic>(usp, new { UserID = UserID, SelectedUserID = SelectedUserID });

        }
        public Task<UserPreference> GetUserPreference(string UserID, int UserPreferenceID)
        {
            string usp = "usp_UserPreference @UserID, @UserPreferenceID";
            return _sqlDataAccess.LoadSingleRecord<UserPreference, dynamic>(usp, new { UserID = UserID, UserPreferenceID = UserPreferenceID });

        }
    }
}
