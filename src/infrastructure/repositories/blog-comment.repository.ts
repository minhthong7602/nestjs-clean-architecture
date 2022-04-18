import { EntityRepository } from 'typeorm';
import { BlogComment } from 'src/domain/entities/blog-comment.entity';
import { BaseRepository } from 'src/infrastructure/repositories/base.repository';

@EntityRepository(BlogComment)
export class BlogCommentRepository extends BaseRepository<BlogComment> {
  
}
