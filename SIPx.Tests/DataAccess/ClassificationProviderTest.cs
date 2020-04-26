using Autofac.Extras.Moq;
using System.Data.SqlClient;
using Microsoft.IdentityModel.Tokens;
using SIPx.DataAccess;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using Xunit;

namespace SIPx.Tests.DataAccess
{
    public class ClassificationProvidertest
    {
//        [Fact]
//        public async Task receiveallclass()
//        {
//var x =     await        _classificationProvider.GetClassifications(39);
//            Assert.True(x.Count > 0);
//        }
        [Fact]
        public  void GetClassificationsTest()
        {
            using( var mock = AutoMock.GetLoose())
            {
                var parameters = new List<SqlParameter> { new SqlParameter { ParameterName = "@LanguageID", SqlValue = 39 } };
                mock.Mock<ISqlDataAccess>()
         
                    .Setup(x => x.LoadData2<ClassificationViewGet>("usp_AdminClassficationList @LanguageID", parameters))
                    .Returns(GetSampleClassifications(39));

                var y = mock.Create<ClassificationProvider>();
                var expected = GetSampleClassifications(39);

                var actual = y.GetClassifications2(39);
                Assert.True(actual != null);
            }


        }
        private List<ClassificationViewGet> GetSampleClassifications(int LanguageId)
        {
            List<ClassificationViewGet> output = new List<ClassificationViewGet>
                {
                new ClassificationViewGet
                {
                    Name = "Climate"
                    ,
                    ClassificationId = 1
                    ,
                    ClassificationPageName = "Climate"
                    ,
                    CreatedDate = DateTime.Now
                    ,
                    Creator = "Peter"
                    ,
                    DefaultClassificationPageLanguage = true
                    ,
                    DefaultLanguage = true
                    ,
                    DefaultStatusLanguage = true
                    ,
                    Description = "Climate"
                    ,
                    DropDownSequence = 1
                    ,
                    HasDropDown = true
                    ,
                    MenuName = "Climate"
                    ,
                    ModifiedDate = DateTime.Now
                    ,
                    Modifier = "Peter"
                    ,
                    MouseOver = "Climate"
                    ,
                    StatusName = "Climate"
                }
                };
            return output;
              }
    }
}
