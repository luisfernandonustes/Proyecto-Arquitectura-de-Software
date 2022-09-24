using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaAccesoDatos
{
    public class Conexion
    {
        #region "PATRON SINGLETON"
        private static Conexion conexion = null;
        private Conexion() { }
        public static Conexion getInstance()
        {
            if (conexion == null)
            {
                conexion = new Conexion();
            }
            return conexion;
        }
        #endregion

        public SqlConnection ConexionBD()
        {
            SqlConnection conexion = new SqlConnection();
            conexion.ConnectionString = "workstation id=CentroMedico.mssql.somee.com;packet size=4096;user id=fer2_SQLLogin_1;pwd=juivyyynhe;data source=CentroMedico.mssql.somee.com;persist security info=False;initial catalog=CentroMedico";
            return conexion;
        }
    }
}
