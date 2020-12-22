
using Dapper;
using SIPx.Shared;
//using SIPx.Shared;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Threading.Tasks;

namespace SIPx.DataAccess
{
    public class ProcessTemplateProvider : IProcessTemplateProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public ProcessTemplateProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }

        public Task<List<SequenceList>> CreateGetSequence(string UserId)
        {
            string usp = "usp_ProcessTemplateCreateGetSequence @UserID";
            return _sqlDataAccess.LoadData<SequenceList, dynamic>(usp, new { UserId });
        }

        public async Task<List<ErrorMessage>> CreatePostCheck(ProcessTemplateCreateGet ProcessTemplate)
        {
            string usp = "usp_ProcessTemplateCreatePostCheck @ProcessTemplateGroupId, @Sequence, @LanguageId, @Name, @CreatorId";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, ProcessTemplate);
            return ErrorMessages;
        }

        public async Task<string> CreatePost(ProcessTemplateCreateGet ProcessTemplate)
        {
            string usp = "usp_ProcessTemplateCreatePost" +
                " @ProcessTemplateGroupId" +
                ", @ShowInOrganizationCalendar " +
                ", @ShowInProjectCalendar " +
                ", @ShowInPersonalCalendar" +
                ", @ShowInEventCalendar" +
                ", @ProcessMultiMax" +
                ", @Sequence" +
                ", @IsPersonal" +
                ", @ShowInNew" +
                ", @ShowInSearch" +
                ", @ShowInReports" +
                ", @HideEverywhere" +
                ", @Name" +
                ", @Description" +
                ", @MenuName" +
                ", @MouseOver" +
                ", @Color" +
                ", @IconId" +
                ", @UserId";
            var String = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, ProcessTemplate);
            return String;
        }

        public Task<List<ProcessTemplateIndexGet>> IndexGet(string UserId)
        {
            string usp = "usp_ProcessTemplateIndexGet @UserID";
            return _sqlDataAccess.LoadData<ProcessTemplateIndexGet, dynamic>(usp, new { UserId = UserId });

        }
        
        public Task<ProcessTemplateUpdateGet> UpdateGet(string UserId, int ProcessTemplateId)
        {
            string usp = "usp_ProcessTemplateUpdateGet @UserId, @ProcessTemplateID";
            return _sqlDataAccess.LoadSingleRecord<ProcessTemplateUpdateGet, dynamic>(usp, new { UserId = UserId, ProcessTemplateId = ProcessTemplateId });

        }
        public async Task<List<ErrorMessage>> UpdatePostCheck(ProcessTemplateUpdateGet ProcessTemplate)
        {
            string usp = "usp_ProcessTemplateUpdatePostCheck @ProcessTemplateId, @ProcessTemplateGroupId, @ShowInPersonalCalendar, @ShowInOrganizationCalendar, @ShowInProjectCalendar, @ShowInEventCalendar, @ProcessMultiMax, @Sequence, @IsPersonal, @ShowInNew, @ShowInSearch, @ShowInReports, @HideEverywhere, @Color , @IconId , @Name, @Description, @MenuName, @MouseOver, @ModifierId";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, ProcessTemplate);
            return ErrorMessages;
        }
        public bool UpdatePost(ProcessTemplateUpdateGet ProcessTemplate)
        {
            string usp = "usp_ProcessTemplateUpdatePost @ProcessTemplateId, @ProcessTemplateGroupId, @ShowInPersonalCalendar, @ShowInOrganizationCalendar, @ShowInProjectCalendar, @ShowInEventCalendar, @ProcessMultiMax, @Sequence, @IsPersonal, @ShowInNew, @ShowInSearch, @ShowInReports, @HideEverywhere, @Color , @IconId , @Name, @Description, @MenuName, @MouseOver, @ModifierId";
            _sqlDataAccess.SaveData<ProcessTemplateUpdateGet>(usp, ProcessTemplate);
            return true;
        }

        public Task<ProcessTemplateDeleteGet> DeleteGet(string UserId, int ProcessTemplateId)
        {
            string usp = "usp_ProcessTemplateDeleteGet @UserId, @ProcessTemplateID";
            return _sqlDataAccess.LoadSingleRecord<ProcessTemplateDeleteGet, dynamic>(usp, new { UserId, ProcessTemplateId });

        }

        public bool DeletePost(int ProcessTemplateId)
        {
            string usp = "usp_ProcessTemplateDeletePost @ProcessTemplateId";
            _sqlDataAccess.SaveData<dynamic>(usp, new { ProcessTemplateId = ProcessTemplateId });
            return true;
        }

        public Task<List<ProcessTemplateLanguageIndexGet>> LanguageIndexGet(string UserId, int ProcessTemplateId)
        {
            string usp = "usp_ProcessTemplateLanguageIndexGet @UserId, @ProcessTemplateID";
            return _sqlDataAccess.LoadData<ProcessTemplateLanguageIndexGet, dynamic>(usp, new { UserId = UserId, ProcessTemplateId = ProcessTemplateId });

        }

        public Task<ProcessTemplateLanguageIndexGet> LanguageUpdateGet(string UserId, int ProcessTemplateLanguageId)
        {
            string usp = "usp_ProcessTemplateLanguageUpdateGet @UserId, @ProcessTemplateLanguageID";
            return _sqlDataAccess.LoadSingleRecord<ProcessTemplateLanguageIndexGet, dynamic>(usp, new { UserId = UserId, ProcessTemplateLanguageId = ProcessTemplateLanguageId });

        }

        public Task<List<ProcessTemplateList>> List(string UserId)
        {
            string usp = "usp_ProcessTemplateList @UserID";
            return _sqlDataAccess.LoadData<ProcessTemplateList, dynamic>(usp, new { UserId });
        }

    }
}
