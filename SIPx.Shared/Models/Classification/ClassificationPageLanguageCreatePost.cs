using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ClassificationPageLanguageCreatePost : ObjectLanguageCreatePost, IClassificationPageLanguageCreatePost
    {
        public string TitleName { get; set; }
        public string TitleDescription { get; set; }
    }
}
