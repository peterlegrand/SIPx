﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace SIPx.Shared
{
    public class MVCFavoriteDeleteGet
    {
        [Key]
        public int MVCFavoriteId { get; set; }
        public int MVCFavoriteGroupId { get; set; }
        public string MVCFavoriteGroupName { get; set; }
        public string Name { get; set; }
        public int Sequence { get; set; }
        public string Controller { get; set; }
        public string Action { get; set; }
        public string RouteId { get; set; }
        public int CreatorId { get; set; }
        public string CreatorName { get; set; }
        public DateTime CreatedDate { get; set; }
        public string ModifierName { get; set; }
        public int ModifierId { get; set; }
        public DateTime ModifiedDate { get; set; }
        public string UserId { get; set; }
    }
}
