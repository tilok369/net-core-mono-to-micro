using Mono2Micro.App.DAL.Entities;
using Mono2Micro.App.Model.Transactions;
using Mono2Micro.App.Service.Filter;
using Mono2Micro.App.Service.Identity;
using Mono2Micro.App.Service.LoanAccount;
using Mono2Micro.App.Service.Transactions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Mono2Micro.Monolithic.App.Web.Factories.Transactions
{
    public class TransactionFactory : ITransactionFactory
    {
        private readonly ITransactionService _transactionService;
        private readonly IIdentityService _identityService;
        private readonly ILoanAccountService _loanAccountService;
        private readonly IFilterService _filterService;

        public TransactionFactory(ITransactionService transactionService, IIdentityService identityService,
            ILoanAccountService loanAccountService, IFilterService filterService)
        {
            this._transactionService = transactionService;
            this._identityService = identityService;
            this._loanAccountService = loanAccountService;
            this._filterService = filterService;
        }
        public IList<TransactionDTO> Get()
        {
            var transctions = _transactionService.Get();
            var members = _identityService.Get();
            var loanAccounts = _loanAccountService.Get();
            var products = _filterService.GetProducts();
            return (from transaction in transctions
                    join account in loanAccounts
                    on transaction.LoanAccountId equals account.Id
                    join member in members
                    on account.IdentityId equals member.Id
                    join product in products
                    on account.ProductId equals product.Id
                    select new TransactionDTO
                    {
                        Id = transaction.Id,
                        Amount = transaction.Amount,
                        CreatedBy = transaction.CreatedBy,
                        CreatedOn = transaction.CreatedOn,
                        Date = transaction.Date,
                        LoanAccountId = transaction.LoanAccountId,
                        Type = transaction.Type,
                        UpdatedBy = transaction.UpdatedBy,
                        UpdatedOn = transaction.UpdatedOn,
                        Member = $"{member.FirstName} {member.LastName}",
                        Product = product.Name,
                        TypeStr = transaction.Type == 1 ? "Loan Disbursed" : "Loan Collection"
                    }).ToList();
        }

        public TransactionDTO Get(int id)
        {
            var transction = _transactionService.Get(id);
            if (transction == null) return new TransactionDTO();

            return new TransactionDTO
            {
                Id = transction.Id,
                Amount = transction.Amount,
                CreatedBy = transction.CreatedBy,
                CreatedOn = transction.CreatedOn,
                Date = transction.Date,
                LoanAccountId = transction.LoanAccountId,
                Type = transction.Type,
                UpdatedBy = transction.UpdatedBy,
                UpdatedOn = transction.UpdatedOn
            };
        }

        public TransactionResponseDTO Save(TransactionRequestDTO transaction)
        {
            var dbTransaction = new Transaction
            {
                Amount = transaction.Amount,
                CreatedBy = "Admin",
                CreatedOn = DateTime.Now,
                Date = transaction.Date,
                LoanAccountId = transaction.Id,
                Type = transaction.Type,
                UpdatedBy = "Admin",
                UpdatedOn = DateTime.Now
            };

            var result = _transactionService.Save(dbTransaction);

            return new TransactionResponseDTO { Id = result.Id, Success = result.Id > 0, Message = result.Id > 0 ? "Success" : "Error" };
        }
    }
}
