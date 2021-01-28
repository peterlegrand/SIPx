using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ProjectTypeMatrixLanguageIndexGet
    {
        [Key]
        public int ProjectTypeMatrixLanguageId { get; set; }
        public int LanguageId { get; set; }
        public string LanguageName { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string MenuName { get; set; }
        public string MouseOver { get; set; }
        public int ProjectTypeMatrixId { get; set; }
        public int FromProjectTypeId { get; set; }
        public int ToProjectTypeId { get; set; }
        public string FromProjectTypeName { get; set; }
        public int ToProjectTypeName { get; set; }
        public int ProjectMatrixTypeId { get; set; }
        public string ProjectMatrixTypeName { get; set; }
        public string UserId { get; set; }
        public bool IsFrom { get; set; }
    }
}
