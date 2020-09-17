using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace SIPx.Shared
{
    public class SearchGlobalPostPage
    {
        public int PageId { get; set; }
        public bool ShowtitleName { get; set; }
        public bool ShowtitleDescription { get; set; }
        public string titleName { get; set; }
        public string titleDescription { get; set; }
        public List<SearchGlobalPostPageSection> PageSections { get; set; }
    }
}

