using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IClassificationLevelPropertyStatusProvider
    {
        Task<List<ClassificationLevelPropertyStatusList>> List(string UserId);
    }
}