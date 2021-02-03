using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ProjectProjectType
    {
        public int? ParentProjectId { get; set; }
        public string ProjectTypeId { get; set; }
        public string ProjectTypeName { get; set; }
    }
}
