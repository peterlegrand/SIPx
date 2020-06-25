using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace SIPx.API.ViewModels
{
    public class Organization
    {
        [Key]
        public int OrganizationID { get; set; }
        public int OrganizationTypeID { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string MenuName { get; set; }
        public string MouseOver { get; set; }
        public string LanguageName { get; set; }
        public string OrganizationTypeName { get; set; }
        public string StatusName { get; set; }
        public string Path { get; set; }
        public bool Internal { get; set; }
        public string LegalEntity { get; set; }
        public string Creator { get; set; }
        public DateTime CreatedDate { get; set; }
        public string Modifier { get; set; }
        public DateTime ModifiedDate { get; set; }
    }
}
