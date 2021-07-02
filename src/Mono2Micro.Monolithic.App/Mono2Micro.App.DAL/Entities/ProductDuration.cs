using System;
using System.Collections.Generic;

#nullable disable

namespace Mono2Micro.App.DAL.Entities
{
    public partial class ProductDuration
    {
        public int Id { get; set; }
        public int ProductId { get; set; }
        public int Duration { get; set; }
        public int SortOrder { get; set; }
        public DateTime StartDate { get; set; }
        public DateTime EndDate { get; set; }
        public DateTime CreatedOn { get; set; }
        public string CreatedBy { get; set; }
        public DateTime? UpdatedOn { get; set; }
        public string UpdatedBy { get; set; }

        public virtual Duration DurationNavigation { get; set; }
        public virtual Product Product { get; set; }
    }
}
