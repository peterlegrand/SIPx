using System;
using System.Collections.Generic;

namespace SIPx.Shared
{
    public interface IGenderEditGet
    {
        bool Active { get; set; }
        string Description { get; set; }
        int GenderId { get; set; }
        string MenuName { get; set; }
        DateTime ModifiedDate { get; set; }
        string Modifier { get; set; }
        string MouseOver { get; set; }
        string Name { get; set; }
        List<int> Sequences { get; set; }
    }
}