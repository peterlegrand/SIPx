﻿using SIPx.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public interface IClassificationProvider
    {
        Task<ClassificationViewGet> GetClassificationById(int Id, int LanguageId);
        Task<List<ClassificationViewGet>> GetClassifications(string UserID);
        List<ClassificationViewGet> GetClassifications2(int LanguageId);
        bool PostClassification(ClassificationCreatePost Classification);
        bool PutClassification(ClassificationUpdatePut Classification);
    }
}