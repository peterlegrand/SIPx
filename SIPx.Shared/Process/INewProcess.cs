using System.Collections.Generic;

namespace SIPx.Shared
{
    public interface INewProcess
    {
        int ProcessTemplateStageID { get; set; }
        int ProcessTemplateID { get; set; }
        List<NewProcessField> ProcessFields { get; set; }
    }
}