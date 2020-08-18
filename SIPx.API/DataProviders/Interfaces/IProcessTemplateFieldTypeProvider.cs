using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IProcessTemplateFieldTypeProvider
    {
        Task<List<ProcessTemplateFieldTypeList>> List(string UserId);
    }
}