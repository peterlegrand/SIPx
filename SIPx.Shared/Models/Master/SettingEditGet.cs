using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class SettingEditGet : ISettingEditGet
    {
        [Key]
        public int SettingId { get; set; }
        public int IntValue { get; set; }
        public string StringValue { get; set; }
        public int DateTimeValue { get; set; }
        public Guid GuidValue { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string MenuName { get; set; }
        public string MouseOver { get; set; }
        public string Modifier { get; set; }
        public DateTime ModifiedDate { get; set; }

    }
}
