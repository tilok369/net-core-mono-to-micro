using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Mono2Micro.MicroService.App.Operations.DAL.Repositories;

namespace Mono2Micro.MicroService.App.Operations.Service.Identity
{
    public class IdentityService : IIdentityService
    {
        private readonly IGenericRepository _genericRepository;

        public IdentityService(IGenericRepository genericRepository)
        {
            this._genericRepository = genericRepository;
        }

        public DAL.Entities.Identity Get(int id)
        {
            return _genericRepository.Get<DAL.Entities.Identity>(id);
        }

        public IEnumerable<DAL.Entities.Identity> Get()
        {
            return _genericRepository.GetAll<DAL.Entities.Identity>();
        }

        public int Save(DAL.Entities.Identity identity)
        {
            var entity = identity.Id == 0
                ? _genericRepository.Add<DAL.Entities.Identity>(identity)
                : _genericRepository.Edit<DAL.Entities.Identity>(identity);

            return entity.Id;
        }
    }
}
