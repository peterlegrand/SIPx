using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ProjectTypeMatrixFromCreateGet 
    { 
        public string Name { get; set; }
        public string Description { get; set; }
        public string MenuName { get; set; }
        public string MouseOver { get; set; }
        public int FromProjectTypeId { get; set; }
        public string FromProjectTypeName { get; set; }
        public int ToProjectTypeId { get; set; }
        public string ToProjectTypeName { get; set; }
        public int ProjectMatrixTypeId { get; set; }
        public bool IsFrom { get; set; }
        public string UserId { get; set; }
        public List<ProjectTypeList> ProjectTypes { get; set; }
        public List<ProjectMatrixTypeList> ProjectMatrixTypes { get; set; }
    }
}
