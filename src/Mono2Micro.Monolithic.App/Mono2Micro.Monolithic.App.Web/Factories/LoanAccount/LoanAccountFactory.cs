using Mono2Micro.App.DAL.Entities;
using Mono2Micro.App.Model.LoanAccount;
using Mono2Micro.App.Service.Filter;
using Mono2Micro.App.Service.Identity;
using Mono2Micro.App.Service.LoanAccount;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Mono2Micro.Monolithic.App.Web.Factories.LoanAccount
{
    public class LoanAccountFactory : ILoanAccountFactory
    {

        private readonly ILoanAccountService _loanAccountService;
        private readonly IFilterService _filterService;
        private readonly IIdentityService _identityService;

        public LoanAccountFactory(ILoanAccountService loanAccountService, IFilterService filterService,
            IIdentityService identityService)
        {
            this._loanAccountService = loanAccountService;
            this._filterService = filterService;
            this._identityService = identityService;
        }
        public IList<LoanAccountRequestDTO> Get()
        {
            var accountList = _loanAccountService.Get();
            var productList = _filterService.GetProducts();
            var frequencyList = _filterService.GetInstallmentFrequencies();
            var clientList = _identityService.Get();
            return (from account in accountList
                    join product in productList
                    on account.ProductId equals product.Id
                    join frequncy in frequencyList
                    on account.InstallmentFrequencyId equals frequncy.Id
                    join client in clientList
                    on account.IdentityId equals client.Id
                    select new LoanAccountRequestDTO
                    {
                        Id = account.Id,
                        Amount = account.Amount,
                        CreatedBy = account.CreatedBy,
                        CreatedOn = account.CreatedOn,
                        DisbursedDate = account.DisbursedDate,
                        Duration = account.Duration,
                        IdentityId = account.IdentityId,
                        InstallmentFrequencyId = account.InstallmentFrequencyId,
                        ProductId = account.ProductId,
                        Status = account.Status,
                        UpdatedBy = account.UpdatedBy,
                        UpdatedOn = account.UpdatedOn,
                        Client = client.FirstName + " " + client.LastName,
                        Frequency = frequncy.Name,
                        Product = product.Name
                    }).ToList();
        }

        public LoanAccountRequestDTO Get(int id)
        {
            var account = _loanAccountService.Get(id);
            if (account == null) return new LoanAccountRequestDTO();

            return new LoanAccountRequestDTO
            {
                Id = account.Id,
                Amount = account.Amount,
                CreatedBy = account.CreatedBy,
                CreatedOn = account.CreatedOn,
                DisbursedDate = account.DisbursedDate,
                Duration = account.Duration,
                IdentityId = account.IdentityId,
                InstallmentFrequencyId = account.InstallmentFrequencyId,
                ProductId = account.ProductId,
                Status = account.Status,
                UpdatedBy = account.UpdatedBy,
                UpdatedOn = account.UpdatedOn
            };
        }

        public LoanAccountResponseDTO Save(LoanAccountRequestDTO loanAccount)
        {
            var account =  new Mono2Micro.App.DAL.Entities.LoanAccount
            {
                Id = loanAccount.Id,
                Amount = loanAccount.Amount,
                CreatedBy = loanAccount.CreatedBy,
                CreatedOn = loanAccount.CreatedOn,
                DisbursedDate = loanAccount.DisbursedDate,
                Duration = loanAccount.Duration,
                IdentityId = loanAccount.IdentityId,
                InstallmentFrequencyId = loanAccount.InstallmentFrequencyId,
                ProductId = loanAccount.ProductId,
                Status = loanAccount.Status,
                UpdatedBy = loanAccount.UpdatedBy,
                UpdatedOn = loanAccount.UpdatedOn
            };

            var result = _loanAccountService.Save(account);

            if (result.Id > 0)
            {
                var previousSchedules = _loanAccountService.GetSchedules(result.Id).ToList();
                var newSchedules = CreateSchedule(previousSchedules, result.Id, loanAccount.Duration, 
                    loanAccount.InstallmentFrequencyId, loanAccount.Amount, loanAccount.DisbursedDate);

                var rslt = _loanAccountService.Save(newSchedules);
            }

            return new LoanAccountResponseDTO { Id = result.Id, Message = result.Id == 0 ? "Error" : "Success", Success = result.Id > 0 };
        }

        public IList<LoanScheduleDTO> CreateSchedule(int duration, int frequesncy, int amount, DateTime disbursedDate)
        {
            var schedules = CreateSchedule(new List<LoanSchedule>(), null, duration, frequesncy, amount, disbursedDate);

            return schedules.Select(s => new LoanScheduleDTO
            {
                Id = 0,
                InstallmentAmount = s.InstallmentAmount,
                InstallmentNo = s.InstallmentNo,
                LoanAccountId = 0,
                OutstandingAmount = s.OutstandingAmount,
                PaidAmount = s.PaidAmount,
                ScheduledDate = s.ScheduledDate
            }).ToList();
        }

        private IList<LoanSchedule> CreateSchedule(List<LoanSchedule> prevSchedules, int? accountId, int duration, int frequesncy, int amount, DateTime disbursedDate)
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
                var paidAmount = sc?.PaidAmount ?? 0;
                outstabdingAmount -= paidAmount;
                schedules.Add(new LoanSchedule
                {
                    Id = 0,
                    LoanAccountId = accountId??0,
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
