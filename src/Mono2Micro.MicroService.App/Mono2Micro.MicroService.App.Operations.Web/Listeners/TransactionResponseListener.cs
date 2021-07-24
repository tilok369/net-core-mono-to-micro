using Microsoft.Extensions.Hosting;
using Mono2Micro.MicroService.App.Operations.Web.Factories.LoanAccount;
using Net.RabbitMQ.Wrapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;

namespace Mono2Micro.MicroService.App.Operations.Web.Listeners
{
    public class TransactionResponseListener : IHostedService
    {
        private readonly IMqSubscriber _subscriber;
        private readonly ILoanAccountFactory _loanAccountFactory;

        public TransactionResponseListener(IMqSubscriber subscriber, ILoanAccountFactory loanAccountFactory)
        {
            this._subscriber = subscriber;
            this._loanAccountFactory = loanAccountFactory;
        }
        public Task StartAsync(CancellationToken cancellationToken)
        {
            _subscriber.Subscribe(SubscribeTransaction);
            return Task.CompletedTask;
        }

        private bool SubscribeTransaction(string message, IDictionary<string, object> headers)
        {
            throw new NotImplementedException();
        }

        public Task StopAsync(CancellationToken cancellationToken)
        {
            return Task.CompletedTask;
        }
    }
}
