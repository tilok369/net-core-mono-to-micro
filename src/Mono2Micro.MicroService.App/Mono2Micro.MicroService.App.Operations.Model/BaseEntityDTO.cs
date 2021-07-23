using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Mono2Micro.MicroService.App.Operations.Model
{
    public abstract record BaseEntityDTO
    {
    public int Id { get; init; }
    }
}
