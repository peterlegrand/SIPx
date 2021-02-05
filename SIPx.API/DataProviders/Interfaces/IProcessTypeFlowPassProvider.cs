using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IProcessTypeFlowPassProvider
    {
        Task<List<ProcessTypeFieldList>> CreateGetFieldList(string UserId, int ProcessTypeFlowId);
        Task<List<ProcessTypeFieldList>> CreateGetFieldRoleList(string UserId, int ProcessTypeFlowId);
        Task<List<SequenceList>> CreateGetSequence(string UserId, int ProcessTypeFlowId);
        Task<string> CreatePost(ProcessTypeFlowPassCreateGet ProcessTypeFlowPass);
        Task<List<ErrorMessage>> CreatePostCheck(ProcessTypeFlowPassCreateGet ProcessTypeFlowPass);
        Task<ProcessTypeFlowPassDeleteGet> DeleteGet(string UserId, int ProcessTypeFlowPassId);
        bool DeletePost(string UserId, int ProcessTypeFlowPassId);
        Task<List<ErrorMessage>> DeletePostCheck(string UserId, int ProcessTypeFlowPassId);
        Task<List<ProcessTypeFlowPassIndexGet>> IndexGet(string UserId, int ProcessTypeFlowId);
        Task<int> IndexGetProcessTypeId(int ProcessTypeFlowPassId);
        Task<List<ProcessTypeFlowPassLanguageIndexGet>> LanguageIndexGet(string UserId, int ProcessTypeFlowPassId);
        Task<ProcessTypeFlowPassLanguageIndexGet> LanguageUpdateGet(string UserId, int ProcessTypeFlowPassLanguageId);
        Task<ProcessTypeFlowPassUpdateGet> UpdateGet(string UserId, int ProcessTypeFlowPassId);
        Task<List<ProcessTypeFieldList>> UpdateGetFieldList(string UserId, int ProcessTypeFlowPassId);
        Task<List<ProcessTypeFieldList>> UpdateGetFieldRoleList(string UserId, int ProcessTypeFlowPassId);
        Task<List<SequenceList>> UpdateGetSequence(string UserId, int ProcessTypeFlowPassId);
        bool UpdatePost(ProcessTypeFlowPassUpdateGet ProcessTypeFlowPass);
        Task<List<ErrorMessage>> UpdatePostCheck(ProcessTypeFlowPassUpdateGet ProcessTypeFlowPass);
    }
}