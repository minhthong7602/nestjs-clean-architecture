import { Module, MiddlewareConsumer } from '@nestjs/common';
import { CqrsModule } from '@nestjs/cqrs';
import { UsersController } from './users.controller';
import { LoggerMiddleware } from 'src/application/core/middlewares/logger.middleware';
import { CommandsModule } from 'src/application/commands/commands.module';
import { QueriesModule } from 'src/application/queries/queries.module';
import { TypeOrmModule } from '@nestjs/typeorm';
import { EventLogAccessRepository } from 'src/infrastructure/repositories/event-log-access.repository';

@Module({
  imports: [
    TypeOrmModule.forFeature([EventLogAccessRepository]),
    QueriesModule,
    CommandsModule,
    CqrsModule],
  controllers: [UsersController]
})
export class UsersModule {
  configure(consumer: MiddlewareConsumer) {
    consumer
     .apply(LoggerMiddleware)
     .forRoutes(UsersController);
  }
}
