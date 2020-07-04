using System;
using System.Collections.Generic;

namespace SIPx.Shared
{
    public interface IProcessTemplateFlowEditGet
    {
        DateTime CreatedDate { get; set; }
        string Creator { get; set; }
        string Description { get; set; }
        string MenuName { get; set; }
        DateTime ModifiedDate { get; set; }
        string Modifier { get; set; }
        string MouseOver { get; set; }
        string Name { get; set; }
        List<ProcessTemplateFieldList> ProcessTemplateFields { get; set; }
        int ProcessTemplateFlowId { get; set; }
        int ProcessTemplateFlowLanguageId { get; set; }
        int ProcessTemplateFromFieldId { get; set; }
        int ProcessTemplateId { get; set; }
        int ProcessTemplateToFieldId { get; set; }
    }
}