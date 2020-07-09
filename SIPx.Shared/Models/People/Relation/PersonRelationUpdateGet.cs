﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class PersonRelationUpdateGet 
    {
        [Key]
        public int PersonRelationId { get; set; }
        public string FromPersonFirstName { get; set; }
        public string FromPersonLastName { get; set; }
        public string FromOrganizationName { get; set; }
        public int ToPersonId { get; set; }
        public DateTime ValidFrom { get; set; }
        public DateTime? ValidTill { get; set; }
        public string PersonRelationTypeId { get; set; }
        public string Creator { get; set; }
        public DateTime CreatedDate { get; set; }
        public string Modifier { get; set; }
        public DateTime ModifiedDate { get; set; }

        public List<PersonRelationTypeList> PersonRelationTypes { get; set; }
        public List<PersonList> Persons { get; set; }
    }
}