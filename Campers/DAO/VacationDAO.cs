using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.OracleClient;

namespace LabTest1
{
    public class VacationDAO
    {
        private string UserName { get; set; }
        private string Password { get; set; }

        public VacationDAO(string UserName, string Password)
        {
            this.UserName = UserName;
            this.Password = Password;
        }
        public int GetTotal(string location)
        {
            OracleConnection conn = new OracleConnection(String.Format("Data Source=Neptune; User Id={0}; Password={1}", UserName, Password));
            OracleCommand cmd = new OracleCommand("SELECT SUM(num_vacationers) as total_vacationers FROM booking INNER JOIN package ON booking.resort_name = package.resort_name WHERE location = :location", conn);

            cmd.Parameters.AddWithValue(":location", location);
            int total = 0;
            conn.Open();
            try
            {
                if (cmd.ExecuteScalar() != DBNull.Value)
                {
                    total = Convert.ToInt32(cmd.ExecuteScalar());
                }
            }
            finally
            {
                conn.Close();
            }
            return total;
        }
    }
}