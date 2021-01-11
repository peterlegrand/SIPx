using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class MVCFavoriteGroupUpdateGet
    {
        [Key]
        public int ProcessTemplateGroupId { get; set; }
        public int Sequence { get; set; }
        public string Name { get; set; }
        public string CreatorName { get; set; }
        public int CreatorId { get; set; }
        public DateTime CreatedDate { get; set; }
        public string ModifierName { get; set; }
        public int ModifierId { get; set; }
        public DateTime ModifiedDate { get; set; }
        public string UserId { get; set; }

        public List<SequenceList>Sequences { get; set; }

    }
}
