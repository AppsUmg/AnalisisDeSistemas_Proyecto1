using System.Data;
using System.Data.SqlClient;
using System.Text;

namespace WEB_API_ANALISIS.Clases
{
    public class ClsApi
    {

        public static string connectionstring = "Data Source= umg2022.database.windows.net ; Initial Catalog= DB_UMG ; User = umg ; Password= Dev1234* ; app=WEB_API_ANALISIS";


        public static string setPutNote(Boolean isImportant,int number,string tittle,string description)
        {
            string Result = "";
            using (SqlConnection conn = new SqlConnection(connectionstring))
            {
                conn.Open();
                SqlDataAdapter da = new SqlDataAdapter();
                DataTable dt = new DataTable();
                da.SelectCommand = new SqlCommand("[USP_SET_PUT_NOTE]", conn);
                da.SelectCommand.CommandTimeout = 0;
                da.SelectCommand.Parameters.AddWithValue("@isImportant", isImportant);
                da.SelectCommand.Parameters.AddWithValue("@number", number);
                da.SelectCommand.Parameters.AddWithValue("@title", tittle);
                da.SelectCommand.Parameters.AddWithValue("@description", description);
                da.SelectCommand.CommandType = CommandType.StoredProcedure;
                da.Fill(dt);
                Result = CreateJson(dt);
                conn.Dispose();
                conn.Close();
            }
            return Result;
        }

        public static string setNote(int Id,Boolean isImportant, int number, string tittle, string description)
        {
            string Result = "";
            using (SqlConnection conn = new SqlConnection(connectionstring))
            {
                conn.Open();
                SqlDataAdapter da = new SqlDataAdapter();
                DataTable dt = new DataTable();
                da.SelectCommand = new SqlCommand("[USP_SET_NOTE]", conn);
                da.SelectCommand.CommandTimeout = 0;
                da.SelectCommand.Parameters.AddWithValue("@id", isImportant);
                da.SelectCommand.Parameters.AddWithValue("@isImportant", isImportant);
                da.SelectCommand.Parameters.AddWithValue("@number", number);
                da.SelectCommand.Parameters.AddWithValue("@title", tittle);
                da.SelectCommand.Parameters.AddWithValue("@description", description);
                da.SelectCommand.CommandType = CommandType.StoredProcedure;
                da.Fill(dt);
                Result = CreateJson(dt);
                conn.Dispose();
                conn.Close();
            }
            return Result;
        }

        public static string getNotes()
        {
            string Result = "";
            using (SqlConnection conn = new SqlConnection(connectionstring))
            {
                conn.Open();
                SqlDataAdapter da = new SqlDataAdapter();
                DataTable dt = new DataTable();
                da.SelectCommand = new SqlCommand("[USP_GET_NOTES]", conn);
                da.SelectCommand.CommandTimeout = 0;
                da.SelectCommand.CommandType = CommandType.StoredProcedure;
                da.Fill(dt);
                Result = CreateJson(dt);
                conn.Dispose();
                conn.Close();
            }
            return Result;
        }

        public static string getNote(int id)
        {
            string Result = "";
            using (SqlConnection conn = new SqlConnection(connectionstring))
            {
                conn.Open();
                SqlDataAdapter da = new SqlDataAdapter();
                DataTable dt = new DataTable();
                da.SelectCommand = new SqlCommand("[USP_GET_NOTE]", conn);
                da.SelectCommand.CommandTimeout = 0;
                da.SelectCommand.Parameters.AddWithValue("@id", id);
                da.SelectCommand.CommandType = CommandType.StoredProcedure;
                da.Fill(dt);
                Result = CreateJson(dt);
                conn.Dispose();
                conn.Close();
            }
            return Result;
        }

        public static string deleteNote(int id)
        {
            string Result = "";
            using (SqlConnection conn = new SqlConnection(connectionstring))
            {
                conn.Open();
                SqlDataAdapter da = new SqlDataAdapter();
                DataTable dt = new DataTable();
                da.SelectCommand = new SqlCommand("[USP_DELETE_NOTE]", conn);
                da.SelectCommand.CommandTimeout = 0;
                da.SelectCommand.Parameters.AddWithValue("@id", id);
                da.SelectCommand.CommandType = CommandType.StoredProcedure;
                da.Fill(dt);
                Result = CreateJson(dt);
                conn.Dispose();
                conn.Close();
            }
            return Result;
        }

        public static string CreateJson(DataTable table)
        {
            var JSONString = new StringBuilder();
            if (table.Rows.Count > 0)
            {
                JSONString.Append("[");
                for (int i = 0; i < table.Rows.Count; i++)
                {
                    JSONString.Append("{");
                    for (int j = 0; j < table.Columns.Count; j++)
                    {
                        if (j < table.Columns.Count - 1)
                        {
                            JSONString.Append("\"" + table.Columns[j].ColumnName.ToString() + "\":" + "\"" + table.Rows[i][j].ToString() + "\",");
                        }
                        else if (j == table.Columns.Count - 1)
                        {
                            JSONString.Append("\"" + table.Columns[j].ColumnName.ToString() + "\":" + "\"" + table.Rows[i][j].ToString() + "\"");
                        }
                    }
                    if (i == table.Rows.Count - 1)
                    {
                        JSONString.Append("}");
                    }
                    else
                    {
                        JSONString.Append("},");
                    }
                }
                JSONString.Append("]");
            }
            return JSONString.ToString();
        }






















    }

}
