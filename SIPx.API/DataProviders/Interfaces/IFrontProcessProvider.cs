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
        Task<FrontProcessView> FrontProcessView(string UserId, int ProcessId);
        Task<List<FrontProcessViewGetField>> FrontProcessViewGetField(string UserId, int ProcessId);
        Task<List<int>> FrontProcessNewReturnFlows(int ProcessTemplateId);
        Task<List<FrontProcessNewReturnFlowPass>> FrontProcessNewReturnFlowPasses( int ProcessTemplateFlowId);
        Task<List<int>> ReturnProcessTemplateFlowPass(string UserId, string SQLStatement);
        Task<bool> FrontProcessCreatePost(NewProcessWithMaster Process);
    }
}