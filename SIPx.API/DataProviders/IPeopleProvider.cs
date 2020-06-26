using SIPx.API.ViewModels;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IPeopleProvider
    {
        Task<Claim> GetClaim(string UserID, int ClaimID);
        Task<ClaimGroup> GetClaimGroup(string UserID, int ClaimGroupID);
        Task<List<ClaimGroup>> GetClaimGroups(string UserID);
        Task<List<Claim>> GetClaims(string UserID);
        Task<Person> GetPerson(string UserID, int PersonID);
        Task<PersonAddress> GetPersonAddress(string UserID, int PersonAddressID);
        Task<List<PersonAddress>> GetPersonAddresses(string UserID, int PersonID);
        Task<PersonRelation> GetPersonRelation(string UserID, int PersonRelationID);
        Task<List<PersonRelation>> GetPersonRelations(string UserID, int PersonID);
        Task<PersonRelationType> GetPersonRelationType(string UserID, int PersonRelationTypeID);
        Task<PersonRelationTypeLanguage> GetPersonRelationTypeLanguage(string UserID, int PersonRelationTypeLanguageID);
        Task<List<PersonRelationTypeLanguage>> GetPersonRelationTypeLanguages(string UserID, int PersonRelationTypeID);
        Task<List<PersonRelationType>> GetPersonRelationTypes(string UserID);
        Task<List<Person>> GetPersons(string UserID);
        Task<PersonTelecom> GetPersonTelecom(string UserID, int PersonTelecomID);
        Task<List<PersonTelecom>> GetPersonTelecoms(string UserID, int PersonID);
        Task<PreferenceType> GetPreferenceType(string UserID, int PreferenceTypeID);
        Task<List<PreferenceType>> GetPreferenceTypes(string UserID);
        Task<Role> GetRole(string UserID, string RoleID);
        Task<List<RoleClaim>> GetRoleClaims(string UserID, string RoleID);
        Task<RoleGroup> GetRoleGroup(string UserID, int RoleGroupID);
        Task<RoleGroupLanguage> GetRoleGroupLanguage(string UserID, int RoleGroupLanguageID);
        Task<List<RoleGroupLanguage>> GetRoleGroupLanguages(string UserID, int RoleGroupID);
        Task<List<RoleGroup>> GetRoleGroups(string UserID);
        Task<RoleLanguage> GetRoleLanguage(string UserID, int RoleLanguageID);
        Task<List<RoleLanguage>> GetRoleLanguages(string UserID, string RoleID);
        Task<List<Role>> GetRoles(string UserID);
        Task<SecurityLevel> GetSecurityLevel(string UserID, int SecurityLevelID);
        Task<List<SecurityLevel>> GetSecurityLevels(string UserID);
        Task<User> GetUser(string UserID, string SelectedUserID);
        Task<UserPreference> GetUserPreference(string UserID, int UserPreferenceID);
        Task<List<UserPreference>> GetUserPreferences(string UserID, string SelectedUserID);
        Task<List<UserRole>> GetUserRoles(string UserID, string UserRoleUserID);
        Task<List<User>> GetUsers(string UserID);
    }
}