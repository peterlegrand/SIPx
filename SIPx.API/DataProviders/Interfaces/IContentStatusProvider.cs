using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IContentStatusProvider
    {
        Task<List<ContentStatus>> IndexGet(string UserId);
        //Task<ContentStatus> UpdateGet(string UserId, int ContentStatusId);
        Task<List<ContentStatusList>> List(string UserId);
    }
}