using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLayer
{
    public class Item
    {
        private int itemId;

        public int ItemId
        {
            get { return itemId; }
            set { itemId = value; }
        }
        private string name;

        public string Name
        {
            get { return name; }
            set { name = value; }
        }
        private int state;

        public int State
        {
            get { return state; }
            set { state = value; }
        }
        private string productionDate;

        public string ProductionDate
        {
            get { return productionDate; }
            set { productionDate = value; }
        }
        private int categoryId;

        public int CategoryId
        {
            get { return categoryId; }
            set { categoryId = value; }
        }
        private int publisherId;

        public int PublisherId
        {
            get { return publisherId; }
            set { publisherId = value; }
        }

        private string type;

        public string Type
        {
            get { return type; }
            set { type = value; }
        }
    }
}