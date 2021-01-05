using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IProcessTemplateFlowPassProvider
    {
        Task<List<ProcessTemplateFieldList>> CreateGetFieldList(string UserId, int ProcessTemplateFlowId);
        Task<List<ProcessTemplateFieldList>> CreateGetFieldRoleList(string UserId, int ProcessTemplateFlowId);
        Task<List<SequenceList>> CreateGetSequence(string UserId, int ProcessTemplateFlowId);
        Task<string> CreatePost(ProcessTemplateFlowPassCreateGet ProcessTemplateFlowPass);
        Task<List<ErrorMessage>> CreatePostCheck(ProcessTemplateFlowPassCreateGet ProcessTemplateFlowPass);
        Task<ProcessTemplateFlowPassDeleteGet> DeleteGet(string UserId, int ProcessTemplateFlowPassId);
        bool DeletePost(string UserId, int ProcessTemplateFlowPassId);
        Task<List<ErrorMessage>> DeletePostCheck(string UserId, int ProcessTemplateFlowPassId);
        Task<List<ProcessTemplateFlowPassIndexGet>> IndexGet(string UserId, int ProcessTemplateFlowId);
        Task<int> IndexGetProcessTemplateId(int ProcessTemplateFlowPassId);
        Task<List<ProcessTemplateFlowPassLanguageIndexGet>> LanguageIndexGet(string UserId, int ProcessTemplateFlowPassId);
        Task<ProcessTemplateFlowPassLanguageIndexGet> LanguageUpdateGet(string UserId, int ProcessTemplateFlowPassLanguageId);
        Task<ProcessTemplateFlowPassUpdateGet> UpdateGet(string UserId, int ProcessTemplateFlowPassId);
        Task<List<ProcessTemplateFieldList>> UpdateGetFieldList(string UserId, int ProcessTemplateFlowPassId);
        Task<List<ProcessTemplateFieldList>> UpdateGetFieldRoleList(string UserId, int ProcessTemplateFlowPassId);
        Task<List<SequenceList>> UpdateGetSequence(string UserId, int ProcessTemplateFlowPassId);
        bool UpdatePost(ProcessTemplateFlowPassUpdateGet ProcessTemplateFlowPass);
        Task<List<ErrorMessage>> UpdatePostCheck(ProcessTemplateFlowPassUpdateGet ProcessTemplateFlowPass);
    }
}