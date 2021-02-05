using System.Collections.Generic;

namespace SIPx.Shared
{
    public interface INewProcessFromAPI
    {
        int ProcessTypeStageId { get; set; }
        int ProcessTypeId { get; set; }
        List<NewProcessFieldFromAPI> ProcessFields { get; set; }
    }
}