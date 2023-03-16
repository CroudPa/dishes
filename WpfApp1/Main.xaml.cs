using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace WpfApp1
{
    /// <summary>
    /// Логика взаимодействия для Main.xaml
    /// </summary>
    public partial class Main : Window
    {
        public Main()
        {
            InitializeComponent();

            if(GlobalFields.Login is null)
            {
                this.CloseToLogin();
            }


            LoadUserData();
        }

        public void CloseToLogin()
        {
            Login l = new Login();
            l.Show();
            this.Close();
        }

        public void LoadUserData()
        {
            using (SqlConnection con = new SqlConnection(GlobalFields.CONNECTION))
            {
                con.Open();
                var reader = new SqlCommand($"SELECT UserSurname,UserName, RoleName FROM [User] JOIN [Role] ON [Role].RoleID = [UserRole] Where UserLogin='{GlobalFields.Login}'", con).ExecuteReader();

                while (reader.Read())
                {
                    GlobalFields.Role = reader.GetString(2);
                    roleLabel.Content = $"Роль: {reader.GetString(2)}";
                    nameLabel.Content = $"Имя: {reader.GetString(1)}";
                    surnameLabel.Content = $"Фамилия: {reader.GetString(0)}";
                }

                // 
                // 
            }
                
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            this.CloseToLogin();
        }
    }
}
