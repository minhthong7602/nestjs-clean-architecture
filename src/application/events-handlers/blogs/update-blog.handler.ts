import { EventsHandler, IEventHandler } from "@nestjs/cqrs";
import { BlogUpdateEvent } from "src/domain/events/blogs/update-blog.event";

@EventsHandler(BlogUpdateEvent)
export class BlogUpdateHandler implements IEventHandler<BlogUpdateEvent> {
  async handle(event: BlogUpdateEvent) {
    console.log("BlogUpdateEvent Processing...", event);
    await new Promise(resolve => setTimeout(resolve, 3000));
    console.log("BlogUpdateEvent Done...");
  }
}