using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Mono2Micro.MicroService.App.Transactions.Model
{
    public abstract record BasePostRequestDTO
    {
        public int Id { get; set; }
    }
}
