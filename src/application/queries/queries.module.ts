import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { CqrsModule } from '@nestjs/cqrs';
import { BlogsRepository } from 'src/infrastructure/repositories/blogs.repository';
import { TagsRepository } from 'src/infrastructure/repositories/tags.repository';
import { BlogTagMappingRepository } from 'src/infrastructure/repositories/blog-tag-mapping.repository';
import { BlogCategoryMappingRepository } from 'src/infrastructure/repositories/blog-category-mapping.repository';
import { EventLogAccessRepository } from 'src/infrastructure/repositories/event-log-access.repository';
import { BlogQueryHandlers } from 'src/application/queries/blogs/_index';
import { CommonService } from 'src/application/core/ultils/common.service';
@Module({
  imports: [TypeOrmModule.forFeature([BlogsRepository, BlogTagMappingRepository, BlogCategoryMappingRepository, EventLogAccessRepository, TagsRepository]), CqrsModule],
  providers: [
    ...BlogQueryHandlers,
    CommonService
  ]
})
export class QueriesModule {
}
