using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class SettingUpdateGet 
    {
        [Key]
        public int SettingId { get; set; }
        public int IntValue { get; set; }
        public string StringValue { get; set; }
        public DateTime DateTimeValue { get; set; }
        public Guid GuidValue { get; set; }
        public string SettingsName { get; set; }
        public string Description { get; set; }
        public string MenuName { get; set; }
        public string MouseOver { get; set; }
        public int TypeId { get; set; }
        public string ModifierName { get; set; }
        public string ModifierId { get; set; }
        public DateTime ModifiedDate { get; set; }
        public List<LanguageList> Languages { get; set; }

    }
}
