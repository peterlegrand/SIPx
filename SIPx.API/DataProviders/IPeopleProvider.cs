using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IPeopleProvider
    {
        Task<List<ClaimGroup>> ClaimGroupIndexGet(string UserId);
        Task<ClaimGroup> ClaimGroupUpdateGet(string UserId, int ClaimGroupId);
        Task<List<Claim>> ClaimIndexGet(string UserId);
        Task<Claim> ClaimUpdateGet(string UserId, int ClaimId);
        Task<List<PersonAddress>> PersonAddressIndexGet(string UserId, int PersonId);
        Task<PersonAddress> PersonAddressUpdateGet(string UserId, int PersonAddressId);
        Task<List<Person>> PersonIndexGet(string UserId);
        Task<List<PersonRelation>> PersonRelationIndexGet(string UserId, int PersonId);
        Task<List<PersonRelationType>> PersonRelationTypeIndexGet(string UserId);
        Task<List<PersonRelationTypeLanguage>> PersonRelationTypeLanguageIndexGet(string UserId, int PersonRelationTypeId);
        Task<PersonRelationTypeLanguage> PersonRelationTypeLanguageUpdateGet(string UserId, int PersonRelationTypeLanguageId);
        Task<PersonRelationType> PersonRelationTypeUpdateGet(string UserId, int PersonRelationTypeId);
        Task<PersonRelation> PersonRelationUpdateGet(string UserId, int PersonRelationId);
        Task<List<PersonTelecom>> PersonTelecomIndexGet(string UserId, int PersonId);
        Task<PersonTelecom> PersonTelecomUpdateGet(string UserId, int PersonTelecomId);
        Task<Person> PersonUpdateGet(string UserId, int PersonId);
        Task<List<PreferenceType>> PreferenceTypeIndexGet(string UserId);
        Task<PreferenceType> PreferenceTypeUpdateGet(string UserId, int PreferenceTypeId);
        Task<List<RoleClaim>> RoleClaimIndexGet(string UserId, string RoleId);
        Task<List<RoleGroup>> RoleGroupIndexGet(string UserId);
        Task<List<RoleGroupLanguage>> RoleGroupLanguageIndexGet(string UserId, int RoleGroupId);
        Task<RoleGroupLanguage> RoleGroupLanguageUpdateGet(string UserId, int RoleGroupLanguageId);
        Task<RoleGroup> RoleGroupUpdateGet(string UserId, int RoleGroupId);
        Task<List<Role>> RoleIndexGet(string UserId);
        Task<List<RoleLanguage>> RoleLanguageIndexGet(string UserId, string RoleId);
        Task<RoleLanguage> RoleLanguageUpdateGet(string UserId, int RoleLanguageId);
        Task<List<RoleList>> RoleList(string UserId);
        Task<Role> RoleUpdateGet(string UserId, string RoleId);
        Task<List<SecurityLevel>> SecurityLevelIndexGet(string UserId);
        Task<SecurityLevel> SecurityLevelUpdateGet(string UserId, int SecurityLevelId);
        Task<List<User>> UserIndexGet(string UserId);
        Task<List<UserList>> UserList();
        Task<List<UserPreference>> UserPreferenceIndexGet(string UserId, string SelectedUserId);
        Task<UserPreference> UserPreferenceUpdateGet(string UserId, int UserPreferenceId);
        Task<List<UserRole>> UserRoleIndexGet(string UserId, string UserRoleUserId);
        Task<User> UserUpdateGet(string UserId, string SelectedUserId);
    }
}