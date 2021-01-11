using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class MVCFavoriteGroupCreateGet
    {
        [Key]
        public int Sequence { get; set; }
        public string LanguageName { get; set; }
        public string Name { get; set; }
        public string UserId { get; set; }
        public List<SequenceList> Sequences { get; set; }
    }
}
