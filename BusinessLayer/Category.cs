using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLayer
{
    public class Category
    {
        private int categoryId;

        public int CategoryId
        {
            get { return categoryId; }
            set { categoryId = value; }
        }
        private string name;

        public string Name
        {
            get { return name; }
            set { name = value; }
        }
        private string shelfNumber;

        public string ShelfNumber
        {
            get { return shelfNumber; }
            set { shelfNumber = value; }
        }
    }
}
