using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ModelNationalSymposium
{
    public class Contact
    {
        public int Id { get; set; }
        public string Name { get; set; }

        public string EmailId { get; set; }

        public long MobileNo { get; set; }
        public string Subject { get; set; }
        public string Message { get; set; }

        public string CreatedBy { get; set; } = string.Empty;

        public string UpdatedBy { get; set; } = string.Empty;

        public DateTime? CreatedOn { get; set; }

        public DateTime? UpdatedOn { get; set; }
    }
}
