using System.Collections.Generic;

namespace SIPx.Shared
{
    public interface INewProcessFromAPI
    {
        int ProcessTemplateStageID { get; set; }
        int ProcessTemplateID { get; set; }
        List<NewProcessFieldFromAPI> ProcessFields { get; set; }
    }
}