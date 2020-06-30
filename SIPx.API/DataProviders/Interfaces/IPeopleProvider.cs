using SIPx.API.ViewModels;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IPeopleProvider
    {
        Task<Claim> GetClaim(string UserId, int ClaimId);
        Task<ClaimGroup> GetClaimGroup(string UserId, int ClaimGroupId);
        Task<List<ClaimGroup>> GetClaimGroups(string UserId);
        Task<List<Claim>> GetClaims(string UserId);
        Task<Person> GetPerson(string UserId, int PersonId);
        Task<PersonAddress> GetPersonAddress(string UserId, int PersonAddressId);
        Task<List<PersonAddress>> GetPersonAddresses(string UserId, int PersonId);
        Task<PersonRelation> GetPersonRelation(string UserId, int PersonRelationId);
        Task<List<PersonRelation>> GetPersonRelations(string UserId, int PersonId);
        Task<PersonRelationType> GetPersonRelationType(string UserId, int PersonRelationTypeId);
        Task<PersonRelationTypeLanguage> GetPersonRelationTypeLanguage(string UserId, int PersonRelationTypeLanguageId);
        Task<List<PersonRelationTypeLanguage>> GetPersonRelationTypeLanguages(string UserId, int PersonRelationTypeId);
        Task<List<PersonRelationType>> GetPersonRelationTypes(string UserId);
        Task<List<Person>> GetPersons(string UserId);
        Task<PersonTelecom> GetPersonTelecom(string UserId, int PersonTelecomId);
        Task<List<PersonTelecom>> GetPersonTelecoms(string UserId, int PersonId);
        Task<PreferenceType> GetPreferenceType(string UserId, int PreferenceTypeId);
        Task<List<PreferenceType>> GetPreferenceTypes(string UserId);
        Task<Role> GetRole(string UserId, string RoleId);
        Task<List<RoleClaim>> GetRoleClaims(string UserId, string RoleId);
        Task<RoleGroup> GetRoleGroup(string UserId, int RoleGroupId);
        Task<RoleGroupLanguage> GetRoleGroupLanguage(string UserId, int RoleGroupLanguageId);
        Task<List<RoleGroupLanguage>> GetRoleGroupLanguages(string UserId, int RoleGroupId);
        Task<List<RoleGroup>> GetRoleGroups(string UserId);
        Task<RoleLanguage> GetRoleLanguage(string UserId, int RoleLanguageId);
        Task<List<RoleLanguage>> GetRoleLanguages(string UserId, string RoleId);
        Task<List<Role>> GetRoles(string UserId);
        Task<SecurityLevel> GetSecurityLevel(string UserId, int SecurityLevelId);
        Task<List<SecurityLevel>> GetSecurityLevels(string UserId);
        Task<User> GetUser(string UserId, string SelectedUserId);
        Task<UserPreference> GetUserPreference(string UserId, int UserPreferenceId);
        Task<List<UserPreference>> GetUserPreferences(string UserId, string SelectedUserId);
        Task<List<UserRole>> GetUserRoles(string UserId, string UserRoleUserId);
        Task<List<User>> GetUsers(string UserId);
    }
}