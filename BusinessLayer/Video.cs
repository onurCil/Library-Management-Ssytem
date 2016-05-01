using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLayer
{
    public class Video
    {
        private int videoId;

        public int VideoId
        {
            get { return videoId; }
            set { videoId = value; }
        }
        private string format;

        public string Format
        {
            get { return format; }
            set { format = value; }
        }
        private int itemId;

        public int ItemId
        {
            get { return itemId; }
            set { itemId = value; }
        }

    }
}
