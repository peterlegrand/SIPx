using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.API.DataProviders
{
    public interface IUserPreferenceProvider
    {
        Task<List<UserPreferenceIndexGet>> IndexGet(string UserId, string SelectedUserId);
        Task<UserPreferenceUpdateGet> UpdateGet(string UserId, int UserPreferenceId);
        Task<bool> UpdatePost(UserPreferenceUpdateGet UserPreference);
        Task<string> UpdatePostCheck(UserPreferenceUpdateGet UserPreference);
    }
}