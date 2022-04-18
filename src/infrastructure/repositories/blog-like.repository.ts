import { EntityRepository } from 'typeorm';
import { BlogLike } from 'src/domain/entities/blog-like.entity';
import { BaseRepository } from 'src/infrastructure/repositories/base.repository';

@EntityRepository(BlogLike)
export class BlogLikeRepository extends BaseRepository<BlogLike> {
  
}
