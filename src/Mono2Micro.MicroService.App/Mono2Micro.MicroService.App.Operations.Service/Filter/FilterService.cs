using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Mono2Micro.MicroService.App.Operations.DAL.Entities;
using Mono2Micro.MicroService.App.Operations.DAL.Repositories;

namespace Mono2Micro.MicroService.App.Operations.Service.Filter
{
    public class FilterService : IFilterService
    {
        private readonly IGenericRepository _genericRepository;

        public FilterService(IGenericRepository genericRepository)
        {
            this._genericRepository = genericRepository;
        }

        public List<Duration> GetDurations()
        {
            return _genericRepository.GetAll<Duration>();
        }

        public List<ProductDuration> GetDurationsByProduct(int productId)
        {
            return _genericRepository.Find<ProductDuration>(d=>d.ProductId == productId);
        }

        public List<InstallmentFrequency> GetInstallmentFrequencies()
        {
            return _genericRepository.GetAll<InstallmentFrequency>();
        }

        public List<TransactionType> GetTransactionTypes()
        {
            return _genericRepository.GetAll<TransactionType>();
        }

        public List<ProductInstallmentFrequency> GetInstallmentFrequenciesByProduct(int productId)
        {
            return _genericRepository.Find<ProductInstallmentFrequency>(i => i.ProductId == productId);
        }

        public List<Product> GetProducts()
        {
            return _genericRepository.GetAll<Product>();
        }
    }
}
