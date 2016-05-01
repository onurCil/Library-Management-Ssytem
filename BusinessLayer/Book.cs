using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLayer
{
    public class Book
    {
        private int bookId;

        public int BookId
        {
            get { return bookId; }
            set { bookId = value; }
        }
        private string author;

        public string Author
        {
            get { return author; }
            set { author = value; }
        }
        private int itemId;

        public int ItemId
        {
            get { return itemId; }
            set { itemId = value; }
        }
    }
}