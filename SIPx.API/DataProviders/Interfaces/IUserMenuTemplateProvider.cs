using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IUserMenuTemplateProvider
    {
        bool UserMenuTemplateCreatePost(UserMenuTemplateCreatePost UserMenuTemplate);
        Task<string> UserMenuTemplateCreatePostCheck(UserMenuTemplateCreatePost UserMenuTemplate);
        Task<List<UserMenuTemplateIndexGet>> UserMenuTemplateIndexGet(string UserId);
        Task<List<UserMenuTemplateLanguageIndexGet>> UserMenuTemplateLanguageIndexGet(string UserId, int UserMenuTemplateId);
        Task<UserMenuTemplateLanguageIndexGet> UserMenuTemplateLanguageUpdateGet(string UserId, int UserMenuTemplateLanguageId);
        Task<UserMenuTemplateUpdateGet> UserMenuTemplateUpdateGet(string UserId, int UserMenuTemplateID);
        bool UserMenuTemplateUpdatePost(UserMenuTemplateUpdateGet UserMenuTemplate);
        Task<string> UserMenuTemplateUpdatePostCheck(UserMenuTemplateUpdateGet UserMenuTemplate);
        bool UserMenuTemplateUpdatePut(UserMenuTemplateUpdateGet UserMenuTemplate);
    }
}