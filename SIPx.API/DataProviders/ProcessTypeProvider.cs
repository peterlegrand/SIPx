
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
    public class ProcessTypeProvider : IProcessTypeProvider
    {
        private readonly ISqlDataAccess _sqlDataAccess;

        public ProcessTypeProvider(ISqlDataAccess sqlDataAccess)
        {
            _sqlDataAccess = sqlDataAccess;
        }

        public Task<List<SequenceList>> CreateGetSequence(string UserId)
        {
            string usp = "usp_ProcessTypeCreateGetSequence @UserID";
            return _sqlDataAccess.LoadData<SequenceList, dynamic>(usp, new { UserId });
        }

        public async Task<List<ErrorMessage>> CreatePostCheck(ProcessTypeCreateGet ProcessType)
        {
            string usp = "usp_ProcessTypeCreatePostCheck" +
                " @ProcessTypeGroupId , @CodePrefix , @CodeSuffix , @CodeTypeId " +
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
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, ProcessType);
            return ErrorMessages;
        }

        public async Task<string> CreatePost(ProcessTypeCreateGet ProcessType)
        {
            string usp = "usp_ProcessTypeCreatePost" +
                " @ProcessTypeGroupId , @CodePrefix , @CodeSuffix , @CodeTypeId " +
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
            var String = await _sqlDataAccess.LoadSingleRecord<string, dynamic>(usp, ProcessType);
            return String;
        }

        public Task<List<ProcessTypeIndexGet>> IndexGet(string UserId)
        {
            string usp = "usp_ProcessTypeIndexGet @UserID";
            return _sqlDataAccess.LoadData<ProcessTypeIndexGet, dynamic>(usp, new { UserId = UserId });

        }

        public Task<ProcessTypeUpdateGet> UpdateGet(string UserId, int ProcessTypeId)
        {
            string usp = "usp_ProcessTypeUpdateGet @UserId, @ProcessTypeID";
            return _sqlDataAccess.LoadSingleRecord<ProcessTypeUpdateGet, dynamic>(usp, new { UserId = UserId, ProcessTypeId = ProcessTypeId });

        }
        public async Task<List<ErrorMessage>> UpdatePostCheck(ProcessTypeUpdateGet ProcessType)
        {
            string usp = "usp_ProcessTypeUpdatePostCheck @ProcessTypeId , @CodePrefix , @CodeSuffix , @CodeTypeId , @ProcessTypeGroupId, @ShowInPersonalCalendar, @ShowInOrganizationCalendar, @ShowInProjectCalendar, @ShowInEventCalendar, @ProcessMultiMax, @Sequence, @IsPersonal, @ShowInNew, @ShowInSearch, @ShowInReports, @HideEverywhere, @Color , @IconId , @Name, @Description, @MenuName, @MouseOver, @ModifierId";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, ProcessType);
            return ErrorMessages;
        }
        public bool UpdatePost(ProcessTypeUpdateGet ProcessType)
        {
            string usp = "usp_ProcessTypeUpdatePost @ProcessTypeId, @CodePrefix , @CodeSuffix , @CodeTypeId , @ProcessTypeGroupId, @ShowInPersonalCalendar, @ShowInOrganizationCalendar, @ShowInProjectCalendar, @ShowInEventCalendar, @ProcessMultiMax, @Sequence, @IsPersonal, @ShowInNew, @ShowInSearch, @ShowInReports, @HideEverywhere, @Color , @IconId , @Name, @Description, @MenuName, @MouseOver, @ModifierId";
            _sqlDataAccess.SaveData<ProcessTypeUpdateGet>(usp, ProcessType);
            return true;
        }

        public Task<ProcessTypeDeleteGet> DeleteGet(string UserId, int ProcessTypeId)
        {
            string usp = "usp_ProcessTypeDeleteGet @UserId, @ProcessTypeID";
            return _sqlDataAccess.LoadSingleRecord<ProcessTypeDeleteGet, dynamic>(usp, new { UserId, ProcessTypeId });

        }

        public bool DeletePost(string UserId, int ProcessTypeId)
        {
            string usp = "usp_ProcessTypeDeletePost @UserId, @ProcessTypeID";
            _sqlDataAccess.SaveData<dynamic>(usp, new { UserId, ProcessTypeId });
            return true;
        }

        public async Task<List<ErrorMessage>> DeletePostCheck(string UserId, int ProcessTypeId)
        {
            string usp = "usp_ProcessTypeDeletePostCheck @UserId, @ProcessTypeID";
            var ErrorMessages = await _sqlDataAccess.LoadData<ErrorMessage, dynamic>(usp, new { UserId, ProcessTypeId });
            return ErrorMessages;
        }

        public Task<List<ProcessTypeLanguageIndexGet>> LanguageIndexGet(string UserId, int ProcessTypeId)
        {
            string usp = "usp_ProcessTypeLanguageIndexGet @UserId, @ProcessTypeID";
            return _sqlDataAccess.LoadData<ProcessTypeLanguageIndexGet, dynamic>(usp, new { UserId = UserId, ProcessTypeId = ProcessTypeId });

        }

        public Task<ProcessTypeLanguageIndexGet> LanguageUpdateGet(string UserId, int ProcessTypeLanguageId)
        {
            string usp = "usp_ProcessTypeLanguageUpdateGet @UserId, @ProcessTypeLanguageID";
            return _sqlDataAccess.LoadSingleRecord<ProcessTypeLanguageIndexGet, dynamic>(usp, new { UserId = UserId, ProcessTypeLanguageId = ProcessTypeLanguageId });

        }

        public Task<List<ProcessTypeList>> List(string UserId)
        {
            string usp = "usp_ProcessTypeList @UserID";
            return _sqlDataAccess.LoadData<ProcessTypeList, dynamic>(usp, new { UserId });
        }

    }
}
