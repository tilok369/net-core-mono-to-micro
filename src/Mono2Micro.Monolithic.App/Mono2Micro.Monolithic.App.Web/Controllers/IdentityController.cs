using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Mono2Micro.App.Model.Identity;
using Mono2Micro.Monolithic.App.Web.Factories.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Mono2Micro.Monolithic.App.Web.Controllers
{
    [Route("api/v{version:apiVersion}/identity")]
    [ApiController]
    [Authorize]
    public class IdentityController : ControllerBase
    {
        private readonly IIdentityFactory _identityFactory;
        public IdentityController(IIdentityFactory identityFactory)
        {
            _identityFactory = identityFactory;
        }

        [HttpGet("single")]
        public ActionResult<IdentityDTO> Get(int id)
        {
            var identity = _identityFactory.Get(id);

            return Ok(identity);
        }

        [HttpGet("all")]
        public ActionResult<IList<IdentityDTO>> Get()
        {
            var identity = _identityFactory.Get();

            return Ok(identity);
        }

        [HttpPost("post")]
        public ActionResult<IdentityResponseDTO> Post(IdentityRequestDTO identity)
        {
            var result = _identityFactory.Save(identity);

            return Ok(result);
        }
    }
}
