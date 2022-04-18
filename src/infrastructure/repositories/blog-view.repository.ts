import { EntityRepository } from 'typeorm';
import { BlogView } from 'src/domain/entities/blog-view.entity';
import { BaseRepository } from 'src/infrastructure/repositories/base.repository';

@EntityRepository(BlogView)
export class BlogViewRepository extends BaseRepository<BlogView> {

}

