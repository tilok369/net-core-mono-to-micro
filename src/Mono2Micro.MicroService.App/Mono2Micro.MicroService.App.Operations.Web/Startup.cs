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
using Microsoft.OpenApi.Models;
using Mono2Micro.MicroService.App.Operations.DAL.Repositories;
using Mono2Micro.MicroService.App.Operations.Service.Filter;
using Mono2Micro.MicroService.App.Operations.Service.Identity;
using Mono2Micro.MicroService.App.Operations.Service.LoanAccount;
using Mono2Micro.MicroService.App.Operations.Web.Factories.Filter;
using Mono2Micro.MicroService.App.Operations.Web.Factories.Identity;
using Mono2Micro.MicroService.App.Operations.Web.Factories.LoanAccount;
using Mono2Micro.MicroService.App.Operations.Web.Listeners;
using Net.RabbitMQ.Wrapper;
using RabbitMQ.Client;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Mono2Micro.MicroService.App.Operations.Web
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
                .AddJwtBearer(JwtBearerDefaults.AuthenticationScheme, config =>
                {
                    config.Authority = "https://localhost:44310/";
                    config.Audience = "OperationsApi";
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
                c.SwaggerDoc("v1", new OpenApiInfo { Title = "Mono2Micro.MicroService.App.Operations.Web", Version = "v1" });
            });

            var connectionString = Configuration.GetConnectionString("MicroOptDBConn");
            services.AddSingleton<IGenericRepository>(s => new GenericRepository(connectionString));

            services.AddSingleton<IFilterService, FilterService>();
            services.AddSingleton<IFilterFactory, FilterFactory>();

            services.AddSingleton<IIdentityService, IdentityService>();
            services.AddSingleton<IIdentityFactory, IdentityFactory>();

            services.AddSingleton<ILoanAccountService, LoanAccountService>();
            services.AddSingleton<ILoanAccountFactory, LoanAccountFactory>();

            services.AddSingleton<IMqConnection>(new MqConnection("amqp://guest:guest@192.168.97.24:5672"));
            services.AddSingleton<IMqPublisher>(x => new MqPublisher(x.GetService<IMqConnection>(),
               "loan_account_exchange", ExchangeType.Topic));
            services.AddSingleton<IMqSubscriber>(x => new MqSubscriber(x.GetService<IMqConnection>(),
                "transaction_exchange", "transaction_queue", "transaction.created", ExchangeType.Topic));

            services.AddHostedService<TransactionResponseListener>();
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
                app.UseSwagger();
                app.UseSwaggerUI(c => c.SwaggerEndpoint("/swagger/v1/swagger.json", "Mono2Micro.MicroService.App.Operations.Web v1"));
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
