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
        Task<List<GenderList>> GenderList(string UserId);
        Task<string> PersonAddressCreatePost(PersonAddressCreatePost PersonAddress);
        Task<string> PersonAddressCreatePostCheck(PersonAddressCreatePost PersonAddress);
        Task<List<PersonAddressIndexGet>> PersonAddressIndexGet(string UserId, int PersonId);
        Task<PersonAddressUpdateGet> PersonAddressUpdateGet(string UserId, int PersonAddressId);
        Task<string> PersonCreatePost(PersonCreatePost Person);
        Task<string> PersonCreatePostCheck(PersonCreatePost Person);
        Task<List<PersonIndexGet>> PersonIndexGet(string UserId);
        Task<List<PersonList>> PersonList(string UserId);
        Task<string> PersonRelationCreatePost(PersonRelationCreatePost PersonRelation);
        Task<string> PersonRelationCreatePostCheck(PersonRelationCreatePost PersonRelation);
        Task<List<PersonRelationIndexGet>> PersonRelationIndexGet(string UserId, int PersonId);
        Task<List<PersonRelationType>> PersonRelationTypeIndexGet(string UserId);
        Task<List<PersonRelationTypeLanguage>> PersonRelationTypeLanguageIndexGet(string UserId, int PersonRelationTypeId);
        Task<PersonRelationTypeLanguage> PersonRelationTypeLanguageUpdateGet(string UserId, int PersonRelationTypeLanguageId);
        Task<List<PersonRelationTypeList>> PersonRelationTypeList(string UserId);
        Task<PersonRelationType> PersonRelationTypeUpdateGet(string UserId, int PersonRelationTypeId);
        Task<PersonRelationUpdateGet> PersonRelationUpdateGet(string UserId, int PersonRelationId);
        Task<string> PersonTelecomCreatePost(PersonTelecomCreatePost PersonTelecom);
        Task<string> PersonTelecomCreatePostCheck(PersonTelecomCreatePost PersonTelecom);
        Task<List<PersonTelecomIndexGet>> PersonTelecomIndexGet(string UserId, int PersonId);
        Task<PersonTelecomUpdateGet> PersonTelecomUpdateGet(string UserId, int PersonTelecomId);
        Task<PersonUpdateGet> PersonUpdateGet(string UserId, int PersonId);
        Task<List<PreferenceType>> PreferenceTypeIndexGet(string UserId);
        Task<PreferenceType> PreferenceTypeUpdateGet(string UserId, int PreferenceTypeId);
        Task<List<RoleClaimIndexGet>> RoleClaimIndexGet(string UserId, string RoleId);
        Task<string> RoleGroupCreatePost(RoleGroupCreatePost RoleGroup);
        Task<string> RoleGroupCreatePostCheck(RoleGroupCreatePost RoleGroup);
        Task<List<RoleGroupIndexGet>> RoleGroupIndexGet(string UserId);
        Task<List<RoleGroupLanguageIndexGet>> RoleGroupLanguageIndexGet(string UserId, int RoleGroupId);
        Task<RoleGroupLanguageIndexGet> RoleGroupLanguageUpdateGet(string UserId, int RoleGroupLanguageId);
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
        Task<List<UserMenuTypeList>> UserMenuTypeLeftList(string UserId);
        Task<List<UserMenuTypeList>> UserMenuTypeRightList(string UserId);
        Task<List<UserRoleIndexGet>> UserRoleIndexGet(string UserId, string UserRoleUserId);
        Task<UserUpdateGet> UserUpdateGet(string UserId, string SelectedUserId);
    }
}