using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IUserMenuTemplateOptionProvider
    {
        Task<List<SequenceList>> UserMenuTemplateOptionCreateGetSequence(string UserId, int UserMenuTemplateId);
        bool UserMenuTemplateOptionCreatePost(UserMenuTemplateOptionCreateGet UserMenuTemplateOption);
        bool UserMenuTemplateOptionCreatePost(UserMenuTemplateOptionCreatePost UserMenuTemplateOption);
        Task<string> UserMenuTemplateOptionCreatePostCheck(UserMenuTemplateOptionCreateGet UserMenuTemplateOption);
        Task<List<UserMenuTemplateOptionIndexGet>> UserMenuTemplateOptionIndexGet(string UserId, int UserMenuTemplateId);
        Task<List<UserMenuTemplateOptionLanguageIndexGet>> UserMenuTemplateOptionLanguageIndexGet(string UserId, int UserMenuTemplateOptionId);
        Task<UserMenuTemplateOptionLanguageIndexGet> UserMenuTemplateOptionLanguageUpdateGet(string UserId, int UserMenuTemplateOptionLanguageId);
        Task<UserMenuTemplateOptionUpdateGet> UserMenuTemplateOptionUpdateGet(string UserId, int UserMenuTemplateOptionId);
    }
}