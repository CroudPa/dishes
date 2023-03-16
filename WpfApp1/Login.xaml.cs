using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Resources;
using System.Text;
using System.Threading.Tasks;
using System.Timers;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace WpfApp1
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class Login : Window
    {
        public int attempts = 0;
        public Login()
        {
            InitializeComponent();
            if (Properties.Resources.testEnv == "true")
            {
                LoginBox.Text = "o@outlook.com";
                PassBox.Password = "2L6KZG";
            }

        }

        async private void setBadCaptcha()
        {
            MessageBox.Show("Проверка не пройдена.");
            logButton.IsEnabled = false;
            await Task.Delay(10000);
            logButton.IsEnabled = true;
            
        }
        public void onAttempt()
        {
            
            if(this.attempts >= 1)
            {
                MessageBox.Show("Ошибка в логине или пароле.");
                Captcha c = new Captcha();
                var a = c.ShowDialog().Value;
                if (!a)
                {
                    this.setBadCaptcha();
                }
                if (a)
                {
                    bool result = c.accepted;
                    if (!result)
                    {
                        this.setBadCaptcha();
                    }
                    else
                    {
                        this.attempts = 0;
                    }
                }
            }
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            this.onAttempt();
            bool founded = false;

            SqlConnection MyConnection = new SqlConnection(GlobalFields.CONNECTION);
            DataTable table = new DataTable();
            SqlDataAdapter adapter = new SqlDataAdapter();

            SqlCommand command =
                new SqlCommand("SELECT * FROM [User] WHERE UserLogin = @uL and UserPassword = @uP", MyConnection);
            command.Parameters.Add("@uL", SqlDbType.VarChar).Value = LoginBox.Text;
            command.Parameters.Add("@uP", SqlDbType.VarChar).Value = PassBox.Password;
            adapter.SelectCommand = command;
            adapter.Fill(table);


            if(table.Rows.Count > 0)
            {
                founded = true;
            }

            if (!founded)
            {
                this.attempts++;
                this.onAttempt();
            }
            else
            {
                Main m = new Main();
                m.Show();
                this.Close();
            }
           
        }
    }
}
