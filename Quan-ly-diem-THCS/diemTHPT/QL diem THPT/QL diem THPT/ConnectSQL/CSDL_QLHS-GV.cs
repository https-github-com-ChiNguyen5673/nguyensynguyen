using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;


namespace QL_diem_THPT.ConnectSQL
{
    class CSDL_QLHS_GV
    {
        protected SqlConnection conn = new SqlConnection(@"Data Source=DESKTOP-E22D8P0\SQLEXPRESS;Initial Catalog=QL_HS_GV;Integrated Security=True");
    }
}
