using Mono2Micro.MicroService.App.Operations.Model.Filter;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Mono2Micro.MicroService.App.Operations.Web.Factories.Filter
{
    public interface IFilterFactory
    {
        List<DdlResponseDTO> GetProducts();
        List<DdlResponseDTO> GetDurations();
        List<DdlResponseDTO> GetInstallmentFrequencies();
        List<DdlResponseDTO> GetTransactionTypes();
        List<DdlResponseDTO> GetDurationsByProduct(int productId);
        List<DdlResponseDTO> GetInstallmentFrequenciesByProduct(int productId);
    }
}
