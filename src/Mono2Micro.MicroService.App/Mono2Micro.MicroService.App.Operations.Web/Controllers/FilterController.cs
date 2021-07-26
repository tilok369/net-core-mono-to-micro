using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Mono2Micro.MicroService.App.Operations.Model.Filter;
using Mono2Micro.MicroService.App.Operations.Web.Factories.Filter;

namespace Mono2Micro.MicroService.App.Operations.Web.Controllers
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

        [HttpGet("transaction-types")]
        public ActionResult<IList<DdlResponseDTO>> GetTransactionTypes()
        {
            var transactionTypes = _filterFactory.GetTransactionTypes();
            return Ok(transactionTypes);
        }

        [HttpGet("get-identityall")]
        public ActionResult<IList<DdlResponseDTO>> GetIdentity()
        {
            var identities = _filterFactory.GetIdentity();
            return Ok(identities);
        }
    }
}
