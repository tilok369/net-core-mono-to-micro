using Microsoft.Extensions.Hosting;
using Net.RabbitMQ.Wrapper;
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

        public LoanAccountResponseListener(IMqSubscriber subscriber)
        {
            this._subscriber = subscriber;
        }

        public Task StartAsync(CancellationToken cancellationToken)
        {
            _subscriber.Subscribe(SubscribeLoanAccount);
            return Task.CompletedTask;
        }

        private bool SubscribeLoanAccount(string message, IDictionary<string, object> headers)
        {
            throw new NotImplementedException();
        }

        public Task StopAsync(CancellationToken cancellationToken)
        {
            return Task.CompletedTask;
        }
    }
}
