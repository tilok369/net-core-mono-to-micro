using Mono2Micro.App.DAL.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Mono2Micro.App.Service.Filter
{
    public interface IFilterService
    {
        List<Product> GetProducts();
        List<Duration> GetDurations();
        List<InstallmentFrequency> GetInstallmentFrequencies();
        List<TransactionType> GetTransactionTypes();
        List<ProductDuration> GetDurationsByProduct(int productId);
        List<ProductInstallmentFrequency> GetInstallmentFrequenciesByProduct(int productId);
    }
}
