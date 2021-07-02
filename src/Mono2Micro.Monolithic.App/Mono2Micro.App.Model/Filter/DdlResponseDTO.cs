using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Mono2Micro.App.Model.Filter
{
    public record DdlResponseDTO(int Value, string Name, int SortOrder) : BaseDdlResponseDTO(Value, Name);
}
