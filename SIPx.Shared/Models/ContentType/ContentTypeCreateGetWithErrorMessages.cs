﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ContentTypeCreateGetWithErrorMessages
    {
        [Key]
        public ContentTypeCreateGet ContentType { get; set; }
        public List<ErrorMessage> ErrorMessages { get; set; }
    }
}
