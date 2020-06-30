using System.Collections.Generic;

namespace SIPx.Shared
{
    public interface INewProcessFromAPI
    {
        int ProcessTemplateStageId { get; set; }
        int ProcessTemplateId { get; set; }
        List<NewProcessFieldFromAPI> ProcessFields { get; set; }
    }
}