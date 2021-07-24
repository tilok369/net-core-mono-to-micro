using Microsoft.Extensions.Hosting;
using Mono2Micro.MicroService.App.Common.Model;
using Mono2Micro.MicroService.App.Transactions.DAL.Entities;
using Mono2Micro.MicroService.App.Transactions.Model.Transactions;
using Mono2Micro.MicroService.App.Transactions.Service.Transactions;
using Mono2Micro.MicroService.App.Transactions.Web.Factories.Transactions;
using Net.RabbitMQ.Wrapper;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;

namespace Mono2Micro.MicroService.App.Transactions.Web.Listeners
{
    public class LoanAccountResponseListener : IHostedService
    {
        private readonly IMqSubscriber _subscriber;
        private readonly ITransactionService _transactionService;

        public LoanAccountResponseListener(IMqSubscriber subscriber, ITransactionService transactionService)
        {
            this._subscriber = subscriber;
            this._transactionService = transactionService;
        }

        public Task StartAsync(CancellationToken cancellationToken)
        {
            _subscriber.Subscribe(SubscribeLoanAccount);
            return Task.CompletedTask;
        }

        private bool SubscribeLoanAccount(string message, IDictionary<string, object> headers)
        {
            var response = JsonConvert.DeserializeObject<TransactionPublishDTO>(message);
            var item = _transactionService.Save(new Transaction
            {
                Id = 0,
                LoanAccountId = response.LoanAccountId,
                Amount = response.Amount,
                Date = response.Date,
                Member = response.Member,
                Product = response.Product,
                Type = 1,
                CreatedBy = "Admin",
                CreatedOn = DateTime.Now,
                UpdatedBy = "Admin",
                UpdatedOn = DateTime.Now
            });

            return item.Id > 0;
        }

        public Task StopAsync(CancellationToken cancellationToken)
        {
            return Task.CompletedTask;
        }
    }
}
