using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ProjectMatrixTypeList
    {
        [Key]
        public int ProjectMatrixTypeId { get; set; }
        public string Name { get; set; }

    }
}
