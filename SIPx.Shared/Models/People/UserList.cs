﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class UserList
    {
        [Key]
        public string UserId { get; set; }
        public string Name { get; set; }

    }
}
