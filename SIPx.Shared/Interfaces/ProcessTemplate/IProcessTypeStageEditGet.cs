using System;

namespace SIPx.Shared
{
    public interface IProcessTypeStageEditGet
    {
        DateTime CreatedDate { get; set; }
        string Creator { get; set; }
        string Description { get; set; }
        bool IsEndStage { get; set; }
        string MenuName { get; set; }
        DateTime ModifiedDate { get; set; }
        string Modifier { get; set; }
        string MouseOver { get; set; }
        string Name { get; set; }
        int ProcessTypeId { get; set; }
        int ProcessTypeStageId { get; set; }
        int ProcessTypeStageLanguageId { get; set; }
    }
}