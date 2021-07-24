using Microsoft.Extensions.Hosting;
using Mono2Micro.MicroService.App.Common.Model;
using Mono2Micro.MicroService.App.Operations.DAL.Entities;
using Mono2Micro.MicroService.App.Operations.Service.LoanAccount;
using Mono2Micro.MicroService.App.Operations.Web.Factories.LoanAccount;
using Net.RabbitMQ.Wrapper;
using Newtonsoft.Json;
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
        private readonly ILoanAccountService _loanAccountService;

        public TransactionResponseListener(IMqSubscriber subscriber, ILoanAccountService loanAccountService)
        {
            this._subscriber = subscriber;
            this._loanAccountService = loanAccountService;
        }
        public Task StartAsync(CancellationToken cancellationToken)
        {
            _subscriber.Subscribe(SubscribeTransaction);
            return Task.CompletedTask;
        }

        private bool SubscribeTransaction(string message, IDictionary<string, object> headers)
        {
            var response = JsonConvert.DeserializeObject<LoanAccountPublishDTO>(message);
            var loanAccount = _loanAccountService.Get(response.LoanAccountId);
            var previousSchedules = _loanAccountService.GetSchedules(response.LoanAccountId).ToList();
            var newSchedules = CreateSchedule(previousSchedules, loanAccount.Id, loanAccount.Duration,
                loanAccount.InstallmentFrequencyId, loanAccount.Amount, loanAccount.DisbursedDate,
                response.Amount, response.Date);

            _loanAccountService.Delete(previousSchedules);
            var result = _loanAccountService.Save(newSchedules);

            return result;
        }

        public Task StopAsync(CancellationToken cancellationToken)
        {
            return Task.CompletedTask;
        }

        private IList<LoanSchedule> CreateSchedule(List<LoanSchedule> prevSchedules, int? accountId, int duration, 
            int frequesncy, int amount, DateTime disbursedDate, int transactionAmount, DateTime trnsactionDate)
        {
            var schedules = new List<LoanSchedule>();
            double outstabdingAmount = amount;
            for (int i = 1; i <= duration; i++)
            {
                var scheduleDate = frequesncy == 1
                                    ? disbursedDate.AddDays(7 * i).Date
                                    : frequesncy == 2
                                        ? disbursedDate.AddMonths(i).Date
                                        : disbursedDate.AddMonths(3 * i).Date;
                var sc = prevSchedules.FirstOrDefault(s => s.ScheduledDate.Equals(scheduleDate));
                var paidAmount = (scheduleDate.Date.Equals(trnsactionDate)) 
                    ? transactionAmount : (sc?.PaidAmount ?? 0);
                outstabdingAmount -= paidAmount;
                schedules.Add(new LoanSchedule
                {
                    Id = 0,
                    LoanAccountId = accountId ?? 0,
                    InstallmentNo = i,
                    ScheduledDate = scheduleDate,
                    InstallmentAmount = ((double)amount / duration),
                    PaidAmount = paidAmount,
                    OutstandingAmount = outstabdingAmount
                });
            }

            return schedules;
        }
    }
}
