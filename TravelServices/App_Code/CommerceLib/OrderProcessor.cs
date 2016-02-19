using System;

namespace CommerceLib
{
  /// <summary>
  /// Main class, used to obtain order information,
  /// run pipeline sections, audit orders, etc.
  /// </summary>
  public class OrderProcessor
  {
    internal IPipelineSection CurrentPipelineSection;
    internal bool ContinueNow;
    internal CommerceLibOrderInfo Order;

    public OrderProcessor(string orderID)
    {
      // get order
      Order = CommerceLibAccess.GetOrder(orderID);
    }

    public OrderProcessor(CommerceLibOrderInfo orderToProcess)
    {
      // get order
      Order = orderToProcess;
    }

    public void Process()
    {

      // configure processor
      ContinueNow = true;

      // log start of execution
      CreateAudit("Изпълнението на поръчката започна.", 10000);

      // process pipeline section
      try
      {
        while (ContinueNow)
        {
          ContinueNow = false;
          GetCurrentPipelineSection();
          CurrentPipelineSection.Process(this);
        }
      }
      catch (OrderProcessorException ex)
      {
        MailAdmin("Възникна грешка при изпълнението на поръчката.",
          ex.Message, ex.SourceStage);
        CreateAudit("Възникна грешка при изпълнението на поръчката.", 10002);
        throw new OrderProcessorException(
          "Възникна грешка, поръчката е прекъсната. "
          + "Детайлите за изпратени към ел. поща на администратор.", 100);
      }
      catch (Exception ex)
      {
          MailAdmin("Възникна грешка при изпълнението на поръчката.", ex.Message,
          100);
          CreateAudit("Възникна грешка при изпълнението на поръчката.", 10002);
        throw new OrderProcessorException(
          "Непозната грешка, поръчката е прекъсната. "
          + "Детайлите за изпратени към ел. поща на администратор.", 100);
      }
      finally
      {
        CommerceLibAccess.CreateAudit(Order.OrderID,
          "Изпълнението на поръчката е приключено.", 10001);
      }
    }

    public void CreateAudit(string message, int messageNumber)
    {
      CommerceLibAccess.CreateAudit(Order.OrderID, message,
        messageNumber);
    }


    public void MailAdmin(string subject, string message,
      int sourceStage)
    {
      OrderProcessorMailer.MailAdmin(Order.OrderID, subject,
        message, sourceStage);
    }

    private void GetCurrentPipelineSection()
    {
      // select pipeline section to execute based on order status
      switch (Order.Status)
      {
        case 0:
          CurrentPipelineSection = new PSInitialNotification();
          break;
        case 1:
          CurrentPipelineSection = new PSCheckFunds();
          break;
        case 2:
          CurrentPipelineSection = new PSCheckStock();
          break;
        case 3:
          CurrentPipelineSection = new PSStockOK();
          break;
        case 4:
          CurrentPipelineSection = new PSTakePayment();
          break;

        case 5:
          CurrentPipelineSection = new PSShipGoods();
          break;
        case 6:
          CurrentPipelineSection = new PSShipOK();
          break;
        case 7:
          CurrentPipelineSection = new PSFinalNotification();
          break;
        case 8:
          throw new OrderProcessorException(
            "Поръчката е вече завършена.", 100);
        default:
          throw new OrderProcessorException(
            "Опит за достъпване на непознат съобщителен канал.", 100);
      }
    }

    public void MailCustomer(string subject, string message)
    {
      OrderProcessorMailer.MailCustomer(Order.Customer, subject, message);
    }

    public void MailSupplier(string subject, string message)
    {
      OrderProcessorMailer.MailSupplier(subject, message);
    }

  }
}
