using SIPx.Shared;
using System.Collections.Generic;
using System.Data;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IProcessProvider
    {
        Task<ProcessDeleteGet> DeleteGet(string UserId, int ProcessId);
        bool DeletePost(int Id);
        Task<List<NewProcessFromDB>> CreateGet(string UserId, int ProcessTemplateId);
        Task<List<ProcessTemplateFlowConditionOld>> CreateGetFlowConditionList(int FlowId);
        Task<List<int>> CreateGetInitialTemplateList();
        Task<List<NewProcessTemplateList>> CreateGetTemplateList(string SQLString);
        Task<bool> CreatePost(string SQLString, string UserId, int TemplateId, int StageId, DataTable Fields);
        Task<List<ToDoIndexGet>> ToDoIndexGet(string SQLString);
    }
}