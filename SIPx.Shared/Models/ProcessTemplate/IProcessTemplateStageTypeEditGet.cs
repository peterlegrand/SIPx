﻿using System;

namespace SIPx.Shared
{
    public interface IProcessTemplateStageTypeEditGet
    {
        DateTime CreatedDate { get; set; }
        string Creator { get; set; }
        string Description { get; set; }
        string MenuName { get; set; }
        DateTime ModifiedDate { get; set; }
        string Modifier { get; set; }
        string MouseOver { get; set; }
        string Name { get; set; }
        int ProcessTemplateStageTypeId { get; set; }
        int ProcessTemplateStageTypeLanguageId { get; set; }
    }
}