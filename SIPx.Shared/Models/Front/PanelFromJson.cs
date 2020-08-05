using System;
using System.Collections.Generic;
using System.Text;

namespace SIPx.Shared.Models.Front
{
    //PETER TESTING
    public class Panel
    {
        public string content { get; set; }
        public int maxSizeX { get; set; }
        public int maxSizeY { get; set; }
        public int minSizeX { get; set; }
        public int minSizeY { get; set; }
        public int sizeX { get; set; }
        public int sizeY { get; set; }
        public int zIndex { get; set; }
        public string id { get; set; }
        public int row { get; set; }
        public int col { get; set; }
        public bool enabled { get; set; }
        public string cssClass { get; set; }
        public string header { get; set; }
    }

    public class Root
    {
        public List<Panel> panels { get; set; }
    }
}
