using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IFrontProcessProvider
    {
        Task<List<NewProcessTemplateList>> NewProcessShowTemplate(string UserId);
        Task<List<NewProcessShowTemplateGroup>> NewProcessShowTemplateGroup(string UserId);
        Task<FrontProcessEditGet> FrontProcessEditGet(string UserId, int ProcessId);
        Task<bool> FrontProcessEditPost(FrontProcessUpdateGet Process, string UserId);
        Task<FrontProcessView> FrontProcessView(string UserId, int ProcessId);
        Task<List<FrontProcessViewGetField>> FrontProcessViewGetField(string UserId, int ProcessId);
        Task<List<int>> FrontProcessNewReturnFlows(int ProcessTemplateId);
        Task<List<FrontProcessNewReturnFlowPass>> FrontProcessNewReturnFlowPasses( int ProcessTemplateFlowId);
        Task<List<int>> ReturnProcessTemplateFlowPass(string UserId, string SQLStatement);
        Task<bool> FrontProcessCreatePost(FrontProcessNewProcessWithMaster Process);
        Task<List<int>> FrontProcessToDoFlows();
        Task<List<FrontProcessToDoFlowCondition>> FrontProcessToDoConditions(int ProcessTemplateFlowId);
        Task<List<FrontProcessToDoProcess>> FrontProcessToDoProcesses(int ProcessTemplateFlowId);
        Task<List<FrontProcessToDoProcessField>> FrontProcessToDoProcessFields(int ProcessId);
        Task<List<ToDoIndexGet>> FrontProcessToDo(string SQLStatement);
        Task<FrontProcessUpdateGet> FrontProcessUpdateGet(string UserId, int ProcessId);
        Task<List<FrontProcessUpdateGetField>> FrontProcessUpdateGetFields(string UserId, int ProcessId);
        Task<List<int>> FrontProcessUpdateReturnFlows(int ProcessTemplateStageId);
        Task<List<NewProcessTemplateList>> CreateGetTemplateList(string SQLString);
    }
}