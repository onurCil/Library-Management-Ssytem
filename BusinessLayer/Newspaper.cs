using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLayer
{
    public class Newspaper
    {
        private int newspaperId;

        public int NewspaperId
        {
            get { return newspaperId; }
            set { newspaperId = value; }
        }
        private string period;

        public string Period
        {
            get { return period; }
            set { period = value; }
        }
        private int itemId;

        public int ItemId
        {
            get { return itemId; }
            set { itemId = value; }
        }
    }
}
