export class BaseEvent {
  public readonly eventCreated: Date;
  constructor(
    public readonly eventName: string
  ) {
    this.eventCreated = new Date();
  }
}