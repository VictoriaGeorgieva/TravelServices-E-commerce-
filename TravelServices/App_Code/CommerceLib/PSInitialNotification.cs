namespace CommerceLib
{
  /// <summary>
  /// 1st pipeline stage - used to send a notification email to
  /// the customer, confirming that the order has been received
  /// </summary>
  public class PSInitialNotification : IPipelineSection
  {
    private OrderProcessor orderProcessor;

    public void Process(OrderProcessor processor)
    {
      // set processor reference
      orderProcessor = processor;
      // audit
      orderProcessor.CreateAudit("Начално известие започна.", 20000);

      try
      {
        // send mail to customer
        orderProcessor.MailCustomer("Поръчката е получена.", GetMailBody());
        // audit
        orderProcessor.CreateAudit(
          "Изпращане на известие по ел.поща към клиент.", 20002);
        // update order status
        orderProcessor.Order.UpdateStatus(1);
        // continue processing
        orderProcessor.ContinueNow = true;
      }
      catch
      {
        // mail sending failure
        throw new OrderProcessorException(
          "Греща при изпращане на известие към клиент.", 0);
      }
      // audit
      processor.CreateAudit("Началното известие приключи.", 20001);
    }

    private string GetMailBody()
    {
      // construct message body
      string mail;
      mail = "Благодарим за вашата поръчка! Продуктите, които "
           + "поръчахте са следните:\n\n"
           + orderProcessor.Order.OrderAsString
           + "\n\nВашата поръчка ще бъде изпратена на:\n\n"
           + orderProcessor.Order.CustomerAddressAsString
           + "\n\nНомер на поръчката:\n\n"
           + orderProcessor.Order.OrderID.ToString()
           + "\n\nЩе получите писмо за потвърждение когато тази "
           + "поръчка бъде изпратена. Благодарим Ви за пазаруването при нас!";
      return mail;
    }
  }
}
