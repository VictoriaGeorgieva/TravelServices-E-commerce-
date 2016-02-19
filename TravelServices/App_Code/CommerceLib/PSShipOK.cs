namespace CommerceLib
{
  /// <summary>
  /// 7th pipeline stage - after confirmation that supplier has
  /// shipped goods
  /// </summary>
  public class PSShipOK : IPipelineSection
  {
    private OrderProcessor orderProcessor;

    public void Process(OrderProcessor processor)
    {
      // set processor reference
      orderProcessor = processor;
      // audit
      orderProcessor.CreateAudit("Изпращането започна.", 20600);
      // set order shipment date
      orderProcessor.Order.SetDateShipped();
      // audit
      orderProcessor.CreateAudit("Доставчика изпрати фактурата за поръчката.", 20602);
      // update order status
      orderProcessor.Order.UpdateStatus(7);
      // continue processing
      orderProcessor.ContinueNow = true;
      // audit
      processor.CreateAudit("Изпращането приключи.", 20601);
    }
  }
}
