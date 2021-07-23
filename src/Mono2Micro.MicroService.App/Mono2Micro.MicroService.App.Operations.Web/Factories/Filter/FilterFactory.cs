using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Mono2Micro.MicroService.App.Operations.Service.Filter;
using Mono2Micro.MicroService.App.Operations.Model.Filter;

namespace Mono2Micro.MicroService.App.Operations.Web.Factories.Filter
{
    public class FilterFactory : IFilterFactory
    {
        private readonly IFilterService _filterService;

        public FilterFactory(IFilterService filterService)
        {
            this._filterService = filterService;
        }

        public List<DdlResponseDTO> GetDurations()
        {
            return _filterService.GetDurations()
                .Select(d => new DdlResponseDTO(d.Duration1, d.Duration1.ToString(), d.SortOrder))
                .ToList();
        }

        public List<DdlResponseDTO> GetDurationsByProduct(int productId)
        {
            var durations = _filterService.GetDurations();
            var durationProducts = _filterService.GetDurationsByProduct(productId);

            return (from d in durations
                    join dp in durationProducts
                    on d.Duration1 equals dp.Duration
                    select new DdlResponseDTO(d.Duration1, d.Duration1.ToString(), d.SortOrder)).ToList();
        }

        public List<DdlResponseDTO> GetInstallmentFrequencies()
        {
            return _filterService.GetInstallmentFrequencies()
                .Select(p => new DdlResponseDTO(p.Id, p.Name, p.SortOrder))
                .ToList();
        }

        public List<DdlResponseDTO> GetTransactionTypes()
        {
            return _filterService.GetTransactionTypes()
                .Select(p => new DdlResponseDTO(p.Id, p.Name, p.SortOrder))
                .ToList();
        }

        public List<DdlResponseDTO> GetInstallmentFrequenciesByProduct(int productId)
        {
            var frequencies = _filterService.GetInstallmentFrequencies();
            var frequncyProducts = _filterService.GetInstallmentFrequenciesByProduct(productId);

            return (from f in frequencies
                    join fp in frequncyProducts
                    on f.Id equals fp.InstallmentFrequencyId
                    select new DdlResponseDTO(f.Id, f.Name, f.SortOrder)).ToList();
        }

        public List<DdlResponseDTO> GetProducts()
        {
            return _filterService.GetProducts()
                .Select(p => new DdlResponseDTO(p.Id, p.Name, p.SortOrder))
                .ToList();
        }
    }
}
