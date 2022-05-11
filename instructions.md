# MariaDB installation

In this course, we use MariaDB as our Database Management System (DBMS). These instructions guide you to install MariaDB on a Windows computer using Cygwin.

1. Install Cygwin and MariaDB
 * Download Cygwin from [Cygwin website](https://www.cygwin.com/).
 * Double click the downloaded file and go to next until you are prompted to select the root install directory
   * Select a directory where Cygwin is installed (e.g. C:\cygwin64)
 * Click next until you are prompted to choose a download site
   * Select ftp://ftp.funet.fi from the list
 * Click next and then you are prompted with a list of packages you can install
   * If no packages are listed, select "Full" from "View" dropdown
   * select mysql and mysql-server
     * Install the version 10.3.14
 *  Click Next until Cygwin starts installing packages
 *  Close Cygwin installer by clicking "Finish"
2. Configure MariaDB
 * Open Cygwin
 * Run `mysql_install_db` to run a configuration script
 * Start MariaDB by running `mysqld_safe &`
   * "&" at the end of the command means that we are running MariaDB in the background
   * This allows us to use command line to run other applications while MariaDB remains in the background
 * After running MariaDB for the first time, we need to secure our installation
   * Run `mysql_secure_installation`
     * Set a password for the "root" user
     * Disable root's remote login
     * Delete the "test" database
