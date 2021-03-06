﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class FrontPersonDashboardTelecom
    {
        [Key]
        public int PersonTelecomID { get; set; }
        public string TelecomValue { get; set; }
        public string TelecomTypeName { get; set; }
        public string CountryCode { get; set; }
        public string AreaCode { get; set; }
        public string ExtensionCode { get; set; }
        public string AskForName { get; set; }

        public int CreatorId { get; set; }
        public string CreatorName { get; set; }
        public DateTime CreatedDate { get; set; }
        public int ModifierId { get; set; }
        public string ModifierName { get; set; }
        public DateTime ModifiedDate { get; set; }

    }
}
