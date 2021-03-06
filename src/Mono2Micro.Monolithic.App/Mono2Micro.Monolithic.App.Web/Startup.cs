using FluentValidation;
using FluentValidation.AspNetCore;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.HttpsPolicy;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using Microsoft.IdentityModel.Tokens;
using Microsoft.OpenApi.Models;
using Mono2Micro.App.DAL.Repositories;
using Mono2Micro.App.Model.Identity;
using Mono2Micro.App.Service.Filter;
using Mono2Micro.App.Service.Identity;
using Mono2Micro.App.Service.LoanAccount;
using Mono2Micro.App.Service.Transactions;
using Mono2Micro.Monolithic.App.Web.Factories.Filter;
using Mono2Micro.Monolithic.App.Web.Factories.Identity;
using Mono2Micro.Monolithic.App.Web.Factories.LoanAccount;
using Mono2Micro.Monolithic.App.Web.Factories.Transactions;
using Mono2Micro.Monolithic.App.Web.Validators.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Mono2Micro.Monolithic.App.Web
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
            services.AddCors(cors => cors.AddPolicy("appPolicy", builder => 
            {
                builder.AllowAnyOrigin()
                    .AllowAnyHeader()
                    .AllowAnyMethod();
            }));

            services.AddAuthentication(JwtBearerDefaults.AuthenticationScheme)
                //.AddJwtBearer(options => 
                //{
                //    options.TokenValidationParameters = new TokenValidationParameters
                //    {
                //        ValidateIssuer = true,
                //        ValidateAudience = true,
                //        ValidateLifetime = true,
                //        ValidateIssuerSigningKey = true,
                //        ValidIssuer = Configuration["Jwt:Issuer"],
                //        ValidAudience = Configuration["Jwt:Issuer"],
                //        IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(Configuration["Jwt:Key"]))
                //    };
                //});
                .AddJwtBearer(JwtBearerDefaults.AuthenticationScheme, config =>
                {
                    config.Authority = "https://localhost:44310/";
                    config.Audience = "MonoApi";
                });

            services.AddControllers()
                .AddFluentValidation()
                .AddJsonOptions(jsonOptions =>
                {
                    jsonOptions.JsonSerializerOptions.PropertyNamingPolicy = null;
                })
                .SetCompatibilityVersion(CompatibilityVersion.Version_3_0);


            services.AddApiVersioning(config =>
            {
                config.DefaultApiVersion = new ApiVersion(1, 0);
                config.AssumeDefaultVersionWhenUnspecified = true;
            });

            services.AddSwaggerGen(c =>
            {
                c.SwaggerDoc("v1", new OpenApiInfo { Title = "Mono2Micro.Monolithic.App.Web", Version = "v1" });
            });
         
            services.AddTransient<IValidator<IdentityRequestDTO>, IdentityValidator>();

            var connectionString = Configuration.GetConnectionString("MonoDBConn");
            services.AddScoped<IGenericRepository>(s => new GenericRepository(connectionString));

            services.AddScoped<IIdentityService, IdentityService>();
            services.AddScoped<IFilterService, FilterService>();
            services.AddScoped<ILoanAccountService, LoanAccountService>();
            services.AddScoped<ITransactionService, TransactionService>();

            services.AddScoped<IIdentityFactory, IdentityFactory>();
            services.AddScoped<IFilterFactory, FilterFactory>();
            services.AddScoped<ILoanAccountFactory, LoanAccountFactory>();
            services.AddScoped<ITransactionFactory, TransactionFactory>();
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
                app.UseSwagger();
                app.UseSwaggerUI(c => c.SwaggerEndpoint("/swagger/v1/swagger.json", "Mono2Micro.Monolithic.App.Web v1"));
            }

            app.UseHttpsRedirection();

            app.UseRouting();

            app.UseCors("appPolicy");

            app.UseAuthentication();
            app.UseAuthorization();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });
        }
    }
}
