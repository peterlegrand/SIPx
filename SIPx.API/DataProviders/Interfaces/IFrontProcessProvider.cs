using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IFrontProcessProvider
    {
        Task<List<NewProcessShowTemplate>> NewProcessShowTemplate(string UserId);
        Task<List<NewProcessShowTemplateGroup>> NewProcessShowTemplateGroup(string UserId);
        Task<FrontProcessEditGet> FrontProcessEditGet(string UserId, int ProcessId);
        Task<bool> FrontProcessEditPost(FrontProcessEditGet Process, string UserId);
    }
}