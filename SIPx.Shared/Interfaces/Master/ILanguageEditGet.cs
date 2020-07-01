using System;
using System.Collections.Generic;

namespace SIPx.Shared
{
    public interface ILanguageEditGet
    {
        string ForeignName { get; set; }
        string ISO6391 { get; set; }
        string ISO6392 { get; set; }
        int LanguageId { get; set; }
        DateTime ModifiedDate { get; set; }
        string Modifier { get; set; }
        string Name { get; set; }
        List<StatusList> Statuses { get; set; }
        int StatusId { get; set; }
    }
}