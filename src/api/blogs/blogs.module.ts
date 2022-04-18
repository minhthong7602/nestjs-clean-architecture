import { MiddlewareConsumer, Module } from '@nestjs/common';
import { BlogsController } from './blogs.controller';
import { QueriesModule } from 'src/application/queries/queries.module';
import { CommandsModule } from 'src/application/commands/commands.module';
import { CqrsModule } from '@nestjs/cqrs';
import { LoggerMiddleware } from 'src/application/core/middlewares/logger.middleware';
import { EventLogAccessRepository } from 'src/infrastructure/repositories/event-log-access.repository';
import { TypeOrmModule } from '@nestjs/typeorm';
import { EventsHandlersModule } from 'src/application/events-handlers/events-handlers.module';

@Module({
  imports: [
    TypeOrmModule.forFeature([EventLogAccessRepository]),
    QueriesModule,
    CommandsModule,
    EventsHandlersModule,
    CqrsModule],
  controllers: [BlogsController]
})
export class BlogsModule {
  configure(consumer: MiddlewareConsumer) {
    consumer
     .apply(LoggerMiddleware)
     .forRoutes(BlogsController);
  }
}
