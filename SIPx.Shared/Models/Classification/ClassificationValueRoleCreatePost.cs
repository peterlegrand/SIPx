﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ClassificationValueRoleCreatePost : IClassificationValueRoleCreatePost
    {
        [Key]
        public string @RoleID { get; set; }
        public int @ClassificationValueID { get; set; }
        public int @ClassificationID { get; set; }
        public int @ClassificationRelationTypeID { get; set; }
        public string UserId { get; set; }
    }
}
