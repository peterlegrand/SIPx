﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class ProjectMatrixTypeCreateGetWithErrorMessages
    {
        [Key]
        public ProjectMatrixTypeCreateGet ProjectMatrixType { get; set; }
        public List<ErrorMessage> ErrorMessages { get; set; }
    }
}
