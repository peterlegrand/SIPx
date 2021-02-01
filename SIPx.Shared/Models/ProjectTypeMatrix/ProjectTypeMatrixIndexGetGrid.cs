using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ProjectTypeMatrixIndexGetGrid
    {
        [Key]
        public int ProjectTypeMatrixId { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string MenuName { get; set; }
        public string MouseOver { get; set; }
        //public int FromProjectTypeId { get; set; }
        //public int ToProjectTypeId { get; set; }
        public string Direction { get; set; }
        public int ProjectTypeId { get; set; }
        public string ProjectTypeName { get; set; }
        public int ToProjectTypeName { get; set; }
        public int ProjectMatrixTypeId { get; set; }
        public string ProjectMatrixTypeName { get; set; }
        public string CreatorName { get; set; }
        public int CreatorId { get; set; }
        public DateTime CreatedDate { get; set; }
    }
}
