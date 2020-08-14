using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IContentStatusProvider
    {
        Task<List<ContentStatus>> ContentStatusIndexGet(string UserId);
        Task<ContentStatus> ContentStatusUpdateGet(string UserId, int ContentStatusId);
    }
}