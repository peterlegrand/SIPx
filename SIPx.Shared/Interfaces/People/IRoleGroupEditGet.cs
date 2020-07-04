using System;
using System.Collections.Generic;

namespace SIPx.Shared
{
    public interface IRoleGroupEditGet
    {
        DateTime CreatedDate { get; set; }
        string Creator { get; set; }
        string Description { get; set; }
        string MenuName { get; set; }
        DateTime ModifiedDate { get; set; }
        string Modifier { get; set; }
        string MouseOver { get; set; }
        string Name { get; set; }
        int RoleGroupId { get; set; }
        int RoleGroupLanguageId { get; set; }
        int Sequence { get; set; }
        List<int> Sequences { get; set; }
    }
}