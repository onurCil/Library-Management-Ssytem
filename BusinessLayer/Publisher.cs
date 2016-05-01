using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLayer
{
    public class Publisher
    {
        private int publisherId;

        public int PublisherId
        {
            get { return publisherId; }
            set { publisherId = value; }
        }
        private string name;

        public string Name
        {
            get { return name; }
            set { name = value; }
        }
        private string address;

        public string Address
        {
            get { return address; }
            set { address = value; }
        }
    }
}
