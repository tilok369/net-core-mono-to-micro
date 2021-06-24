using FluentValidation;
using Mono2Micro.App.Model.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Threading.Tasks;

namespace Mono2Micro.Monolithic.App.Web.Validators.Identity
{
    public class IdentityValidator: AbstractValidator<IdentityRequestDTO>
    {
        public IdentityValidator()
        {
            RuleFor(i => i.FirstName).NotEmpty().NotNull().WithMessage("First Name cannot be empty");
            RuleFor(i => i.LastName).NotEmpty().NotNull().WithMessage("Last Name cannot be empty");
            RuleFor(i => i.Phone)
                .NotEmpty()
                .WithMessage("Phone cannot be empty")
                .Matches(@"^(?:\+88|01)?\d{11}$")
                .WithMessage("Invalid phone number format");
            RuleFor(i => i.Email)
                .Must(IsValid)
                .WithMessage("Invalid email format");
        }

        public bool IsValid(string emailaddress)
        {
            try
            {
                if (string.IsNullOrEmpty(emailaddress))
                    return true;
                var m = new MailAddress(emailaddress);

                return true;
            }
            catch (FormatException)
            {
                return false;
            }
        }
    }
}
