using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLayer
{
    public class Journal
    {
        private int journalId;

        public int JournalId
        {
            get { return journalId; }
            set { journalId = value; }
        }
        private string timeRange;

        public string TimeRange
        {
            get { return timeRange; }
            set { timeRange = value; }
        }
        private int itemId;

        public int ItemId
        {
            get { return itemId; }
            set { itemId = value; }
        }

        
    }
}

