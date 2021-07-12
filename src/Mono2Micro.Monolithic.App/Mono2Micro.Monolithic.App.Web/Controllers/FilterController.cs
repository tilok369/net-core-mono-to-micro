using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Mono2Micro.App.Model.Filter;
using Mono2Micro.Monolithic.App.Web.Factories.Filter;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Mono2Micro.Monolithic.App.Web.Controllers
{
    [Route("api/v{version:apiVersion}/filter")]
    [ApiController]
    [Authorize]
    public class FilterController : ControllerBase
    {
        private readonly IFilterFactory _filterFactory;

        public FilterController(IFilterFactory filterFactory)
        {
            this._filterFactory = filterFactory;
        }

        [HttpGet("products")]
        public ActionResult<IList<DdlResponseDTO>> GetProducts()
        {
            var products = _filterFactory.GetProducts();
            return Ok(products);
        }

        [HttpGet("durations")]
        public ActionResult<IList<DdlResponseDTO>> GetDurations()
        {
            var durations = _filterFactory.GetDurations();
            return Ok(durations);
        }

        [HttpGet("installment-frequencies")]
        public ActionResult<IList<DdlResponseDTO>> GetInstallmentFrequencies()
        {
            var frequencies = _filterFactory.GetInstallmentFrequencies();
            return Ok(frequencies);
        }

        [HttpGet("product-durations/{productId}")]
        public ActionResult<IList<DdlResponseDTO>> GetDurationsByProduct(int productId)
        {
            var productDurations = _filterFactory.GetDurationsByProduct(productId);
            return Ok(productDurations);
        }

        [HttpGet("product-frequencies/{productId}")]
        public ActionResult<IList<DdlResponseDTO>> GetInstallmentFrequenciesByProduct(int productId)
        {
            var productFrequencies = _filterFactory.GetInstallmentFrequenciesByProduct(productId);
            return Ok(productFrequencies);
        }
    }
}
