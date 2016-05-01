using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataLayer;
using System.Data;

namespace BusinessLayer
{
    public class ItemDataProcess
    {
        public static string type = "LIST ALL";
        public static List<Item> GetItems()//List
        {
            DataSet data = DBClass.SelectCommand("exec spSelectITEM");
            if (data.Tables[0].Rows.Count == 0)
            {
                return null;
            }
            else
            {
                List<Item> items = new List<Item>();
                foreach (DataRow item in data.Tables[0].Rows)
                {
                    items.Add(new Item
                    {
                        ItemId = Convert.ToInt32(item[0]),
                        Name = item[1].ToString(),
                        State = Convert.ToInt32(item[2]),
                        ProductionDate = item[3].ToString(),
                        CategoryId = Convert.ToInt32(item[4]),
                        PublisherId = Convert.ToInt32(item[5]),
                        Type = item[6].ToString()
                    });
                }
                return items;
            }
        }

        public static List<Book> GetBooks()//List
        {
            DataSet data = DBClass.SelectCommand("exec spGetBooks");
            if (data.Tables[0].Rows.Count == 0)
            {
                return null;
            }
            else
            {
                List<Book> books = new List<Book>();
                foreach (DataRow book in data.Tables[0].Rows)
                {

                    books.Add(new Book
                    {
                        BookId = Convert.ToInt32(book[0]),
                        Author = book[1].ToString(),
                        ItemId = Convert.ToInt32(book[2])
                    });
                }
                return books;
            }
        }
        public static List<Video> GetVideos()//List
        {
            DataSet data = DBClass.SelectCommand("exec spGetVideos");
            if (data.Tables[0].Rows.Count == 0)
            {
                return null;
            }
            else
            {
                List<Video> videos = new List<Video>();
                foreach (DataRow video in data.Tables[0].Rows)
                {
                    videos.Add(new Video
                    {
                        VideoId = Convert.ToInt32(video[0]),
                        Format = video[1].ToString(),
                        ItemId = Convert.ToInt32(video[2].ToString())

                    });
                }
                return videos;
            }
        }
        public static List<Newspaper> GetNewspapers()//List
        {
            DataSet data = DBClass.SelectCommand("exec spGetNewspapers");
            if (data.Tables[0].Rows.Count == 0)
            {
                return null;
            }
            else
            {
                List<Newspaper> newspapers = new List<Newspaper>();
                foreach (DataRow newspaper in data.Tables[0].Rows)
                {
                    newspapers.Add(new Newspaper
                    {
                        NewspaperId = Convert.ToInt32(newspaper[0]),
                        Period = newspaper[1].ToString(),
                        ItemId = Convert.ToInt32(newspaper[2].ToString())

                    });
                }
                return newspapers;
            }
        }
        public static List<Journal> GetJournals()//List
        {
            DataSet data = DBClass.SelectCommand("exec spGetJournals");
            if (data.Tables[0].Rows.Count == 0)
            {
                return null;
            }
            else
            {
                List<Journal> journals = new List<Journal>();
                foreach (DataRow journal in data.Tables[0].Rows)
                {
                    journals.Add(new Journal
                    {
                        JournalId = Convert.ToInt32(journal[0]),
                        TimeRange = journal[1].ToString(),
                        ItemId = Convert.ToInt32(journal[2].ToString())

                    });
                }
                return journals;
            }
        }
        public static List<Category> GetCategories()//List
        {
            DataSet data = DBClass.SelectCommand("exec spGetCategories");
            if (data.Tables[0].Rows.Count == 0)
            {
                return null;
            }
            else
            {
                List<Category> categories = new List<Category>();
                foreach (DataRow category in data.Tables[0].Rows)
                {
                    categories.Add(new Category
                    {
                        CategoryId = Convert.ToInt32(category[0]),
                        Name = category[1].ToString(),
                        ShelfNumber = category[2].ToString(),
                    });
                }
                return categories;
            }
        }

        public static List<Publisher> GetPublishers()//List
        {
            DataSet data = DBClass.SelectCommand("exec spGetPublishers");
            if (data.Tables[0].Rows.Count == 0)
            {
                return null;
            }
            else
            {
                List<Publisher> publishers = new List<Publisher>();
                foreach (DataRow publisher in data.Tables[0].Rows)
                {
                    publishers.Add(new Publisher
                    {
                        PublisherId = Convert.ToInt32(publisher[0]),
                        Name = publisher[1].ToString(),
                        Address = publisher[2].ToString(),
                    });
                }
                return publishers;
            }
        }

        public static void InsertItems(Item item)//Insert
        {
            DBClass.InsertCommand("exec spInsertITEM '" + item.Name + "', " + item.State + ",'" + item.ProductionDate + "', " + item.CategoryId + "," + item.PublisherId + ", '" + item.Type + "'");
        }

        public static void InsertBook(Book book)//Insert
        {
            DBClass.InsertCommand("exec spInsertBOOK '" + book.Author + "', " + book.ItemId);
        }

        public static void InsertJournal(Journal jor)//Insert
        {
            DBClass.InsertCommand("exec spInsertJOURNAL '" + jor.TimeRange + "', " + jor.ItemId);
        }

        public static void InsertNewspaper(Newspaper news)//Insert
        {
            DBClass.InsertCommand("exec spInsertNEWSPAPER '" + news.Period + "', " + news.ItemId);
        }

        public static void InsertVideo(Video video)//Insert
        {
            DBClass.InsertCommand("exec spInsertVIDEO '" + video.Format + "', " + video.ItemId);
        }

        public static void InsertPublishers(Publisher publisher)//Insert
        {
            DBClass.InsertCommand("exec spInsertPUBLISHER '" + publisher.Name + "', '" + publisher.Address + "'");
        }
        public static void InsertCategories(Category category)//Insert
        {
            DBClass.InsertCommand("exec spInsertCATEGORY '" + category.Name + "', '" + category.ShelfNumber + "'");
        }

        public static Item getItemByID(int id)
        {
            Item item = new Item();
            DataSet data = DBClass.SelectCommand("exec spGetItemByID " + id);
            if (data.Tables[0].Rows.Count == 0)
            {
                return null;
            }
            else
            {
                DataRow row = data.Tables[0].Rows[0];
                item.ItemId = Convert.ToInt16(row[0].ToString());
                item.Name = row[1].ToString();
                item.State = Convert.ToInt16(row[2].ToString());
                item.ProductionDate = row[3].ToString();
                item.CategoryId = Convert.ToInt16(row[4].ToString());
                item.PublisherId = Convert.ToInt16(row[5].ToString());
                item.Type = row[6].ToString();
                return item;
            }
        }

        public static string[] getBookByItemId(int bookID)
        {
            //Gelen Book'un item attributeleriyle birlikte Book'u return ediyor.

            Item item = new Item();
            DataSet data = DBClass.SelectCommand("exec spGetBookByItemId " + bookID);
            if (data.Tables[0].Rows.Count == 0)
            {
                return null;
            }
            else
            {
                DataRow row = data.Tables[0].Rows[0];
                string[] returnVal = new string[10];
                for (int i = 0; i < 10; i++)
                {
                    returnVal[i] = row[i].ToString();
                }

                return returnVal;
            }
        }

        public static string[] getJournalByItemId(int journalID)
        {
            Item item = new Item();
            DataSet data = DBClass.SelectCommand("exec spGetJournalByItemId " + journalID);
            if (data.Tables[0].Rows.Count == 0)
            {
                return null;
            }
            else
            {
                DataRow row = data.Tables[0].Rows[0];
                string[] returnVal = new string[10];
                for (int i = 0; i < 10; i++)
                {
                    returnVal[i] = row[i].ToString();
                }

                return returnVal;
            }
        }

        public static string[] getNewspaperByItemId(int newspaperID)
        {
            Item item = new Item();
            DataSet data = DBClass.SelectCommand("exec spGetNewspaperByItemId " + newspaperID);
            if (data.Tables[0].Rows.Count == 0)
            {
                return null;
            }
            else
            {
                DataRow row = data.Tables[0].Rows[0];
                string[] returnVal = new string[10];
                for (int i = 0; i < 10; i++)
                {
                    returnVal[i] = row[i].ToString();
                }

                return returnVal;
            }
        }

        public static string[] getVideoByItemId(int videoID)
        {
            Item item = new Item();
            DataSet data = DBClass.SelectCommand("exec spGetVideoByItemId " + videoID);
            if (data.Tables[0].Rows.Count == 0)
            {
                return null;
            }
            else
            {
                DataRow row = data.Tables[0].Rows[0];
                string[] returnVal = new string[10];
                for (int i = 0; i < 10; i++)
                {
                    returnVal[i] = row[i].ToString();
                }

                return returnVal;
            }
        }

        public static Book returnBookByItemId(int itemID)
        {
            DataSet data = DBClass.SelectCommand("exec spGetBooksByItemId " + itemID);
            if (data.Tables[0].Rows.Count == 0)
            {
                return null;
            }
            else
            {
                DataRow row = data.Tables[0].Rows[0];
                Book book = new Book();
                book.BookId = Convert.ToInt32(row[0].ToString());
                book.Author = row[1].ToString();
                book.ItemId = Convert.ToInt32(row[2].ToString());
                return book;
            }
        }

        public static Book getBookByBookId(int bookId)
        {
            DataSet data = DBClass.SelectCommand("exec spGetBooksByBookId " + bookId);
            if (data.Tables[0].Rows.Count == 0)
            {
                return null;
            }
            else
            {
                DataRow row = data.Tables[0].Rows[0];
                Book book = new Book();
                book.BookId = Convert.ToInt32(row[0].ToString());
                book.Author = row[1].ToString();
                book.ItemId = Convert.ToInt32(row[2].ToString());
                return book;
            }
        }

        public static Journal getJournalByJournalId(int journalID)
        {
            DataSet data = DBClass.SelectCommand("exec spGetJournalsByJournalId " + journalID);
            if (data.Tables[0].Rows.Count == 0)
            {
                return null;
            }
            else
            {
                DataRow row = data.Tables[0].Rows[0];
                Journal journal = new Journal();
                journal.JournalId = Convert.ToInt32(row[0].ToString());
                journal.TimeRange = row[1].ToString();
                journal.ItemId = Convert.ToInt32(row[2].ToString());
                return journal;
            }
        }

        public static Newspaper getNewspaperByNewspaperId(int newspaperID)
        {
            DataSet data = DBClass.SelectCommand("exec spGetNewspapersByNewspaperId " + newspaperID);
            if (data.Tables[0].Rows.Count == 0)
            {
                return null;
            }
            else
            {
                DataRow row = data.Tables[0].Rows[0];
                Newspaper news = new Newspaper();
                news.NewspaperId = Convert.ToInt32(row[0].ToString());
                news.Period = row[1].ToString();
                news.ItemId = Convert.ToInt32(row[2].ToString());
                return news;
            }
        }

        public static Video getVideoByVideoId(int videoID)
        {
            DataSet data = DBClass.SelectCommand("exec spGetVideoByVideoId " + videoID);
            if (data.Tables[0].Rows.Count == 0)
            {
                return null;
            }
            else
            {
                DataRow row = data.Tables[0].Rows[0];
                Video video = new Video();
                video.VideoId = Convert.ToInt32(row[0].ToString());
                video.Format = row[1].ToString();
                video.ItemId = Convert.ToInt32(row[2].ToString());
                return video;
            }
        }

        public static string getCategoryNameByCategoryID(int categoryId)
        {
            DataSet data = DBClass.SelectCommand("exec spGetCategoryByID " + categoryId);
            if (data.Tables[0].Rows.Count == 0)
            {
                return null;
            }
            else
            {
                DataRow row = data.Tables[0].Rows[0];
                return row[1].ToString();//id name shelfnumber
            }
        }

        public static int getItemIdByItemName(string itemName)
        {
            DataSet data = DBClass.SelectCommand("exec spItemIdByName '" + itemName + "'");
            if (data.Tables[0].Rows.Count == 0)
            {
                return 0;
            }
            else
            {
                DataRow row = data.Tables[0].Rows[0];
                return Convert.ToInt32(row[0].ToString());
            }
        }

        public static string getPublisherNameByPublisherID(int publisherId)
        {
            DataSet data = DBClass.SelectCommand("exec spGetPublisherByID " + publisherId);
            if (data.Tables[0].Rows.Count == 0)
            {
                return null;
            }
            else
            {
                DataRow row = data.Tables[0].Rows[0];
                return row[1].ToString();//id name logo
            }

        }

        public static int getCategoryIDByName(string name)
        {
            DataSet data = DBClass.SelectCommand("exec spGetCategoryByName '" + name +"'");
            if (data.Tables[0].Rows.Count == 0)
            {
                return 0;
            }
            else
            {
                DataRow row = data.Tables[0].Rows[0];
                return Convert.ToInt32(row[0].ToString());//id name shelfNumber
            }
        }

        public static int getPublisherIDByName(string name)
        {
            DataSet data = DBClass.SelectCommand("exec spGetPublisherByName '" + name + "'");
            if (data.Tables[0].Rows.Count == 0)
            {
                return 0;
            }
            else
            {
                DataRow row = data.Tables[0].Rows[0];
                return Convert.ToInt32(row[0].ToString());//id name shelfNumber
            }
        }

        public static void DeleteItemsByID(int id)//Delete by ID
        {
            DBClass.InsertCommand("exec spDeleteITEMbyID " + id);
        }

        public static void DeleteBookByID(int id)//Delete by ID
        {
            DBClass.InsertCommand("exec spDeleteBOOKbyID " + id);
        }

        public static void DeleteJournalByID(int id)//Delete by ID
        {
            DBClass.InsertCommand("exec spDeleteJOURNALbyID " + id);
        }

        public static void DeleteNewspaperByID(int id)//Delete by ID
        {
            DBClass.InsertCommand("exec spDeleteNEWSPAPERbyID " + id);
        }

        public static void DeleteVideoByID(int id)//Delete by ID
        {
            DBClass.InsertCommand("exec spDeleteVIDEObyID " + id);
        }

        public static void DeletePublishersByID(int id)//Delete by ID
        {
            DBClass.InsertCommand("exec spDeletePublisherbyID " + id);
        }
        public static void DeleteCategoriesByID(int id)//Delete by ID
        {
            DBClass.InsertCommand("exec spDeleteCategorybyID " + id);
        }

        public static void UpdatePublishers(Publisher publisher)//Update
        {
            DBClass.InsertCommand("exec spUpdatePUBLISHER " + publisher.PublisherId + " , '" + publisher.Name + "' , '" + publisher.Address + "'");
        }

        public static void UpdateCategories(Category category)//Update
        {
            DBClass.InsertCommand("exec spUpdateCATEGORY " + category.CategoryId + " , '" + category.Name + "' , '" + category.ShelfNumber+"'");
        }


        public static void DeleteItemsByName(Item item)//Delete by Name
        {
            DBClass.InsertCommand("exec spDeleteITEMbyName '" + item.Name +"'");
        }
        public static void UpdateItems(Item item)//Update
        {
            DBClass.InsertCommand("exec spUpdateITEM " + item.ItemId + " ,'" + item.Name + "', " + item.State + " ,'" + item.ProductionDate + "' , " + item.CategoryId + " , " + item.PublisherId + ", '" + item.Type + "'");
        }

        public static void UpdateBook(Book book)//Update
        {
            DBClass.InsertCommand("exec spUpdateBOOK " + book.BookId + " , '" + book.Author + "'");
        }

        public static void UpdateJournal(Journal jor)//Update
        {
            DBClass.InsertCommand("exec spUpdateJOURNAL " + jor.JournalId + " , '" + jor.TimeRange + "'");
        }

        public static void UpdateNewspaper(Newspaper news)//Update
        {
            DBClass.InsertCommand("exec spUpdateNEWSPAPER " + news.NewspaperId + " , '" + news.Period + "'");
        }

        public static void UpdateVideo(Video video)//Update
        {
            DBClass.InsertCommand("exec spUpdateVIDEO " + video.VideoId + " , '" + video.Format + "'");
        }

        public static Item getItemByName(string name)
        {
            DataSet data = DBClass.SelectCommand("exec spGetItemByName '" + name + "'");
            if (data.Tables[0].Rows.Count == 0)
            {
                return null;
            }
            else
            {
                DataRow row = data.Tables[0].Rows[0];
                Item item = new Item();
                item.ItemId = Convert.ToInt16(row[0].ToString());
                item.Name = row[1].ToString();
                item.State = Convert.ToInt16(row[2].ToString());
                item.ProductionDate = row[3].ToString();
                item.CategoryId = Convert.ToInt16(row[4].ToString());
                item.PublisherId = Convert.ToInt16(row[5].ToString());
                item.Type = row[6].ToString();
                return item;
            }
        }

    }
}