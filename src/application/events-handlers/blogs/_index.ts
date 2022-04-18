import { BlogUpdateHandler } from 'src/application/events-handlers/blogs/update-blog.handler';
import { BlogSendPushHandler } from 'src/application/events-handlers/blogs/send-push-update.handler';

export const BlogsEventHandlers = [
  BlogUpdateHandler,
  BlogSendPushHandler
];
