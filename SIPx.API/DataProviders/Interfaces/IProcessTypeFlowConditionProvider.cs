using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IProcessTypeFlowConditionProvider
    {
        Task<List<ProcessTypeFieldList>> CreateGetFieldList(string UserId, int ProcessTypeFlowId);
        Task<List<ProcessTypeFieldList>> CreateGetFieldRoleList(string UserId, int ProcessTypeFlowId);
        Task<List<SequenceList>> CreateGetSequence(string UserId, int ProcessTypeFlowId);
        Task<string> CreatePost(ProcessTypeFlowConditionCreateGet ProcessTypeFlowCondition);
        Task<List<ErrorMessage>> CreatePostCheck(ProcessTypeFlowConditionCreateGet ProcessTypeFlowCondition);
        Task<ProcessTypeFlowConditionDeleteGet> DeleteGet(string UserId, int ProcessTypeFlowConditionId);
        bool DeletePost(string UserId, int ProcessTypeFlowConditionId);
        Task<List<ErrorMessage>> DeletePostCheck(string UserId, int ProcessTypeFlowConditionId);
        Task<List<ProcessTypeFlowConditionIndexGet>> IndexGet(string UserId, int ProcessTypeFlowId);
        Task<List<ProcessTypeFlowConditionLanguageIndexGet>> LanguageIndexGet(string UserId, int ProcessTypeFlowConditionId);
        Task<ProcessTypeFlowConditionLanguageIndexGet> LanguageUpdateGet(string UserId, int ProcessTypeFlowConditionLanguageId);
        Task<ProcessTypeFlowConditionUpdateGet> UpdateGet(string UserId, int ProcessTypeFlowConditionId);
        Task<List<ProcessTypeFieldList>> UpdateGetFieldList(string UserId, int ProcessTypeFlowConditionId);
        Task<List<ProcessTypeFieldList>> UpdateGetFieldRoleList(string UserId, int ProcessTypeFlowConditionId);
        Task<List<SequenceList>> UpdateGetSequence(string UserId, int ProcessTypeFlowConditionId);
        bool UpdatePost(ProcessTypeFlowConditionUpdateGet ProcessTypeFlowCondition);
        Task<List<ErrorMessage>> UpdatePostCheck(ProcessTypeFlowConditionUpdateGet ProcessTypeFlowCondition);
    }
}