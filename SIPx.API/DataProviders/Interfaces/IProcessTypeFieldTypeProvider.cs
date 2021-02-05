using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IProcessTypeFieldTypeProvider
    {
        Task<List<ProcessTypeFieldTypeList>> List(string UserId);
    }
}