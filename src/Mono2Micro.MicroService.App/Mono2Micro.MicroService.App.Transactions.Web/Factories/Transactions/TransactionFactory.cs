using Mono2Micro.MicroService.App.Common.Model;
using Mono2Micro.MicroService.App.Transactions.DAL.Entities;
using Mono2Micro.MicroService.App.Transactions.Model.Transactions;
using Mono2Micro.MicroService.App.Transactions.Service.Transactions;
using Net.RabbitMQ.Wrapper;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Mono2Micro.MicroService.App.Transactions.Web.Factories.Transactions
{
    public class TransactionFactory : ITransactionFactory
    {
        private readonly ITransactionService _transactionService;
        private readonly IMqPublisher _publisher;

        public TransactionFactory(ITransactionService transactionService, IMqPublisher publisher)
        {
            this._transactionService = transactionService;
            this._publisher = publisher;
        }
        public IList<TransactionDTO> Get()
        {
            var transctions = _transactionService.Get();
            return (from transaction in transctions
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
                        Member = transaction.Member,
                        Product = transaction.Product,
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
                UpdatedOn = DateTime.Now,
                Member = transaction.Member,
                Product = transaction.Product
            };

            var result = _transactionService.Save(dbTransaction);

            _publisher.Publish("transaction.created", JsonConvert.SerializeObject(
                new LoanAccountPublishDTO
                {
                    LoanAccountId = transaction.LoanAccountId,
                    Amount = transaction.Amount,
                    Date = transaction.Date
                }), null);

            return new TransactionResponseDTO { Id = result.Id, Success = result.Id > 0, Message = result.Id > 0 ? "Success" : "Error" };
        }
    }
}
