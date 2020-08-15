using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class FrontIndexGetDashboard 
    {
        [Key]
        public int PageId { get; set; }
        public bool ShowTitleName { get; set; }
        public bool ShowTitleDescription { get; set; }
        public string TitleName { get; set; }
        public string TitleDescription { get; set; }

        public List<FrontIndexGetPanels> Panels { get; set; }
    }
}
