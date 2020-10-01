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
        Task<List<FrontProcessNewProcessField>> CreateGet(string UserId, int ProcessTemplateId);
        Task<List<FrontProcessTemplateIdFlowId>> CreateGetInitialTemplateFlowList();
        Task<List<NewProcessTemplateList>> CreateGetTemplateList(string SQLString);
        Task<bool> CreatePost(string SQLString, string UserId, int TemplateId, int StageId, DataTable Fields);
        Task<List<ToDoIndexGet>> ToDoIndexGet(string SQLString);
        Task<List<ProcessSearch>> Search(string Contains, string UserId);
        Task<List<ProcessAdvancedSearchResult>> AdvancedSearch(string UserId, ProcessAdvancedSearchPost AdvancedSearch);
        Task<List<FrontProcessProcessTemplateFlowConditions>> CreateGetInitialTemplateFlowConditionList(int ProcessTemplateFlowId);
    }
}