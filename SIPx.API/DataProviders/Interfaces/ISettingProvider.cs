using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface ISettingProvider
    {
        Task<List<SettingIndexGet>> SettingIndexGet(string UserId);
        Task<SettingUpdateGet> SettingUpdateGet(string UserId, int SettingId);
    }
}