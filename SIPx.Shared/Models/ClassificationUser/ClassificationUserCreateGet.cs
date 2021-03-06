﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ClassificationUserCreateGet
    {
        [Key]
        public string UserOfClassificationId { get; set; }
        public int ClassificationId { get; set; }
        public string ClassificationName { get; set; }
        public int ClassificationRelationTypeId { get; set; }
        public string UserId { get; set; }
        public List<UserList> Users { get; set; }
        public List<ClassificationRelationTypeList> ClassificationRelationTypes { get; set; }
    }
}
