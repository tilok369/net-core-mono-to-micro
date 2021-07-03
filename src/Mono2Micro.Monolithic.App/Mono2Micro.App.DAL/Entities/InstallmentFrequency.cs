using System;
using System.Collections.Generic;

#nullable disable

namespace Mono2Micro.App.DAL.Entities
{
    public partial class InstallmentFrequency
    {
        public InstallmentFrequency()
        {
            LoanAccounts = new HashSet<LoanAccount>();
            ProductInstallmentFrequencies = new HashSet<ProductInstallmentFrequency>();
        }

        public int Id { get; set; }
        public string Name { get; set; }
        public bool Status { get; set; }
        public int SortOrder { get; set; }
        public DateTime CreatedOn { get; set; }
        public string CreatedBy { get; set; }
        public DateTime? UpdatedOn { get; set; }
        public string UpdatedBy { get; set; }

        public virtual ICollection<LoanAccount> LoanAccounts { get; set; }
        public virtual ICollection<ProductInstallmentFrequency> ProductInstallmentFrequencies { get; set; }
    }
}
