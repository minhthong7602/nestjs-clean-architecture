import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { CqrsModule } from '@nestjs/cqrs';
import { UsersRepository } from 'src/infrastructure/repositories/users.repository';
import { BlogsRepository } from 'src/infrastructure/repositories/blogs.repository';
import { TagsRepository } from 'src/infrastructure/repositories/tags.repository';
import { BlogTagMappingRepository } from 'src/infrastructure/repositories/blog-tag-mapping.repository';
import { BlogCategoryMappingRepository } from 'src/infrastructure/repositories/blog-category-mapping.repository';
import { EventLogAccessRepository } from 'src/infrastructure/repositories/event-log-access.repository';
import { BlogsEventHandlers } from 'src/application/events-handlers/blogs/_index';
import { CommonService } from 'src/application/core/ultils/common.service';
import { SecurityService } from 'src/application/core/securities/security.service';

@Module({
  imports: [
  TypeOrmModule.forFeature(
  [
    BlogsRepository, 
    BlogTagMappingRepository,
    BlogCategoryMappingRepository,
    EventLogAccessRepository,
    UsersRepository,
    TagsRepository
  ]),
  CqrsModule],
  providers: [
    ...BlogsEventHandlers,
    CommonService,
    SecurityService
  ]
})
export class EventsHandlersModule {
}
