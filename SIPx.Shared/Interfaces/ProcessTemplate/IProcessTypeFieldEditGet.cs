using System;
using System.Collections.Generic;

namespace SIPx.Shared
{
    public interface IProcessTypeFieldEditGet
    {
        DateTime CreatedDate { get; set; }
        string Creator { get; set; }
        string Description { get; set; }
        string MenuName { get; set; }
        DateTime ModifiedDate { get; set; }
        string Modifier { get; set; }
        string MouseOver { get; set; }
        string Name { get; set; }
        int ProcessTypeFieldId { get; set; }
        int ProcessTypeFieldLanguageId { get; set; }
        int ProcessTypeFieldTypeId { get; set; }
        List<ProcessTypeFieldTypeList> ProcessTypeFieldTypes { get; set; }
    }
}