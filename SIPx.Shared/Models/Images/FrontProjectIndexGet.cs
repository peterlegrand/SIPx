using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;
using System.Runtime.Serialization;
using Microsoft.AspNetCore.Http;

namespace SIPx.Shared
{
    [DataContract]
    public class FileUploadModel
    {
//        [DataMember(Name = "fileName")]
        public string FileName { get; set; }

  //      [DataMember(Name = "fileBytes")]
        public IFormFile Image  { get; set; }
    }
    //public class FileNameTest
    //{
    //    [DataMember(Name = "fileName")]
    //    public string FileName { get; set; }
    //}

    [DataContract]
    public class FileUpload
    {
        [DataMember(Name = "fileName")]
        public string FileName { get; set; }

        [DataMember(Name = "fileBytes")]
        public byte[] FileBytes { get; set; }
    }

    public class APIFile
    {
        public IFormFile MyFile { get; set; }
    }
}
