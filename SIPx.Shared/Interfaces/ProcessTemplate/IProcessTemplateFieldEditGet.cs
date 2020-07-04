using System;
using System.Collections.Generic;

namespace SIPx.Shared
{
    public interface IProcessTemplateFieldEditGet
    {
        DateTime CreatedDate { get; set; }
        string Creator { get; set; }
        string Description { get; set; }
        string MenuName { get; set; }
        DateTime ModifiedDate { get; set; }
        string Modifier { get; set; }
        string MouseOver { get; set; }
        string Name { get; set; }
        int ProcessTemplateFieldId { get; set; }
        int ProcessTemplateFieldLanguageId { get; set; }
        int ProcessTemplateFieldTypeId { get; set; }
        List<ProcessTemplateFieldTypeList> ProcessTemplateFieldTypes { get; set; }
    }
}