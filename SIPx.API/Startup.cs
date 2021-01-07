using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.HttpsPolicy;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using Microsoft.IdentityModel.Tokens;
using Microsoft.OpenApi.Models;
using SIPx.API.DataProviders;
using SIPx.API.Models;
using SIPx.API.Services;
using SIPx.DataAccess;
using Swashbuckle.AspNetCore.Swagger;
using SwaggerOptions = SIPx.API.Options.SwaggerOptions;

namespace SIPx.API
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddScoped<IClaimCheck, ClaimCheck > ();
            services.AddControllersWithViews();
            services.AddDbContext<ApplicationDbContext>(options =>
            {
                options.UseSqlServer(Configuration.GetConnectionString("DefaultConnection"));
            });
            services.AddIdentity<SipUser, SipRole>(options =>
            {
                options.Password.RequireDigit = true;
                options.Password.RequireLowercase = true;
                options.Password.RequiredLength = 5;
            }).AddEntityFrameworkStores<ApplicationDbContext>()
            .AddDefaultTokenProviders();

            services.AddAuthentication(auth =>
            {
                auth.DefaultAuthenticateScheme = JwtBearerDefaults.AuthenticationScheme;
                auth.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
            }).AddJwtBearer(options =>
            {
                options.TokenValidationParameters = new Microsoft.IdentityModel.Tokens.TokenValidationParameters
                {
                    ValidateIssuer = false,
                    ValidateAudience = false,
                    ValidAudience = Configuration["AuthSettings:Audience"],
                    ValidIssuer = Configuration["AuthSettings:Issuer"],
                    RequireExpirationTime = true,
                    IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(Configuration["AuthSettings:Key"])),
                    ValidateIssuerSigningKey = true
                };

            });

            services.AddControllers();
            services.AddScoped<IUserService, UserService>();
            services.AddTransient<ISqlDataAccess, SqlDataAccess>();


            services.AddTransient<ISearchProvider, SearchProvider>();
            services.AddTransient<IProcessTemplateFlowConditionProvider, ProcessTemplateFlowConditionProvider>();
            services.AddTransient<IProcessTemplateFlowConditionTypeProvider, ProcessTemplateFlowConditionTypeProvider>();

            services.AddTransient<IProcessTemplateFlowPassComparisonOperatorProvider, ProcessTemplateFlowPassComparisonOperatorProvider>();
            services.AddTransient<IProcessTemplateFlowPassTypeProvider, ProcessTemplateFlowPassTypeProvider>();
            services.AddTransient<IProcessTemplateFlowPassProvider, ProcessTemplateFlowPassProvider>();

            services.AddTransient<IOrganizationPositionProvider, OrganizationPositionProvider>();
            services.AddTransient<IPersonPositionProvider, PersonPositionProvider>();
            services.AddTransient<IPositionProvider, PositionProvider>();
            services.AddTransient<IPropertyProvider, PropertyProvider>();
            services.AddTransient<IClassificationLevelPropertyProvider, ClassificationLevelPropertyProvider>();
            services.AddTransient<IPropertyStatusProvider, PropertyStatusProvider>();
            services.AddTransient<IClassificationValuePropertyProvider, ClassificationValuePropertyProvider>();
            services.AddTransient<IPropertyValueProvider, PropertyValueProvider>();
            services.AddTransient<IPropertyTypeProvider, PropertyTypeProvider>();
            services.AddTransient<IUserRoleProvider, UserRoleProvider>();
            services.AddTransient<IValueUpdateTypeProvider, ValueUpdateTypeProvider>();
            services.AddTransient<IRoleClaimProvider, RoleClaimProvider>();
            services.AddTransient<IFrontPersonProvider, FrontPersonProvider>();
            services.AddTransient<IFrontClassificationValueProvider, FrontClassificationValueProvider>();
//            services.AddTransient<IFrontUserProvider, FrontUserProvider>();
            services.AddTransient<IFrontProjectProvider, FrontProjectProvider>();
            services.AddTransient<IFrontOrganizationProvider, FrontOrganizationProvider>();
            services.AddTransient<IFrontContentProvider, FrontContentProvider>();
            services.AddTransient<IProcessTemplateFlowProvider, ProcessTemplateFlowProvider>();
            services.AddTransient<ICheckProvider, CheckProvider>();
            services.AddTransient<ISettingProvider, SettingProvider>();
            services.AddTransient<IClassificationLevelProvider, ClassificationLevelProvider>();
            services.AddTransient<IDateLevelProvider, DateLevelProvider>();
            services.AddTransient<IAddressTypeProvider, AddressTypeProvider>();
            services.AddTransient<IPersonAddressProvider, PersonAddressProvider>();
            services.AddTransient<IPersonRelationProvider, PersonRelationProvider>();
            services.AddTransient<IPersonTelecomProvider, PersonTelecomProvider>();
            services.AddTransient<IProcessTemplateStageFieldStatusProvider, ProcessTemplateStageFieldStatusProvider>();
            services.AddTransient<IProcessTemplateGroupProvider, ProcessTemplateGroupProvider>();
            services.AddTransient<IProcessTemplateStageFieldProvider, ProcessTemplateStageFieldProvider>();
            services.AddTransient<IProcessTemplateFieldStageProvider, ProcessTemplateFieldStageProvider>();
            services.AddTransient<IProcessTemplateFieldTypeProvider, ProcessTemplateFieldTypeProvider>();
            services.AddTransient<IPersonProvider, PersonProvider>();
            services.AddTransient<IPageSectionDataTypeProvider, PageSectionDataTypeProvider>();
            services.AddTransient<ISecurityLevelProvider, SecurityLevelProvider>();
            services.AddTransient<IProcessTemplateStageProvider, ProcessTemplateStageProvider>();
            services.AddTransient<IProcessTemplateGroupProvider, ProcessTemplateGroupProvider>();
            //services.AddTransient<IProcessTemplateFieldProvider, ProcessTemplateFieldProvider>();
            services.AddTransient<IProcessTemplateStageProvider, ProcessTemplateStageProvider>();
            services.AddTransient<IPageSectionTypeProvider, PageSectionTypeProvider>();
            services.AddTransient<IUserMenuTypeProvider, UserMenuTypeProvider>();
            services.AddTransient<ITelecomTypeProvider, TelecomTypeProvider>();
            services.AddTransient<IProcessTemplateFieldProvider, ProcessTemplateFieldProvider>();
            services.AddTransient<IProcessTemplateFlowConditionComparisonOperatorProvider, ProcessTemplateFlowConditionComparisonOperatorProvider>();
            services.AddTransient<IClassificationUserProvider, ClassificationUserProvider>();
            services.AddTransient<IClassificationRoleProvider, ClassificationRoleProvider>();
            //services.AddTransient<IClassificationPageProvider, ClassificationPageProvider>();
            //services.AddTransient<IClassificationPageSectionProvider, ClassificationPageSectionProvider>();
            services.AddTransient<IClassificationRelationTypeProvider, ClassificationRelationTypeProvider>();
            services.AddTransient<IClassificationProvider, ClassificationProvider>();
            services.AddTransient<IClassificationValueProvider, ClassificationValueProvider>();
            services.AddTransient<IClassificationValueRoleProvider, ClassificationValueRoleProvider>();
            services.AddTransient<IClassificationValueUserProvider, ClassificationValueUserProvider>();

            services.AddTransient<IRoleGroupProvider, RoleGroupProvider>();

            services.AddTransient<IFrontUserPageProvider, FrontUserPageProvider>();
            services.AddTransient<IFrontUserPageSectionProvider, FrontUserPageSectionProvider>();
            services.AddTransient<IPartialProvider, PartialProvider>();
            services.AddTransient<IContentProvider, ContentProvider>();
            services.AddTransient<IContentStatusProvider, ContentStatusProvider>();
            services.AddTransient<IContentTypeClassificationProvider, ContentTypeClassificationProvider>();
            services.AddTransient<IContentTypeClassificationStatusProvider, ContentTypeClassificationStatusProvider>();
            services.AddTransient<IContentTypeGroupProvider, ContentTypeGroupProvider>();
            services.AddTransient<IContentTypeProvider, ContentTypeProvider>();

            services.AddTransient<IFrontProcessProvider, FrontProcessProvider>();
            services.AddTransient<IFrontProvider, FrontProvider>();
            services.AddTransient<IGenderProvider, GenderProvider>();

            services.AddTransient<ILanguageProvider, LanguageProvider>();

            services.AddTransient<IRoleProvider, RoleProvider>();
            services.AddTransient<IFrontUserMenuProvider, FrontUserMenuProvider>();
            services.AddTransient<IUserMenuTemplateProvider, UserMenuTemplateProvider>();
            services.AddTransient<IUserProvider, UserProvider>();
            services.AddTransient<IPersonRelationTypeProvider, PersonRelationTypeProvider>();
            services.AddTransient<IUserMenuTemplateOptionProvider, UserMenuTemplateOptionProvider>();
            services.AddTransient<IFrontUserPreferenceProvider, FrontUserPreferenceProvider>();

            services.AddTransient<IProjectProvider, ProjectProvider>();
            services.AddTransient<IProjectTypeProvider, ProjectTypeProvider>();


            services.AddTransient<IPageProvider, PageProvider>();
            services.AddTransient<IPageSectionProvider, PageSectionProvider>();
            services.AddTransient<IPageSectionContentConditionProvider, PageSectionContentConditionProvider>();
            services.AddTransient<IPageSectionContentConditionTypeProvider, PageSectionContentConditionTypeProvider>();
            services.AddTransient<IPageSectionProcessConditionProvider, PageSectionProcessConditionProvider>();
            services.AddTransient<IPageSectionProcessConditionTypeProvider, PageSectionProcessConditionTypeProvider>();

            services.AddTransient<IProcessProvider, ProcessProvider>();

            services.AddTransient<IProcessTemplateProvider, ProcessTemplateProvider>();
            services.AddTransient<IProcessTemplateStageTypeProvider, ProcessTemplateStageTypeProvider>();

            services.AddTransient<IOrganizationProvider, OrganizationProvider>();
            services.AddTransient<IOrganizationAddressProvider, OrganizationAddressProvider>();
            services.AddTransient<IOrganizationTelecomProvider, OrganizationTelecomProvider>();
            services.AddTransient<IOrganizationTypeProvider, OrganizationTypeProvider>();

            services.AddTransient<IMetaProvider, MetaProvider>();
            services.AddTransient<IMasterProvider, MasterProvider>();
            services.AddTransient<IMasterListProvider, MasterListProvider>();
            services.AddTransient<IHomeProvider, HomeProvider>();


            services.AddTransient<SIPx.API.DataProviders.IUITermLanguageCustomizationProvider, UITermLanguageCustomizationProvider>();
            services.AddSwaggerGen(x =>
            {
                x.SwaggerDoc("v1", new OpenApiInfo { Title = "SIP API", Version = "v1" });
            var security = new Dictionary<string, IEnumerable<string>>
            { {"Bearer", new string[0]}};
                x.AddSecurityDefinition("Bearer", new OpenApiSecurityScheme
                {
                    Name = "Authorization",
                    Type = SecuritySchemeType.Http,
                    Scheme = "bearer",
                    BearerFormat = "JWT",
                    In = ParameterLocation.Header,
                    Description = "JWT Authorization header using the Bearer scheme."
                });
                x.AddSecurityRequirement(new OpenApiSecurityRequirement
                {
                    {
                          new OpenApiSecurityScheme
                            {
                                Reference = new OpenApiReference
                                {
                                    Type = ReferenceType.SecurityScheme,
                                    Id = "Bearer"
                                },
                                Scheme = "bearer",
            Name = "Bearer",
            In = ParameterLocation.Header,
                            },
                            new string[] {}

                    }
                });
            });
            }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
            public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }
            var swaggerOptions = new SwaggerOptions();
            Configuration.GetSection(nameof(SwaggerOptions)).Bind(swaggerOptions);
            app.UseSwagger(option => { option.RouteTemplate = swaggerOptions.JsonRoute; });
            app.UseSwaggerUI(option =>
            {
                option.SwaggerEndpoint(swaggerOptions.UiEndpoint, swaggerOptions.Description);
            });
            app.UseHttpsRedirection();

            app.UseRouting();
            app.UseAuthentication();
            app.UseAuthorization();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
                endpoints.MapControllerRoute(
                    name: "default",
                    pattern: "{controller=Home}/{action=Index}/{id?}");
            });
        }
    }
}
