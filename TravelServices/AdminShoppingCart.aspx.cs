using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminShoppingCart : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    // counts old shopping carts
    protected void countButton_Click(object sender, EventArgs e)
    {
      byte days = byte.Parse(daysList.SelectedItem.Value);
      int oldItems = ShoppingCartAccess.CountOldCarts(days);
      if (oldItems == -1)
        countLabel.Text = "Старите кошници не могат да бъдат преброени!";
      else if (oldItems == 0)
        countLabel.Text = "Няма стари кошници.";
      else
        countLabel.Text = "Има " + oldItems.ToString() +
                          " стари кошници.";
    }


    // deletes old shopping carts
    protected void deleteButton_Click(object sender, EventArgs e)
    {
      byte days = byte.Parse(daysList.SelectedItem.Value);
      bool resultQuery = ShoppingCartAccess.DeleteOldCarts(days);
      if (resultQuery)
      {
          countLabel.Text = "Старите кошници бяха премахнати от базата данни";
      }
      else
      {
          countLabel.Text = "Възникна проблем при изтриване на старите кошници";
      }
      
    }

}
