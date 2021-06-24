using Mono2Micro.App.Model.Identity;
using Mono2Micro.App.Service.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Mono2Micro.Monolithic.App.Web.Factories.Identity
{
    public class IdentityFactory : IIdentityFactory
    {
        private readonly IIdentityService _identityService;

        public IdentityFactory(IIdentityService identityService)
        {
            this._identityService = identityService;
        }
        public IdentityDTO Get(int id)
        {
            var identity = _identityService.Get(id);
            if (identity == null) return new IdentityDTO();

            return new IdentityDTO
            {
                Id = identity.Id,
                FirstName = identity.FirstName,
                LastName = identity.LastName,
                Email = identity.Email,
                Phone = identity.Phone,
                IdentityNumber = identity.IdentityNumber,
                Status = identity.Status,
                TypeId = identity.TypeId,
                CreatedBy = identity.CreatedBy,
                CreatedOn = identity.CreatedOn,
                UpdatedBy = identity.UpdatedBy,
                UpdatedOn = identity.UpdatedOn
            };
        }

        public IList<IdentityDTO> Get()
        {
            var identities = _identityService.Get();
            if (!identities.Any()) return new List<IdentityDTO>();

            var identityList = identities.Select(identity =>
             new IdentityDTO
             {
                 Id = identity.Id,
                 FirstName = identity.FirstName,
                 LastName = identity.LastName,
                 Email = identity.Email,
                 Phone = identity.Phone,
                 IdentityNumber = identity.IdentityNumber,
                 Status = identity.Status,
                 TypeId = identity.TypeId,
                 CreatedBy = identity.CreatedBy,
                 CreatedOn = identity.CreatedOn,
                 UpdatedBy = identity.UpdatedBy,
                 UpdatedOn = identity.UpdatedOn
             }).ToList();

            return identityList;
        }

        public IdentityResponseDTO Save(IdentityRequestDTO request)
        {
            var identity = new Mono2Micro.App.DAL.Entities.Identity
            {
                Id = request.Id,
                FirstName = request.FirstName,
                LastName = request.LastName,
                Email = request.Email,
                Phone = request.Phone,
                IdentityNumber = request.IdentityNumber,
                Status = request.Status,
                TypeId = request.TypeId,
                CreatedBy = request.Id == 0 ? "admin" : request.CreatedBy,
                CreatedOn = request.Id == 0 ? DateTime.Now : request.CreatedOn,
                UpdatedBy = "admin",
                UpdatedOn = DateTime.Now
            };

            var entity = _identityService.Save(identity);

            return new IdentityResponseDTO { Id = entity, Success = entity > 0, Message = entity > 0 ? "Saved!" : "Error!" };
        }
    }
}
