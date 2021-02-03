using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface ICodeTypeProvider
    {
        Task<List<CodeTypeList>> List(string UserId);
    }
}