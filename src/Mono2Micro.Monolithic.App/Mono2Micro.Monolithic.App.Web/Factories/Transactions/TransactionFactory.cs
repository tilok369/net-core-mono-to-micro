using Mono2Micro.App.DAL.Entities;
using Mono2Micro.App.Model.Transactions;
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

        public TransactionFactory(ITransactionService transactionService)
        {
            this._transactionService = transactionService;
        }
        public IList<TransactionDTO> Get()
        {
            var transctions = _transactionService.Get();
            return transctions.Select(t => new TransactionDTO
            {
                Id = t.Id,
                Amount = t.Amount,
                CreatedBy = t.CreatedBy,
                CreatedOn = t.CreatedOn,
                Date = t.Date,
                LoanAccountId = t.LoanAccountId,
                Type = t.Type,
                UpdatedBy = t.UpdatedBy,
                UpdatedOn = t.UpdatedOn
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
                Id = transaction.Id,
                Amount = transaction.Amount,
                CreatedBy = transaction.CreatedBy,
                CreatedOn = transaction.CreatedOn,
                Date = transaction.Date,
                LoanAccountId = transaction.LoanAccountId,
                Type = transaction.Type,
                UpdatedBy = transaction.UpdatedBy,
                UpdatedOn = transaction.UpdatedOn
            };

            var result = _transactionService.Save(dbTransaction);

            return new TransactionResponseDTO { Id = result.Id, Success = result.Id > 0, Message = result.Id > 0 ? "Success" : "Error" };
        }
    }
}
