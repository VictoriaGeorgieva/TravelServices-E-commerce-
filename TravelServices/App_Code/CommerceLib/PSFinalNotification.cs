namespace CommerceLib
{
  /// <summary>
  /// 8th pipeline stage - used to send a notification email to
  /// the customer, confirming that the order has been shipped
  /// </summary>
  public class PSFinalNotification : IPipelineSection
  {
    private OrderProcessor orderProcessor;

    public void Process(OrderProcessor processor)
    {
      // set processor reference
      orderProcessor = processor;
      // audit
      orderProcessor.CreateAudit("Крайно известие започва.",
        20700);
      try
      {
        // send mail to customer
        orderProcessor.MailCustomer("Поръчката е изпратена.",
          GetMailBody());
        // audit
        orderProcessor.CreateAudit(
          "Изпращане на съобщение към клиента.", 20702);
        // update order status
        orderProcessor.Order.UpdateStatus(8);
      }
      catch
      {
        // mail sending failure
        throw new OrderProcessorException(
          "Възникна грешка при изпращане на съобщение към клиент.", 7);
      }
      // audit
      processor.CreateAudit("Крайно известие приключи.", 20701);
    }

    private string GetMailBody()
    {
      // construct message body
      string mail =
          "Поръчката ви беше изпратена успешно. Фактура за следните "
        + "продукти, ще ви бъде изпратена:\n\n"
        + orderProcessor.Order.OrderAsString
        + "\n\nФактурата е пратена за:\n\n"
        + orderProcessor.Order.CustomerAddressAsString
        + "\n\nНомер на поръчка:\n\n"
        + orderProcessor.Order.OrderID.ToString()
        + "\n\nБлагодарим, че пазарувахте при нас";
      return mail;
    }
  }
}
