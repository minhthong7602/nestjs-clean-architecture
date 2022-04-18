import { BaseEvent } from "src/domain/events/base-event";

export class BlogSendPushEvent extends BaseEvent {
  constructor(
    public readonly eventName: string,
    public readonly blogId: number,
    public readonly title: string
  ) {
    super(eventName);
  }
}