using System.Diagnostics;
using System.IO;

namespace MQL_SDK_INSTALLER
{
    public partial class Main : Form
    {
        private string baseFolder4 = "";
        private string baseFolder5 = "";
        private List<string> consoleText = new List<string>();

        public Main()
        {
            InitializeComponent();
        }

        //Checked MT4 checkbox
        private void mt4_CheckedChanged(object sender, EventArgs e)
        {
            if (mt4.Checked)
            {
                findPath4.Visible = true;
                findPath4.Enabled = true;
                baseFolder4 = "";
            }
            else
            {
                findPath4.Visible = false;
            }

            install.Visible = true;
        }

        //Checked MT5 checkbox
        private void mt5_CheckedChanged(object sender, EventArgs e)
        {
            if (mt5.Checked)
            {
                findPath5.Visible = true;
                findPath5.Enabled = true;
                baseFolder5 = "";
            }
            else
            {
                findPath5.Visible = false;
            }

            install.Visible = true;
        }

        //Clicked Find Path for MT4
        private void findPath4_Click(object sender, EventArgs e)
        {
            MessageBox.Show("Go to the MQL4 folder path and click save.", "Save it in the main MQL4 folder");
            mt4Path.ShowDialog(this);

            //Check the path
            string meta4Path = mt4Path.FileName;

            //Verify the path and extract the base folder
            int index = meta4Path.IndexOf("MQL4");

            if (index == -1)
            {
                MessageBox.Show("The path provided is not the MQL4 main folder, try again", "ERROR", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            else
            {
                baseFolder4 = meta4Path.Substring(0, index + "MQL4".Length);
                findPath4.Enabled = false;
            }
        }

        //Clicked Find Path for MT5
        private void findPath5_Click(object sender, EventArgs e)
        {
            MessageBox.Show("Go to the MQL5 folder path and click save.", "Save it in the main MQL5 folder");
            mt5Path.ShowDialog(this);

            //Check the path
            string meta5Path = mt5Path.FileName;

            //Verify the path and extract the base folder
            int index = meta5Path.IndexOf("MQL5");

            if (index == -1)
            {
                MessageBox.Show("The path provided is not the MQL5 main folder, try again", "ERROR", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            else
            {
                baseFolder5 = meta5Path.Substring(0, index + "MQL5".Length);
                findPath5.Enabled = false;
            }
        }

        //Install click
        private void install_Click(object sender, EventArgs e)
        {
            //Check for data validations
            if (mt4.Checked && baseFolder4 == "")
            {
                MessageBox.Show("The Metatrader 4 path was not selected or is invalid but the MT4 checkbox is checked", "ERROR", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }
            if (mt5.Checked && baseFolder5 == "")
            {
                MessageBox.Show("The Metatrader 5 path was not selected or is invalid but the MT5 checkbox is checked", "ERROR", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }

            listBox1.Visible = true;

            //Handle MT4
            if (mt4.Checked)
            {
                string includePath = Path.Combine(baseFolder4, "Include");
                includePath = Path.Combine(includePath, "SDK-MQL");
                string libsPath = Path.Combine(baseFolder4, "Libraries");
                string thisFolder = AppDomain.CurrentDomain.BaseDirectory;

                Directory.CreateDirectory(includePath);
                string source = Path.Combine(thisFolder, "modules");

                CopyFolder(source, includePath);

                source = Path.Combine(thisFolder, "libraries");

                CopyFolder(source, libsPath);
            }

            if (mt5.Checked)
            {
                string includePath = Path.Combine(baseFolder5, "Include");
                includePath = Path.Combine(includePath, "SDK-MQL");
                string libsPath = Path.Combine(baseFolder5, "Libraries");
                string thisFolder = AppDomain.CurrentDomain.BaseDirectory;

                Directory.CreateDirectory(includePath);
                string source = Path.Combine(thisFolder, "modules");

                CopyFolder(source, includePath);

                source = Path.Combine(thisFolder, "libraries");

                CopyFolder(source, libsPath);
            }

            consoleText.Add("All files has been copied successfully!");
            UpdateConsole();

            install.Enabled = false;
        }

        private void CopyFolder(string sourceFolder, string destinationFolder)
        {
            DirectoryInfo dir = new DirectoryInfo(sourceFolder);
            DirectoryInfo[] dirs = dir.GetDirectories();

            // Copy the files
            FileInfo[] files = dir.GetFiles();
            foreach (FileInfo file in files)
            {
                string destinationFilePath = Path.Combine(destinationFolder, file.Name);
                file.CopyTo(destinationFilePath, true);

                consoleText.Add("Copied: " + file.Name);
                UpdateConsole();
            }

            // Recursively copy the subdirectories
            foreach (DirectoryInfo subdir in dirs)
            {
                string subDestinationFolder = Path.Combine(destinationFolder, subdir.Name);
                Directory.CreateDirectory(subDestinationFolder); // Create subdirectory if it doesn't exist
                CopyFolder(subdir.FullName, subDestinationFolder);
            }
        }

        private void UpdateConsole()
        {
            listBox1.Items.Clear(); // Clear existing items

            // Add each string in the consoleText list to the ListBox
            foreach (string text in consoleText)
            {
                listBox1.Items.Add(text);
            }

            // Scroll to the bottom to show the latest text
            if (listBox1.Items.Count > 0)
            {
                listBox1.SelectedIndex = listBox1.Items.Count - 1;
            }
        }
    }
}