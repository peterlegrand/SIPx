using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IUserMenuProvider
    {
        bool UserMenuTemplateCreatePost(UserMenuTemplateCreatePost UserMenuTemplate);
        Task<string> UserMenuTemplateCreatePostCheck(UserMenuTemplateCreatePost UserMenuTemplate);
        Task<List<UserMenuTemplateIndexGet>> UserMenuTemplateIndexGet(string UserId);
        Task<List<UserMenuTemplateLanguageIndexGet>> UserMenuTemplateLanguageIndexGet(string UserId, int UserMenuTemplateId);
        Task<UserMenuTemplateLanguageIndexGet> UserMenuTemplateLanguageUpdateGet(string UserId, int UserMenuTemplateLanguageId);
        Task<List<SequenceList>> UserMenuTemplateOptionCreateGetSequence(string UserId, int ClassificationId);
        bool UserMenuTemplateOptionCreatePost(UserMenuTemplateOptionCreateGet UserMenuTemplateOption);
        Task<string> UserMenuTemplateOptionCreatePostCheck(UserMenuTemplateOptionCreateGet UserMenuTemplateOption);
        Task<List<UserMenuTemplateOptionIndexGet>> UserMenuTemplateOptionIndexGet(string UserId, int ClassificationId);
        Task<List<UserMenuTemplateOptionLanguageIndexGet>> UserMenuTemplateOptionLanguageIndexGet(string UserId, int UserMenuTemplateOptionId);
        Task<UserMenuTemplateOptionLanguageIndexGet> UserMenuTemplateOptionLanguageUpdateGet(string UserId, int UserMenuTemplateOptionLanguageId);
        Task<UserMenuTemplateOptionUpdateGet> UserMenuTemplateOptionUpdateGet(string UserId, int UserMenuTemplateOptionId);
        Task<UserMenuTemplateUpdateGet> UserMenuTemplateUpdateGet(string UserId, int UserMenuTemplateID);
        bool UserMenuTemplateUpdatePut(UserMenuTemplateUpdateGet UserMenuTemplate);
        Task<List<UserMenuIndexGet>> UserMenuIndexGet(string UserId);
        Task<List<SequenceList>> UserMenuCreateGetSequence(string UserId);
        bool UserMenuCreatePost(UserMenuCreateGet UserMenu);
        Task<List<PartialLeftUserMenu>> PartialLeftUserMenu(string UserId);
    }
}