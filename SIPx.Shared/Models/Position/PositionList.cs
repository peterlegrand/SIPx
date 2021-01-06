using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class PositionList : IPositionList
    {
        [Key]
        public int PositionId { get; set; }
        public string Name { get; set; }

    }
}
