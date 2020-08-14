using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IFrontProcessProvider
    {
        Task<List<NewProcessShowTemplate>> NewProcessShowTemplate(string UserId);
        Task<List<NewProcessShowTemplateGroup>> NewProcessShowTemplateGroup(string UserId);
    }
}