using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IProcessTemplateFlowConditionProvider
    {
        Task<List<ProcessTemplateFieldList>> CreateGetFieldList(string UserId, int ProcessTemplateFlowId);
        Task<List<ProcessTemplateFieldList>> CreateGetFieldRoleList(string UserId, int ProcessTemplateFlowId);
        Task<List<SequenceList>> CreateGetSequence(string UserId, int ProcessTemplateFlowId);
        Task<string> CreatePost(ProcessTemplateFlowConditionCreateGet ProcessTemplateFlowCondition);
        Task<List<ErrorMessage>> CreatePostCheck(ProcessTemplateFlowConditionCreateGet ProcessTemplateFlowCondition);
        Task<ProcessTemplateFlowConditionDeleteGet> DeleteGet(string UserId, int ProcessTemplateFlowConditionId);
        bool DeletePost(string UserId, int ProcessTemplateFlowConditionId);
        Task<List<ErrorMessage>> DeletePostCheck(string UserId, int ProcessTemplateFlowConditionId);
        Task<List<ProcessTemplateFlowConditionIndexGet>> IndexGet(string UserId, int ProcessTemplateFlowId);
        Task<List<ProcessTemplateFlowConditionLanguageIndexGet>> LanguageIndexGet(string UserId, int ProcessTemplateFlowConditionId);
        Task<ProcessTemplateFlowConditionLanguageIndexGet> LanguageUpdateGet(string UserId, int ProcessTemplateFlowConditionLanguageId);
        Task<ProcessTemplateFlowConditionUpdateGet> UpdateGet(string UserId, int ProcessTemplateFlowConditionId);
        Task<List<ProcessTemplateFieldList>> UpdateGetFieldList(string UserId, int ProcessTemplateFlowConditionId);
        Task<List<ProcessTemplateFieldList>> UpdateGetFieldRoleList(string UserId, int ProcessTemplateFlowConditionId);
        Task<List<SequenceList>> UpdateGetSequence(string UserId, int ProcessTemplateFlowConditionId);
        bool UpdatePost(ProcessTemplateFlowConditionUpdateGet ProcessTemplateFlowCondition);
        Task<List<ErrorMessage>> UpdatePostCheck(ProcessTemplateFlowConditionUpdateGet ProcessTemplateFlowCondition);
    }
}