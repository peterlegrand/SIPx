using System;
using System.Collections.Generic;

namespace SIPx.Shared
{
    public interface IContentTypeGroupEditGet
    {
        int ContentTypeGroupId { get; set; }
        int ContentTypeGroupLanguageId { get; set; }
        DateTime CreatedDate { get; set; }
        string Creator { get; set; }
        string Description { get; set; }
        string MenuName { get; set; }
        DateTime ModifiedDate { get; set; }
        string Modifier { get; set; }
        string MouseOver { get; set; }
        string Name { get; set; }
        int Sequence { get; set; }
        List<int> Sequences { get; set; }
    }
}