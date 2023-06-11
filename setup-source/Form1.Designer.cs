namespace MQL_SDK_INSTALLER
{
    partial class Main : Form
    {
        /// <summary>
        ///  Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        ///  Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        ///  Required method for Designer support - do not modify
        ///  the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Main));
            label1 = new Label();
            label2 = new Label();
            mt4 = new CheckBox();
            mt5 = new CheckBox();
            mt4Path = new SaveFileDialog();
            mt5Path = new SaveFileDialog();
            findPath4 = new Button();
            findPath5 = new Button();
            listBox1 = new ListBox();
            install = new Button();
            SuspendLayout();
            // 
            // label1
            // 
            label1.AutoSize = true;
            label1.Font = new Font("Segoe UI", 12F, FontStyle.Bold, GraphicsUnit.Point);
            label1.ForeColor = SystemColors.ButtonHighlight;
            label1.Location = new Point(314, 22);
            label1.Name = "label1";
            label1.Size = new Size(59, 21);
            label1.TabIndex = 0;
            label1.Text = "SETUP";
            label1.TextAlign = ContentAlignment.MiddleCenter;
            // 
            // label2
            // 
            label2.AutoSize = true;
            label2.ForeColor = SystemColors.Control;
            label2.Location = new Point(21, 60);
            label2.Name = "label2";
            label2.Size = new Size(160, 15);
            label2.TabIndex = 1;
            label2.Text = "Select the Metatrader Version";
            // 
            // mt4
            // 
            mt4.AutoSize = true;
            mt4.ForeColor = Color.Cornsilk;
            mt4.Location = new Point(22, 85);
            mt4.Name = "mt4";
            mt4.Size = new Size(93, 19);
            mt4.TabIndex = 2;
            mt4.Text = "Metatrader 4";
            mt4.UseVisualStyleBackColor = true;
            mt4.CheckedChanged += mt4_CheckedChanged;
            // 
            // mt5
            // 
            mt5.AutoSize = true;
            mt5.ForeColor = Color.Cornsilk;
            mt5.Location = new Point(22, 114);
            mt5.Name = "mt5";
            mt5.Size = new Size(96, 19);
            mt5.TabIndex = 3;
            mt5.Text = "Metatrader 5 ";
            mt5.UseVisualStyleBackColor = true;
            mt5.CheckedChanged += mt5_CheckedChanged;
            // 
            // mt4Path
            // 
            mt4Path.FileName = "Mql_Sdk";
            // 
            // mt5Path
            // 
            mt5Path.FileName = "Mql_Sdk";
            // 
            // findPath4
            // 
            findPath4.Location = new Point(128, 83);
            findPath4.Name = "findPath4";
            findPath4.Size = new Size(75, 23);
            findPath4.TabIndex = 4;
            findPath4.Text = "Find Path";
            findPath4.UseVisualStyleBackColor = true;
            findPath4.Visible = false;
            findPath4.Click += findPath4_Click;
            // 
            // findPath5
            // 
            findPath5.Location = new Point(128, 112);
            findPath5.Name = "findPath5";
            findPath5.Size = new Size(75, 23);
            findPath5.TabIndex = 5;
            findPath5.Text = "Find Path";
            findPath5.UseVisualStyleBackColor = true;
            findPath5.Visible = false;
            findPath5.Click += findPath5_Click;
            // 
            // listBox1
            // 
            listBox1.BackColor = SystemColors.MenuHighlight;
            listBox1.BorderStyle = BorderStyle.FixedSingle;
            listBox1.ForeColor = SystemColors.Window;
            listBox1.FormattingEnabled = true;
            listBox1.ItemHeight = 15;
            listBox1.Location = new Point(2, 159);
            listBox1.Name = "listBox1";
            listBox1.Size = new Size(679, 287);
            listBox1.TabIndex = 6;
            listBox1.Visible = false;
            // 
            // install
            // 
            install.Location = new Point(506, 98);
            install.Name = "install";
            install.Size = new Size(75, 23);
            install.TabIndex = 8;
            install.Text = "Install";
            install.UseVisualStyleBackColor = true;
            install.Visible = false;
            install.Click += install_Click;
            // 
            // Main
            // 
            AutoScaleDimensions = new SizeF(7F, 15F);
            AutoScaleMode = AutoScaleMode.Font;
            BackColor = SystemColors.HotTrack;
            ClientSize = new Size(682, 450);
            Controls.Add(install);
            Controls.Add(listBox1);
            Controls.Add(findPath5);
            Controls.Add(findPath4);
            Controls.Add(mt5);
            Controls.Add(mt4);
            Controls.Add(label2);
            Controls.Add(label1);
            Icon = (Icon)resources.GetObject("$this.Icon");
            Name = "Main";
            Text = "MQL SDK Installer";
            ResumeLayout(false);
            PerformLayout();
        }

        #endregion

        private Label label1;
        private Label label2;
        private CheckBox mt4;
        private CheckBox mt5;
        private SaveFileDialog mt4Path;
        private SaveFileDialog mt5Path;
        private Button findPath4;
        private Button findPath5;
        private ListBox listBox1;
        private Button install;
    }
}