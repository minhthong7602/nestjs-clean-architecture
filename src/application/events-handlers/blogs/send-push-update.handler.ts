import { EventsHandler, IEventHandler } from "@nestjs/cqrs";
import { BlogSendPushEvent } from "src/domain/events/blogs/send-push-update.event";

@EventsHandler(BlogSendPushEvent)
export class BlogSendPushHandler implements IEventHandler<BlogSendPushEvent> {
  async handle(event: BlogSendPushEvent) {
    console.log("BlogSendPushEvent Processing...", event);
    await new Promise(resolve => setTimeout(resolve, 3000));
    console.log("BlogSendPushEvent Done...");
  }
}