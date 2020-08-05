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

                services.AddScoped<IUserService, UserService>();
            services.AddControllers();
            services.AddTransient<ISqlDataAccess, SqlDataAccess>();
            services.AddTransient<IPeopleProvider, PeopleProvider>();
            services.AddTransient<IProjectProvider, ProjectProvider>();
            services.AddTransient<IFrontProvider, FrontProvider>();
            services.AddTransient<IFrontProcessProvider, FrontProcessProvider>();
            services.AddTransient<IPageProvider, PageProvider>();
            services.AddTransient<IProcessProvider, ProcessProvider>();
            services.AddTransient<IProcessTemplateProvider, ProcessTemplateProvider>();
            services.AddTransient<IOrganizationProvider, OrganizationProvider>();
            services.AddTransient<IMetaProvider, MetaProvider>();
            services.AddTransient<IContentProvider, ContentProvider>();
            services.AddTransient<IContentMasterProvider, ContentMasterProvider>();
            services.AddTransient<IMasterProvider, MasterProvider>();
            services.AddTransient<ICheckProvider, CheckProvider>();
            services.AddTransient<IClassificationProvider, ClassificationProvider>();
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
