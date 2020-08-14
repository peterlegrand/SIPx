using SIPx.Shared;
using System.Collections.Generic;
using System.Data;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IProcessProvider
    {
        Task<List<NewProcessFromDB>> NewProcessGet(string UserId, int ProcessTemplateId);
        Task<List<ProcessTemplateFlowConditionOld>> NewProcessGetFlowConditionList(int FlowId);
        Task<List<int>> NewProcessGetInitialTemplateList();
        Task<List<NewProcessTemplateList>> NewProcessGetTemplateList(string SQLString);
        Task<bool> NewProcessInsert(string SQLString, string UserId, int TemplateId, int StageId, DataTable Fields);
        Task<List<ToDoIndexGet>> ToDoIndexGet(string SQLString);
    }
}