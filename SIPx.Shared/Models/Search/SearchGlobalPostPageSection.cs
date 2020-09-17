using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace SIPx.Shared
{
    public class SearchGlobalPostPageSection
    {
        public int PageSectionId { get; set; }
        public int PageId { get; set; }
        public int PageSectionTypeId { get; set; }
        public int PageSectionDataTypeId { get; set; }
        public bool ShowSectiontitleName { get; set; }
        public bool ShowSectiontitleDescription { get; set; }
        public bool ShowContentTypetitleName { get; set; }
        public bool ShowContentTypetitleDescription { get; set; }
        public int SizeX { get; set; }
        public int SizeY { get; set; }
        public int DashboardRow { get; set; }
        public int DashboardColumn { get; set; }
        public string titleName { get; set; }
        public string titleDescription { get; set; }
        public string PanelId { get; set; }
        public string SubPanelId { get; set; }
    }
}

