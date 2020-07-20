using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IPeopleProvider
    {
        Task<List<ClaimGroupIndexGet>> ClaimGroupIndexGet(string UserId);
        Task<ClaimGroupUpdateGet> ClaimGroupUpdateGet(string UserId, int ClaimGroupId);
        Task<List<ClaimIndexGet>> ClaimIndexGet(string UserId);
        Task<ClaimUpdateGet> ClaimUpdateGet(string UserId, int ClaimId);
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
        Task<List<RoleClaimIndexGet>> RoleClaimIndexGet(string UserId, string RoleId);
        Task<List<RoleGroupIndexGet>> RoleGroupIndexGet(string UserId);
        Task<List<RoleGroupLanguage>> RoleGroupLanguageIndexGet(string UserId, int RoleGroupId);
        Task<RoleGroupLanguage> RoleGroupLanguageUpdateGet(string UserId, int RoleGroupLanguageId);
        Task<RoleGroupUpdateGet> RoleGroupUpdateGet(string UserId, int RoleGroupId);
        Task<List<RoleIndexGet>> RoleIndexGet(string UserId);
        Task<List<RoleLanguageIndexGet>> RoleLanguageIndexGet(string UserId, string RoleId);
        Task<RoleLanguageUpdateGet> RoleLanguageUpdateGet(string UserId, int RoleLanguageId);
        Task<List<RoleList>> RoleList(string UserId);
        Task<RoleUpdateGet> RoleUpdateGet(string UserId, string RoleId);
        Task<List<SecurityLevelIndexGet>> SecurityLevelIndexGet(string UserId);
        Task<SecurityLevelUpdateGet> SecurityLevelUpdateGet(string UserId, int SecurityLevelId);
        Task<List<UserIndexGet>> UserIndexGet(string UserId);
        Task<List<UserList>> UserList();
        Task<List<UserPreferenceIndexGet>> UserPreferenceIndexGet(string UserId, string SelectedUserId);
        Task<UserPreferenceUpdateGet> UserPreferenceUpdateGet(string UserId, int UserPreferenceId);
        Task<List<UserRoleIndexGet>> UserRoleIndexGet(string UserId, string UserRoleUserId);
        Task<UserUpdateGet> UserUpdateGet(string UserId, string SelectedUserId);
    }
}