using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace SIPx.API.ViewModels
{
    public class ContentType
    {
        [Key]
        public int ContentTypeId { get; set; }
        public int Sequence { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string MenuName { get; set; }
        public string MouseOver { get; set; }
        public string GroupName { get; set; }
        public string GroupDescription { get; set; }
        public string GroupMenuName { get; set; }
        public string GroupMouseOver { get; set; }
        public string SecurityLevelName { get; set; }
        public string ProcessTemplateName { get; set; }
        public string Creator { get; set; }
        public DateTime CreatedDate { get; set; }
        public string Modifier { get; set; }
        public DateTime ModifiedDate { get; set; }
    }
}
