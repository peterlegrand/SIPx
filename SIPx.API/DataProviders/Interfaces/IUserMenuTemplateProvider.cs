using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IUserMenuTemplateProvider
    {
        bool CreatePost(UserMenuTemplateCreatePost UserMenuTemplate);
        Task<string> CreatePostCheck(UserMenuTemplateCreatePost UserMenuTemplate);
        Task<List<UserMenuTemplateIndexGet>> IndexGet(string UserId);
        Task<List<UserMenuTemplateLanguageIndexGet>> LanguageIndexGet(string UserId, int UserMenuTemplateId);
        Task<UserMenuTemplateLanguageIndexGet> LanguageUpdateGet(string UserId, int UserMenuTemplateLanguageId);
        Task<UserMenuTemplateUpdateGet> UpdateGet(string UserId, int UserMenuTemplateID);
        bool UpdatePost(UserMenuTemplateUpdateGet UserMenuTemplate);
        Task<string> UpdatePostCheck(UserMenuTemplateUpdateGet UserMenuTemplate);
        bool UpdatePut(UserMenuTemplateUpdateGet UserMenuTemplate);
    }
}