using System;
using System.Collections.Generic;

namespace SIPx.Shared
{
    public interface IProcessTypeFlowEditGet
    {
        DateTime CreatedDate { get; set; }
        string Creator { get; set; }
        string Description { get; set; }
        string MenuName { get; set; }
        DateTime ModifiedDate { get; set; }
        string Modifier { get; set; }
        string MouseOver { get; set; }
        string Name { get; set; }
        List<ProcessTypeFieldList> ProcessTypeFields { get; set; }
        int ProcessTypeFlowId { get; set; }
        int ProcessTypeFlowLanguageId { get; set; }
        int ProcessTypeFromFieldId { get; set; }
        int ProcessTypeId { get; set; }
        int ProcessTypeToFieldId { get; set; }
    }
}