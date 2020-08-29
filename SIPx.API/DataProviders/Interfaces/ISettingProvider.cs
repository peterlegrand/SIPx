using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface ISettingProvider
    {
        Task<List<SettingIndexGet>> IndexGet(string UserId);
        Task<SettingUpdateGet> UpdateGet(string UserId, int SettingId);
        bool UpdatePost(SettingUpdateGet Setting);
    }
}