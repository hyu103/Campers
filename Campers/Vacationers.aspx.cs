using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LabTest1
{
    public partial class Vacationers : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnHowMany_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                LoginInfo login = (LoginInfo)Session["login"];
                VacationDAO vacationDAO = new VacationDAO(login.UserName, login.Password);

                int totalVacationers = vacationDAO.GetTotal(tbLocation.Text);
                lblResult.Text = String.Format("There are {0} vacationers booked for {1}", totalVacationers, tbLocation.Text);
            }
        }
    }
}