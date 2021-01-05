using SIPx.Shared;
using System.Collections.Generic;
using System.Data;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IProcessProvider
    {
        Task<List<ProcessAdvancedSearchResult>> AdvancedSearch(string UserId, ProcessAdvancedSearchPost AdvancedSearch);
        Task<List<FrontProcessNewProcessField>> CreateGet(string UserId, int ProcessTemplateId);
        Task<List<FrontProcessProcessTemplateFlowConditions>> CreateGetInitialTemplateFlowConditionList(int ProcessTemplateFlowId);
        Task<List<FrontProcessTemplateIdFlowId>> CreateGetInitialTemplateFlowList();
        Task<bool> CreatePost(string SQLString, string UserId, int TemplateId, int StageId, DataTable Fields);
        Task<ProcessDeleteGet> DeleteGet(string UserId, int ProcessId);
        bool DeletePost(string UserId, int ProcessId);
        Task<List<ErrorMessage>> DeletePostCheck(string UserId, int ProcessId);
        Task<List<ProcessForPanel>> Panel(string UserId, string ProcessConditionSQLFrom, string ProcessConditionSQLWhere, string ProcessConditionSQLContains);
        Task<List<ProcessForPanelCondition>> PanelCondition(int PageSectionId);
        Task<List<ProcessSearch>> Search(string Contains, string UserId);
        Task<List<ToDoIndexGet>> ToDoIndexGet(string SQLString);
    }
}