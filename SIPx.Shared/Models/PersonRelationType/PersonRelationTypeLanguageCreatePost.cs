using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class PersonRelationTypeLanguageCreatePost : ObjectLanguageCreatePost, IPersonRelationTypeLanguageCreatePost
    {
        public string FromIsAnXOfTo { get; set; }
        public string ToIsAnXOfFrom { get; set; }
    }
}
