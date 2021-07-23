using Mono2Micro.MicroService.App.Transactions.DAL.Entities;
using Mono2Micro.MicroService.App.Transactions.DAL.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Mono2Micro.MicroService.App.Transactions.Service.Transactions
{
    public class TransactionService: ITransactionService
    {
        private readonly IGenericRepository _genericRepository;

        public TransactionService(IGenericRepository genericRepository)
        {
            this._genericRepository = genericRepository;
        }
        public IList<Transaction> Get()
        {
            return _genericRepository.GetAll<Transaction>();
        }

        public Transaction Get(int id)
        {
            return _genericRepository.Get<Transaction>(id);
        }

        public Transaction Save(Transaction transaction)
        {
            return transaction.Id == 0
                ? _genericRepository.Add<Transaction>(transaction)
                : _genericRepository.Edit<Transaction>(transaction);
        }
    }
}
