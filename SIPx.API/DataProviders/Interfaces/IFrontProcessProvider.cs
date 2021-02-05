using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IFrontProcessProvider
    {
        Task<List<NewProcessTypeList>> NewProcessShowTemplate(string UserId);
        Task<List<NewProcessShowTemplateGroup>> NewProcessShowTemplateGroup(string UserId);
        Task<FrontProcessEditGet> FrontProcessEditGet(string UserId, int ProcessId);
        Task<bool> FrontProcessEditPost(FrontProcessUpdateGet Process, string UserId);
        Task<FrontProcessView> FrontProcessView(string UserId, int ProcessId);
        Task<List<FrontProcessViewGetField>> FrontProcessViewGetField(string UserId, int ProcessId);
        Task<List<int>> FrontProcessNewReturnFlows(int ProcessTypeId);
        Task<List<FrontProcessNewReturnFlowPass>> FrontProcessNewReturnFlowPasses( int ProcessTypeFlowId);
        Task<List<int>> ReturnProcessTypeFlowPass(string UserId, string SQLStatement);
        Task<bool> FrontProcessCreatePost(FrontProcessNewProcessWithMaster Process);
        Task<List<int>> FrontProcessToDoFlows();
        Task<List<FrontProcessToDoFlowCondition>> FrontProcessToDoConditions(int ProcessTypeFlowId);
        Task<List<FrontProcessToDoProcess>> FrontProcessToDoProcesses(int ProcessTypeFlowId);
        Task<List<FrontProcessToDoProcessField>> FrontProcessToDoProcessFields(int ProcessId);
        Task<List<ToDoIndexGet>> FrontProcessToDo(string SQLStatement);
        Task<FrontProcessUpdateGet> FrontProcessUpdateGet(string UserId, int ProcessId);
        Task<List<FrontProcessUpdateGetField>> FrontProcessUpdateGetFields(string UserId, int ProcessId);
        Task<List<int>> FrontProcessUpdateReturnFlows(int ProcessTypeStageId);
        Task<List<NewProcessTypeList>> CreateGetTemplateList(string SQLString);
    }
}